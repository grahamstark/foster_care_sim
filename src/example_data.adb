with Ada.Strings.Unbounded;
with Text_Utils;
with Ada.Assertions;
with Ada.Containers;
with Ada.Text_IO;
with Maths_Functions ;

package body Example_Data is

   use Ada.Assertions;
   use Ada.Text_IO;
   package MF is new Maths_Functions( Real );

   function Get_One_Person( hh : Household; which_bu : Benefit_Unit_Number; which_pers : Person_Number ) return Person'Class is
   begin
      return hh.benefit_units( which_bu ).people( which_pers );
   end Get_One_Person;

    procedure Increment_Age( pers : in out Person ) is
    begin
      pers.age := pers.age + 1;
   end Increment_Age;

   procedure Delete_BU( hh : in out Household; buno : Benefit_Unit_Number ) is
   begin
      hh.num_benefit_units := hh.num_benefit_units - 1;
      for b in buno .. hh.num_benefit_units loop
         hh.benefit_units( b ) := hh.benefit_units( b+1 );
      end loop;
   end  Delete_BU;


   procedure Remove_From_BU( hh : in out Household;
      buno : Benefit_Unit_Number;
      pno : Person_Number ) is
     bu : Benefit_Unit renames hh.benefit_units( buno );
   begin
      bu.num_people := bu.num_people - 1;
      if( bu.num_people = 0 )then
         hh.Delete_BU( buno );
      else
         for p in pno .. bu.num_people loop
            bu.people( p ) := bu.people( p+1 );
         end loop;
      end if;
   end Remove_From_BU;

   procedure Find_Person( hh : Household; pid : Positive; buno : out Benefit_Unit_Number; pno : out Person_Number; found : out Boolean ) is
   begin
      found := False;
      buno := Benefit_Unit_Number'Last;
      pno := Person_Number'Last;
      for lbuno in 1 .. hh.num_benefit_units loop
         for lpno in 1 .. hh.benefit_units( lbuno ).num_people loop
            declare
               pers : Person renames hh.benefit_units( lbuno ).people( lpno );
            begin
               if( pers.pid = pid )then
                  buno := lbuno;
                  pno := lpno;
                  found := True;
                  return;
               end if;
             end;
         end loop;
      end loop;
   end Find_Person;

   function Find_Person( hh : Household; pid : Positive; found : out Boolean ) return Person'Class is
      pers : Person;
      buno : Benefit_Unit_Number;
      pno  : Person_Number;
   begin
      hh.Find_Person( pid, buno, pno, found );
      if( found )then
         return hh.benefit_units( buno ).people( pno );
      end if;
      return pers;
   end Find_Person;


   procedure Move_To_New_BU( hh : in out Household;
      buno : Benefit_Unit_Number;
      pno : Person_Number ) is
     nbu : constant Benefit_Unit_Number := hh.num_benefit_units + 1;
     pers : Person renames hh.benefit_units( buno ).people( pno );
   begin
      hh.num_benefit_units := nbu;
      -- pers.relationship := head; -- FIXME add relationship to HoH
      hh.benefit_units( nbu ).num_people := 1;
      hh.benefit_units( nbu ).people( 1 ) := pers;
      Remove_From_BU( hh, buno, pno );
   end Move_To_New_BU;

   function Event_String_Header( delim : Character; to_print : Positive ) return String is
   use Ada.Strings.Unbounded;
      s : Unbounded_String;
   begin
      for i in 1 .. to_print loop
         s := s & "Event" & i'Img & delim;
         -- if( i < to_print )then  s := s & delim; end if;
      end loop;
      return To_String( s );
   end Event_String_Header; 
   
   function To_String( events : Events_Set; to_print : Positive; delim : Character ) return String is
   use Ada.Strings.Unbounded;
   use Text_Utils;
      s : Unbounded_String;
      n : Natural := 1;
   begin
      for event of events loop
         s := s & event.name & delim;
         n := n + 1;
      end loop;
      for i in n .. to_print loop
         s := s & delim;
      end loop;
      return To_String( s );
   end To_String;

   procedure Accumulate_HH( hh : in out Household ) is
   begin
      for buno in 1 .. hh.num_benefit_units loop
         for pno in 1 .. hh.benefit_units( buno ).num_people loop
            declare
               pers : Person renames hh.benefit_units( buno ).people( pno );
            begin
               if( pers.education /= not_in_education )then
                  Inc( pers.years_in_education, 1.0 );
               end if;
               if pers.employment in full_time .. part_time then
                  Put_Line( "incrementing employment; pid is " & pers.pid'Img ); 
                  Inc( pers.years_in_work_this_spell, 1.0 );
                  Inc( pers.years_in_work_total, 1.0 );
               end if;
               if( pers.employment = unemployed )then
                  Inc( pers.years_unemployed_this_spell, 1.0 );
                  Inc( pers.years_unemployed_total, 1.0 );
               end if;
               if( pers.foster_status = currently_fostered )then
                  Inc( pers.years_fostered, 1.0 );
               end if;
            end;
         end loop;
      end loop;
   end Accumulate_HH;
      
   procedure Trigger_Events(
      hh            : in out Household;
      parents_hh    : out Household;
      events        : Events_Set'Class;
      target_pid    : Positive ) is
     target_bu : Benefit_Unit_Number;
     target_person : Person_Number;
     found : Boolean;
     use type Ada.Containers.Count_Type;
   begin
       for buno in 1 .. hh.num_benefit_units loop
          for pno in 1 .. hh.benefit_units( buno ).num_people loop
              declare
                 pers : Person renames hh.benefit_units( buno ).people( pno );
              begin
                 Increment_Age( pers );
                 if( pers.ends_fostering_this_period )then   
                    pers.foster_status := previously_fostered;
                    pers.relationship := other_relationship;
                    pers.ends_fostering_this_period := False;
                 end if;
                 if( pers.relationship in child .. foster_child ) and ( pers.age > 18 ) and ( pno > 1 )then
                    Move_To_New_BU( hh, buno, pno );
                 end if;
              end;
          end loop;
      end loop;
      if( events.Length > 0 )then 
         hh.Find_Person( target_pid, target_bu, target_person, found );
         Put_Line( "looking for " & target_pid'Img & " found bu " & target_bu'Img & " person " & target_person'Img );
         Assert( found, "no such person was found " & target_pid'Img );
         declare
            target_pers : Person renames hh.benefit_units( target_bu ).people( target_person );
         begin
            for event of events loop
               case event.event is
                 when age_1_year => null;
                 when start_fostering =>
                    target_pers.foster_status := currently_fostered;
                    target_pers.relationship := foster_child;
                 when leave_fostering =>
                    target_pers.ends_fostering_this_period := True;
                    -- target_pers.foster_status := previously_fostered;
                    -- target_pers.relationship := other_relationship;
                 when start_wiar => null;
                 when end_wiar => null;
                 when leave_school =>
                    target_pers.education := not_in_education;
                    if( target_pers.employment = in_education )then
                       target_pers.employment := unemployed;
                    end if;
                 when start_higher_education =>
                    Put_Line( "start_higher_education" );
                    target_pers.education := higher_education;
                    target_pers.employment := in_education;
                 when end_higher_education =>
                    Put_Line( "end_higher_education" );
                    target_pers.education := not_in_education;
                 when start_work =>
                    Put_Line( "Start Work age " & target_pers.age'Img ); 
                    Assert( target_pers.employment /= full_time, "already in f/t work" );
                    target_pers.hours_worked := 38*WEEKS_WORKED_PER_YEAR;
                    target_pers.wage_per_hour := Infer_Wage( target_pers );
                    target_pers.years_in_work_this_spell := 0.0;
                    -- end if;
                    target_pers.years_unemployed_this_spell := 0.0;
                    target_pers.employment := full_time;
                    target_pers.income( wages ) := Amount( target_pers.hours_worked ) * target_pers.wage_per_hour;
                 when leave_work =>
                    -- if( target_pers.employment /= unemployed )then
                    target_pers.years_unemployed_this_spell := 0.0;
                    -- end if;
                    target_pers.employment := unemployed;
                    target_pers.hours_worked := 0;
                    target_pers.wage_per_hour := 0.0;
                    target_pers.income( self_employment ) := 0.0;
                 when graduates =>
                    if( target_pers.highest_qualification < degree )then
                       target_pers.highest_qualification := degree;
                    end if; 
                 when completes_a_levels =>
                    if( target_pers.highest_qualification < a_level )then
                       target_pers.highest_qualification := a_level;
                    end if; 
                 when completes_gcses =>
                    if( target_pers.highest_qualification < gcse )then
                       target_pers.highest_qualification := gcse;
                    end if;
                 when wages_bump =>
                    target_pers.wage_scale := event.value;
                 when arbitrary_event => null;
                 when leave_household =>
                     declare
                        new_hh : Household;
                     begin
                        new_hh.num_benefit_units := 1;
                        target_pers.relationship := head;
                        -- FIXME move housing assumptions to 
                        -- procedure based on person
                        new_hh.housing( rent ) := Example_Data.ONE_BEDROOM_FLAT_SOCIAL_HOUSING*52.0;
                        new_hh.tenure := social_rented;
                        new_hh.benefit_units( 1 ).people( 1 ) := target_pers;
                        new_hh.benefit_units( 1 ).num_people := 1;
                        -- Housing
                        Remove_From_BU( hh, target_bu, target_person );
                        target_bu := 1;
                        target_person := 1;
                        parents_hh := hh;
                        hh := new_hh;
                     end;
                 end case;
            end loop;
         end;
      end if;
      for buno in 1 .. hh.num_benefit_units loop
          for pno in 1 .. hh.benefit_units( buno ).num_people loop
              declare
                 pers : Person renames hh.benefit_units( buno ).people( pno );
              begin
                 pers.wage_per_hour := Infer_Wage( pers );
                 Put_Line( "wage calculation hours " & To_String( pers.hours_worked ) & " wage " & To_String( pers.wage_per_hour ));
                 pers.income( wages ) := Amount( pers.hours_worked ) * pers.wage_per_hour;
              end;
           end loop;
      end loop;
      Accumulate_HH( hh );
      Accumulate_HH( parents_hh );
   end Trigger_Events;

   function To_String( pers : Person ) return String is
      use Ada.Strings.Unbounded;
      use Text_Utils;
      s : Unbounded_String;
   begin
      s := s & " PID           " & Integer'Image( pers.pid ) & LINE_BREAK;
      s := s & " age           " & Age_Range'Image( pers.age ) & LINE_BREAK;
      s := s & " gender        " & Gender_Type'Image( pers.gender ) & LINE_BREAK;
      s := s & " education     " & Education_Type'Image( pers.education ) & LINE_BREAK;
      s := s & " highest_qualification " & Qualification_Type'Image( pers.highest_qualification ) & LINE_BREAK;
      s := s & " employment    " & Employment_Status'Image( pers.employment ) & LINE_BREAK;
      s := s & " income        " & T_Incomes.To_String( T_Incomes.Abs_Amount_Array( pers.income )) & LINE_BREAK;
      s := s & " hours_worked  " & Work_Hours_Range'Image( pers.hours_worked ) & LINE_BREAK;
      s := s & " wage_per_hour " & To_String( pers.wage_per_hour ) & LINE_BREAK;
      s := s & " relationship  " & Relationship_Type'Image( pers.relationship ) & LINE_BREAK;
      s := s & " is_in_serps   " & Boolean'Image( pers.is_in_serps ) & LINE_BREAK;
      s := s & " foster_status " & Foster_Status_Type'Image( pers.foster_status ) & LINE_BREAK;
      -- state data
      -- state
      s := s & " years_fostered              " & To_String( pers.years_fostered ) & LINE_BREAK;
      s := s & " years_in_education          " & To_String( pers.years_in_education ) & LINE_BREAK;
      s := s & " years_in_work_this_spell    " & To_String( pers.years_in_work_this_spell ) & LINE_BREAK;
      s := s & " years_unemployed_this_spell " & To_String( pers.years_unemployed_this_spell ) & LINE_BREAK;
      s := s & " years_in_work_total         " & To_String( pers.years_in_work_total ) & LINE_BREAK;
      s := s & " years_unemployed_total      " & To_String( pers.years_unemployed_total ) & LINE_BREAK;
      return To_String( s );
   end To_String;
   
   function Summary_String_Header( delim : Character ) return String is
   begin
      return
       "pid" & delim &
       "age" & delim &
       "gender" & delim &
       "education" & delim &
       "highest qualification" & delim &
       "employment" & delim &
       "wages" & delim &
       "hours worked" & delim &
       "wage per hour" & delim &
       "relationship" & delim &
       "is in serps" & delim &
       "foster status" & delim &
       "years fostered" & delim &
       "years in education" & delim &
       "years in work this spell" & delim &
       "years unemployed this spell" & delim &
       "years in work total" & delim &
       "years unemployed total" & delim;
   end  Summary_String_Header;
   
   function Summary_String( pers : Person; delim :Character ) return String is
      use Ada.Strings.Unbounded;
      use Text_Utils;
      s : Unbounded_String;
   begin
      s := s & Integer'Image( pers.pid ) & DELIM;
      s := s & Age_Range'Image( pers.age ) & DELIM;
      s := s & Prettify_Image( Gender_Type'Image( pers.gender )) & DELIM;
      s := s & Prettify_Image( Education_Type'Image( pers.education )) & DELIM;
      s := s & Prettify_Image( Qualification_Type'Image( pers.highest_qualification )) & DELIM;
      s := s & Prettify_Image( Employment_Status'Image( pers.employment )) & DELIM;
      s := s & To_String( pers.income( wages )) & DELIM;
      s := s & Prettify_Image( Work_Hours_Range'Image( pers.hours_worked )) & DELIM;
      s := s & To_String( pers.wage_per_hour ) & DELIM;
      s := s & Prettify_Image( Relationship_Type'Image( pers.relationship )) & DELIM;
      s := s & Prettify_Image( Boolean'Image( pers.is_in_serps )) & DELIM;
      s := s & Prettify_Image( Foster_Status_Type'Image( pers.foster_status )) & DELIM;
      s := s & To_String( pers.years_fostered ) & DELIM;
      s := s & To_String( pers.years_in_education ) & DELIM;
      s := s & To_String( pers.years_in_work_this_spell ) & DELIM;
      s := s & To_String( pers.years_unemployed_this_spell ) & DELIM;
      s := s & To_String( pers.years_in_work_total ) & DELIM;
      s := s & To_String( pers.years_unemployed_total ) & DELIM;
      return To_String( s );
   end Summary_String;
   
   function To_String( bu : Benefit_Unit ) return String is
      use Ada.Strings.Unbounded;
      use Text_Utils;
      s : Unbounded_String;
   begin
      s := s & " Num People           " & Integer'Image( bu.num_people ) & LINE_BREAK;
      for i in 1 .. bu.num_people loop
         s := s & " Person " & Integer'Image( i ) & LINE_BREAK;
         s := s & To_String( bu.people( i ));
      end loop;
      return To_String( s );
   end To_String;

   function To_String( hh : Household ) return String is
      use Ada.Strings.Unbounded;
      use Text_Utils;
      s : Unbounded_String;
   begin
      s := s & " Num Benefit Units " & Integer'Image( hh.num_benefit_units ) & LINE_BREAK;
      for i in 1 .. hh.num_benefit_units loop
         s := s & " Benefit Unit " & Integer'Image( i ) & LINE_BREAK;
         s := s & To_String( hh.benefit_units( i ));
      end loop;
      return To_String( s );
   end To_String;
   
   function Summary_String( hh : Household; delim :Character ) return String is
      use Ada.Strings.Unbounded;
      use Text_Utils;
      s : Unbounded_String;
   begin
      s := s & Integer'Image( hh.num_benefit_units ) & DELIM;
      return To_String( s );
   end Summary_String;
      
   function Minimum_Wage( p : Person ) return Amount is
      mw : Amount;
   begin
      --      the adult rate will increase by 12p to £6.31 an hour
      --      the rate for 18-20 year olds will increase by 5p to £5.03 an hour
      --      the rate for 16-17 year olds will increase by 4p to £3.72 an hour
      --      the apprentice rate will increase by 3p to £2.68 an hour
      --      the accommodation offset increases from the current £4.82 to £4.91
      if( p.education = apprentice )then
         mw := 2.68;
      else
         case p.age is
            when 21..Age_Range'Last => mw := 6.31;
            when 18 .. 20 => mw := 5.03;
            when 16 .. 17 => mw := 3.72;
            when 0 .. 15 => mw  := 0.0;
         end case;
      end if;
      return mw;
   end Minimum_Wage;

   function Infer_Wage( p : Person ) return Amount is
      use MF; use MF.Elementary_Functions; use MF.Matrix_Functions;
      subtype V7 is Vector( 1 .. 7 );
      type Coeffs_Array is array( qualification_Type ) of V7;
 
      COEFFS : Coeffs_Array := (
         degree => ( 
           1.53473,     
           -0.185842,    
           0.0546440,   
           -0.000681854, 
           0.0401239, 
           -0.000600493,
           -0.157707 ),    
         other_higher_ed => (
             1.64186,     
            -0.148909,    
             0.0327440,  
            -0.000406330, 
             0.0328575,   
            -0.000439920, 
            -0.190557 ),
         a_level => (
            1.51409,
           -0.235083,   
            0.0408697,  
           -0.000567801,
            0.0403371,  
           -0.000512177,
           -0.191290 ),            
         btec_etc => (
             1.59420,     
            -0.242329,    
             0.0375559,   
            -0.000517623, 
             0.0283735,   
            -0.000291880, 
            -0.242409 ),            
         gcse => (
            1.65484,     
           -0.225797,    
            0.0262711,   
           -0.000375450, 
            0.0299256,
           -0.000313211, 
           -0.179826             
         ),
         other_qualification => (
             1.70043,     
            -0.114438,    
             0.0200793,   
            -0.000303641, 
             0.0261817,   
            -0.000272960, 
            -0.170833             
         ),
         no_qualification => (
            1.66331,    
           -0.107497,   
            0.0175111,  
           -0.000214085,
            0.0168458,  
           -0.000209104,
           -0.198569 ));
      w  : Amount;
      lw : Amount;
      mw : constant Amount := Minimum_Wage( p );
      values : V7;
   begin
      values( 1 ) := 1.0;
      values( 2 ) := 1.0;
      values( 3 ) := Amount( p.age );
      values( 4 ) := Amount( p.age * p.age );
      values( 5 ) := p.years_in_work_total;
      values( 6 ) := p.years_in_work_total ** 2;
      values( 7 ) := ( if p.gender = female then 1.0 else 0.0 );
      lw := COEFFS( p.highest_qualification ) * values;
      w := exp( lw );
      w := Amount'Max( mw, w * p.wage_scale ); 
      Put_Line( "Wage " & To_String( w ) & "wage scale " & To_String( p.wage_scale ));
      return w;
      
   end Infer_Wage;
      
   function Infer_Wage_2( p : Person ) return Amount is
      use MF; use MF.Elementary_Functions; use MF.Matrix_Functions;
      w  : Amount;
      lw : Amount;
      mw : constant Amount := Minimum_Wage( p );
      degree_coeffs : Vector( 1 .. 5 ) := (
           0.387676,  
          -0.136099, 
           0.0123576, 
          -0.00127556,
           0.110279  
      );
      noqual_coeffs : Vector( 1 .. 5 ) := (
          1.32846,     
         -0.210298,
          0.00342430,  
         -0.000348076, 
          0.0330167   
      );
      nodegree_coeffs : Vector( 1 .. 5 ) := (
          0.938340,    
         -0.199634,    
          0.0100620,   
          -0.000744187, 
         0.0628136 );         
      values : Vector( 1 .. 5 );
   begin
      Put_Line( "getting wage for age " & p.age'Img & "EMPL" & p.employment'Img ); 
      if( p.employment /= full_time )then
         return 0.0;
      end if;
      values( 1 ) := 1.0;
      values( 2 ) := ( if p.gender = female then 1.0 else 0.0 );
      values( 3 ) := p.years_in_work_total;
      values( 4 ) := Amount( p.age * p.age );
      values( 5 ) := Amount( p.age );
      if p.highest_qualification = degree then 
         lw := degree_coeffs * values;
      elsif p.highest_qualification = no_qualification then
         lw := noqual_coeffs * values;
      else
         lw := nodegree_coeffs * values;
      end if;
      w := exp( lw );
      w := Amount'Max( mw, w * p.wage_scale ); 
      Put_Line( "Wage " & To_String( w ) & "wage scale " & To_String( p.wage_scale ));
      return w;
   end Infer_Wage_2;

   
   function Infer_Wage_1( p : Person ) return Amount is
      use MF; use MF.Elementary_Functions; use MF.Matrix_Functions;
      w  : Amount;
      lw : Amount;
      mw : constant Amount := Minimum_Wage( p );
      coeffs : Vector( 1 .. 7 ) := ( 
        0.819018,
       -0.166837,   
        0.493757,    
       -0.259477,    
        0.00972806,  
       -0.000790790, 
        0.0679437 );  
      values : Vector( 1 .. 7 );
   begin
      values( 1 ) := 1.0;
      values( 2 ) := ( if p.gender = female then 1.0 else 0.0 );
      values( 3 ) := ( if p.highest_qualification = degree then 1.0 else 0.0 );
      values( 4 ) := ( if p.highest_qualification = no_qualification then 1.0 else 0.0 );
      values( 5 ) := p.years_in_work_total;
      values( 6 ) := Amount( p.age * p.age );
      values( 7 ) := Amount( p.age );
      lw := coeffs * values;
      w := exp( lw );
      w := Amount'Max( mw, w );
      
      -- if p.years_in_education < 10.0 or p.highest_qualification <= gcse then
      -- w := Minimum_Wage( p );
      -- else
      -- case p.highest_qualification is
         -- when gcse | no_qualification => w := Minimum_Wage( p );
         -- when a_level => w := 10.0; -- FIXME 
         -- when degree => w := 15.18; --  median graduate wage, 2012
      -- end case;
      -- end if;
      -- 
      -- const             0.819018      0.0416615      19.66    3.36e-85  ***
      -- female           −0.166837      0.00760130    −21.95    1.78e-105 ***
      -- degree            0.493757      0.00879733     56.13    0.0000    ***
      -- noquals          −0.259477      0.0123368     −21.03    4.11e-97  ***
      -- years_employed    0.00972806    0.000763249    12.75    4.66e-37  ***
      -- sq_age_mp        −0.000790790   2.32245e-05   −34.05    8.85e-247 ***
      -- age_mp            0.0679437     0.00209401     32.45    7.12e-225 ***
      -- 
      -- 
      return w;
   end Infer_Wage_1;
  
   function Vatable_Expenditure( p : Person; inc : Amount ) return Amount is
      -- FIXME!! Share of expenditure, not income; all a mess.
      use MF; use MF.Elementary_Functions; use MF.Matrix_Functions;
      sh_food  : Amount;
      vatable  : Amount;
      coeffs   : Vector( 1 .. 4 ) := (
        0.508062, 
       -0.0275259, 
        0.0208770, 
       -0.0674318 ); 
      values   : Vector( 1 .. 4 );
   begin
      if( inc <= 0.0 )then return 0.0; end if;
      values( 1 ) := 1.0;
      values( 2 ) := ( if p.employment in full_time .. part_time then 1.0 else 0.0 );
      values( 3 ) := 1.0; -- always a single person
      values( 4 ) := log( inc/52.0 );
      sh_food := coeffs * values;
      sh_food := Amount'Max( 0.0, sh_food );
      sh_food := Amount'Min( 1.0, sh_food );
      vatable := ( 1.0 - sh_food ) * inc;
      return vatable;
   end Vatable_Expenditure; 
   -- const          0.508062     0.0117201      43.35    0.0000    ***
  -- working       −0.0275259    0.00213764    −12.88    2.02e-37  ***
  -- hh_size        0.0208770    0.000818833    25.50    7.29e-136 ***
  -- l_total_exp   −0.0674318    0.00202668    −33.27    5.93e-222 ***


   function Get_Num_Children( hh : Household ) return Child_Count is
      nc : Child_Count := 0;
   begin
      for buno in 1 .. hh.num_benefit_units loop
         for pno in 1 .. hh.benefit_units( buno ).num_people loop
            declare
               pers : Person renames hh.benefit_units( buno ).people( pno );
            begin
	       if pers.age <= 18 and pers.relationship in child .. foster_child then
                  nc := nc + 1;
	       end if;
            end;
         end loop;
      end loop;
      return nc;
   end Get_Num_Children;

   procedure Add_Event( events : in out Events_Set; event : Event_Type ) is
      use Ada.Strings.Unbounded;
      use Text_Utils;
      ev : Event_Obj;
   begin
      ev.name := TuS( Prettify_Image( Event_Type'Image( event )));
      ev.event := event;
      ev.value := 0.0;
      ev.cost_centre := welsh_government;
      events.Append( ev );
   end Add_Event;

   procedure Add_Arbitrary_Event( 
      events      : in out Events_Set; 
      name        : String; 
      value       : Amount; 
      cost_centre : Budget_Type  ) is
      use Ada.Strings.Unbounded;
      use Text_Utils;
      ev : Event_Obj;
   begin
      ev.name := TuS( name );
      ev.event := arbitrary_event;
      ev.value := value;
      ev.cost_centre := cost_centre;
      events.Append( ev );
   end Add_Arbitrary_Event;
   
   function Contains_Event( events : Events_Set; event : Event_Type ) return Boolean is
   begin
      for e of events loop
         if( e.event = event )then return True; end if;
      end loop;
      return False;
   end Contains_Event;

   function Find_Event( events : Events_Set; event : Event_Type; found : out Boolean ) return Event_Obj'Class is
      ev : Event_Obj;
   begin
      for e of events loop
         if( e.event = event )then 
            found := True;
            return e;
         end if;
      end loop;
      found := False;
      return ev;
   end Find_Event;

   function Find_Events( events : Events_Set; event : Event_Type; found : out Boolean ) return Events_Set'Class is
      ev : Events_Set;
   begin
      found := False;
      for e of events loop
         if( e.event = event )then 
            found := True;
            ev.Append( e );
         end if;
      end loop;
      return ev;
   end Find_Events;


end Example_Data;
