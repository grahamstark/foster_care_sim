with Text_Utils;

package body Example_Data.Examples is

   use Text_Utils;

   function Create_Events( hht : HH_Type; which : Positive ) return Events_List is
      tmp_ev : Events_List( 2013 .. 2013 );
   begin
     -- for i in ev'Range loop
        -- ev( i ).Append( age_1_year );
     -- end loop;
     case hht is
        when uc_anne => null;
        when hh1 => null;
        when catherine =>
           case which is
              when 1 => -- catherine
                 declare
                    ev : Events_List( 2011 .. 2040 );
                 begin
                    ev( 2013 ).Add_Event( completes_a_levels );
                    ev( 2013 ).Add_Event( leave_school );
                    ev( 2013 ).Add_Event( start_higher_education );
                    ev( 2015 ).Add_Event( leave_fostering );
                    ev( 2016 ).Add_Event( graduates );
                    ev( 2016 ).Add_Event( end_higher_education );
                    ev( 2016 ).Add_Event( start_work );                
                    return ev;
                 end;
              when 4 => -- catherine
                 declare
                    ev : Events_List( 2011 .. 2040 );
                 begin
                    ev( 2013 ).Add_Event( completes_gcses );
                    ev( 2013 ).Add_Event( leave_school );
                    -- ev( 2013 ).Add_Event( start_work );                
                    ev( 2013 ).Add_Event( start_apprenticeship );
                    ev( 2015 ).Add_Event( completes_apprenticeship );
                    ev( 2015 ).Add_Event( leave_fostering );
                    return ev;
                 end;
              when 2 => -- catherine, leaving at 18, starting uni at 20
                 declare
                    ev : Events_List( 2011 .. 2040 );
                 begin
                    ev( 2013 ).Add_Event( completes_a_levels );
                    ev( 2013 ).Add_Event( leave_school );
                    ev( 2013 ).Add_Event( leave_fostering );
                    ev( 2013 ).Add_Event( leave_household );
                    -- ev( 2013 ).Add_Event( start_work );
                    ev( 2015 ).Add_Event( start_higher_education );
                    -- ev( 2015 ).Add_Event( leave_work );
                    ev( 2018 ).Add_Event( graduates );
                    ev( 2018 ).Add_Event( end_higher_education );
                    ev( 2018 ).Add_Event( start_work );                
                    return ev;
                 end;
              when 3 => -- catherine, leaving at 18, starting uni at 18 but not graduating
                 declare
                    ev : Events_List( 2011 .. 2040 );
                 begin
                    ev( 2013 ).Add_Event( completes_a_levels );
                    ev( 2013 ).Add_Event( leave_school );
                    ev( 2013 ).Add_Event( leave_fostering );
                    ev( 2013 ).Add_Event( start_higher_education );
                    ev( 2013 ).Add_Event( leave_household );
                    -- ev( 2013 ).Add_Event( start_work );
                    -- ev( 2015 ).Add_Event( leave_work );
                    -- ev( 2018 ).Add_Event( graduates );
                    ev( 2015 ).Add_Event( end_higher_education );
                    ev( 2015 ).Add_Event( start_work );                
                    return ev;
                 end;
              when others => null;
           end case;
        when christian =>
           case which is 
              when 1 .. 3 | 10 => -- christian, base case
                 declare
                    ev : Events_List( 2011 .. 2040 );
                    sc_ev : Event_Obj := (
                      event => arbitrary_event,
                      name  => TuS( "Ongoing support from leaving care personal adviser" ),
                      value => 4_865.0,
                      cost_centre => childrens_services );
                    teach_ev : Event_Obj := (
                      event => arbitrary_event,
                      name  => TuS( "Teaching Support" ),
                      value => 806.00,
                      cost_centre => childrens_services );
                 begin
                    ev( 2012 ).Add_Event( leave_fostering );
                    ev( 2013 ).Add_Event( leave_school );
                    if( which = 10 )then
                       ev( 2019 ).Add_Event( start_work );
                       ev( 2013 ).Add_Event( completes_gcses );
                    else   
                       ev( 2018 + which ).Add_Event( start_work );
                    end if;
                    ev( 2013 ).Add_Event( leave_household );
                    ev( 2014 ).Append( sc_ev );
                    ev( 2014 ).Append( teach_ev );
                    ev( 2015 ).Append( sc_ev );
                    ev( 2018 ).Add_Event( leave_work );
                    ev( 2022 ).Add_Event( leave_work );
                    ev( 2023 ).Add_Event( start_work );
                    ev( 2025 ).Add_Event( leave_work );
                    ev( 2027 ).Add_Event( start_work );
                    ev( 2030 ).Add_Event( leave_work );
                    ev( 2033 ).Add_Event( start_work );
                    ev( 2035 ).Add_Event( leave_work );
                    ev( 2040 ).Add_Event( start_work );
                    -- ev( 2045 ).Add_Event( leave_work );
                    return ev;
                 end;
              when 11 =>
                                  declare
                    ev : Events_List( 2011 .. 2040 );
                    sc_ev : Event_Obj := (
                      event => arbitrary_event,
                      name  => TuS( "Ongoing support from leaving care personal adviser" ),
                      value => 4_865.0,
                      cost_centre => childrens_services );
                    teach_ev : Event_Obj := (
                      event => arbitrary_event,
                      name  => TuS( "Teaching Support" ),
                      value => 806.00,
                      cost_centre => childrens_services );
                 begin
                    ev( 2013 ).Add_Event( leave_school );
                    ev( 2019 ).Add_Event( start_work );

                    ev( 2014 ).Append( sc_ev );
                    ev( 2014 ).Append( teach_ev );
                    
                    ev( 2015 ).Add_Event( completes_gcses );                    
                    ev( 2015 ).Append( sc_ev );
                    ev( 2015 ).Add_Event( leave_fostering );
                    ev( 2015 ).Add_Event( leave_household );

                    ev( 2018 ).Add_Event( leave_work );
                    ev( 2022 ).Add_Event( leave_work );
                    ev( 2023 ).Add_Event( start_work );
                    ev( 2025 ).Add_Event( leave_work );
                    ev( 2027 ).Add_Event( start_work );
                    ev( 2030 ).Add_Event( leave_work );
                    ev( 2033 ).Add_Event( start_work );
                    ev( 2035 ).Add_Event( leave_work );
                    ev( 2040 ).Add_Event( start_work );
                    -- ev( 2045 ).Add_Event( leave_work );
                    return ev;
                 end;
              when 4 .. 9 => -- christian, 
                 declare
                    wage_increase_1 : Event_Obj := (
                      event => wages_bump,
                      name  => TuS( "Wages 1% up from defaults" ),
                      value => 1.01,
                      cost_centre => local_authority );
                    wage_increase_5 : Event_Obj := (
                      event => wages_bump,
                      name  => TuS( "Wages 5% up from defaults" ),
                      value => 1.05,
                      cost_centre => local_authority );
                    ev : Events_List( 2011 .. 2040 );
                 begin
                    if( which = 4 )then
                       ev( 2015 ).Append( wage_increase_1 );
                    elsif( which = 5 )then
                       ev( 2015 ).Append( wage_increase_5 );
                    end if;
                    ev( 2015 ).Add_Event( leave_school );
                    ev( 2015 ).Add_Event( completes_gcses );              
                    ev( 2015 ).Add_Event( leave_fostering );
                    ev( 2016 ).Add_Event( start_work );
                    ev( 2016 ).Add_Event( leave_household );
                    ev( 2018 ).Add_Event( leave_work );
                    ev( 2019 ).Add_Event( start_work );
                    ev( 2022 ).Add_Event( leave_work );
                    if( which >= 6 )then
                       ev( 2022 + which ).Add_Event( start_work );
                    else
                       ev( 2022+which ).Add_Event( start_work );
                    end if;
                    return ev;
                 end;
              when others => null;
           end case;
     end case;
     return tmp_ev;
   end Create_Events;

   function Get_Person( who : Pers_Type ) return Person is
      p : Person;
   begin
      p.income := ( others => 0.0 );
      case who is
      when peter =>
      --  Gross salary £23,695 (PAYE deducted £3,788)
      --  Property income £6,000
      --  National Savings Certificates interest received on cashing in certificates £1,100
      --  Betting winnings £500
      --  Building society interest received £320
      --  Bank deposit interest received £400
      --  Dividends from UK companies £1,890
         p.pid := 2001;
         p.age := 30;
         p.hours_worked := 40;
         p.is_in_serps := False;
         p.relationship := head;
         p.income( wages ) := 23_695.0;
         p.income( building_society ) := 320.0/0.8;
         p.income( bank_interest ) := 400.0/0.8;
         p.income( national_savings ) := 1_100.00/0.8;
         p.income( dividends ) := 1_890.00/0.9;
         p.income( property ) := 6_000.0;
         p.income( other_income ) := 500.0;
     when anita =>
      -- Anita has a part-time cleaning job and earns £4,560 in 2007/08. She also received the following income:
      -- National Lottery scratch card winnings £250
      -- Bank interest 380
      -- Dividends from UK company 549
      -- Anita is aged 42.
         p.pid := 2002;
         p.age := 42;
         p.relationship := head;
         p.is_in_serps := False;
         p.hours_worked := 40;
         p.education := not_in_education;
         p.income( wages ) := 4_560.0;
         p.income( bank_interest ) := 380.0/0.8;
         p.income( dividends ) := 549.00/0.9;
         p.income( other_income ) := 250.0;
      when laura =>
      -- Laura is employed by H Ltd and paid £2,980 monthly. She is contracted out of S2P through her employer's
      -- salary related occupational pension scheme.
         p.pid := 2003;
         p.age := 42;
         p.relationship := head;
         p.is_in_serps := False;
         p.hours_worked := 40;
         p.income( wages ) := 2_980.0*12.0;
      end case;
      return p;
   end Get_Person;
   
   function Get_Foster_Family return Household is
      hh : Household;
   begin
       hh.num_benefit_units := 1;
       hh.benefit_units( 1 ).num_people := 3;
       hh.benefit_units( 1 ).people( 1 ).pid := 1;
       hh.benefit_units( 1 ).people( 1 ).age := 40;
       hh.benefit_units( 1 ).people( 1 ).gender := male;
       hh.benefit_units( 1 ).people( 1 ).hours_worked := 38*WEEKS_WORKED_PER_YEAR;
       hh.benefit_units( 1 ).people( 1 ).relationship := head;
       hh.benefit_units( 1 ).people( 1 ).employment := full_time;
       hh.benefit_units( 1 ).people( 1 ).highest_qualification := degree;
       hh.benefit_units( 1 ).people( 1 ).education := not_in_education;
       hh.benefit_units( 1 ).people( 1 ).years_fostered := 0.0;
       hh.benefit_units( 1 ).people( 1 ).years_in_education := 0.0;
       hh.benefit_units( 1 ).people( 1 ).years_in_work_this_spell := 18.0;
       hh.benefit_units( 1 ).people( 1 ).years_unemployed_this_spell := 0.0;
       hh.benefit_units( 1 ).people( 1 ).years_in_work_total := 18.0;
       hh.benefit_units( 1 ).people( 1 ).years_unemployed_total := 0.0;
      
       hh.benefit_units( 1 ).people( 1 ).wage_per_hour := 
          hh.benefit_units( 1 ).people( 1 ).Infer_Wage;
       hh.benefit_units( 1 ).people( 1 ).income( wages ) := 
          Amount( hh.benefit_units( 1 ).people( 1 ).hours_worked ) * 
                  hh.benefit_units( 1 ).people( 1 ).wage_per_hour;
                  
       hh.benefit_units( 1 ).people( 2 ).pid := 2;
       hh.benefit_units( 1 ).people( 2 ).age := 40;
       hh.benefit_units( 1 ).people( 2 ).gender := female;
       hh.benefit_units( 1 ).people( 2 ).hours_worked := 0;
       hh.benefit_units( 1 ).people( 2 ).education := school;
       hh.benefit_units( 1 ).people( 2 ).employment := inactive;
       hh.benefit_units( 1 ).people( 2 ).relationship := spouse;
       hh.benefit_units( 1 ).people( 2 ).highest_qualification := degree;
       hh.benefit_units( 1 ).people( 2 ).education := not_in_education;
       hh.benefit_units( 1 ).people( 2 ).years_fostered := 0.0;
       hh.benefit_units( 1 ).people( 2 ).years_in_education := 0.0;
       hh.benefit_units( 1 ).people( 2 ).years_in_work_this_spell := 0.0;
       hh.benefit_units( 1 ).people( 2 ).years_unemployed_this_spell := 0.0;
       hh.benefit_units( 1 ).people( 2 ).years_in_work_total := 0.0;
       hh.benefit_units( 1 ).people( 2 ).years_unemployed_total := 0.0;
       hh.benefit_units( 1 ).people( 2 ).income( wages ) := 0.0; 

      return hh;
   end Get_Foster_Family;

   function Get_Household( which : HH_Type ) return Household is
     hh : Household;
   begin
     hh.housing := ( others => 0.0 );
     case which is
        when hh1 =>
          hh.num_benefit_units := 1;
          hh.benefit_units( 1 ).num_people := 1;
          hh.benefit_units( 1 ).people( 1 ) := Get_Person( peter );
          hh.housing( rent ) := 450.0*12.0;
        when uc_anne =>
          hh.num_benefit_units := 1;
          hh.benefit_units( 1 ).num_people := 2;
          hh.benefit_units( 1 ).people( 1 ).pid := 2001;
          hh.benefit_units( 1 ).people( 1 ).age := 40;
          hh.benefit_units( 1 ).people( 1 ).hours_worked := 38;
          hh.benefit_units( 1 ).people( 1 ).relationship := head;
          hh.benefit_units( 1 ).people( 1 ).employment := full_time;
          hh.benefit_units( 1 ).people( 1 ).education := not_in_education;
          
          hh.benefit_units( 1 ).people( 2 ).pid := 2002;
          hh.benefit_units( 1 ).people( 2 ).age := 1;
          hh.benefit_units( 1 ).people( 2 ).education := school;
          hh.benefit_units( 1 ).people( 2 ).employment := in_education;
          hh.benefit_units( 1 ).people( 2 ).relationship := child;
          -- hh.benefit_units( 1 ).people( 2 ).foster_status := currently_fostered;

          hh.housing( rent ) := 80.0*52.0;
        when catherine =>
          hh := Get_Foster_Family;
          hh.benefit_units( 1 ).people( 3 ).pid := 2002;
          hh.benefit_units( 1 ).people( 3 ).age := 16;
          hh.benefit_units( 1 ).people( 3 ).gender := female;
          hh.benefit_units( 1 ).people( 3 ).education := school;
          hh.benefit_units( 1 ).people( 3 ).foster_status := currently_fostered;
          hh.benefit_units( 1 ).people( 3 ).employment := in_education;
          hh.benefit_units( 1 ).people( 3 ).relationship := child;
          hh.benefit_units( 1 ).people( 3 ).hours_worked := 0;
          hh.benefit_units( 1 ).people( 3 ).years_fostered := 12.0;
        when christian => 
          hh := Get_Foster_Family;
          hh.benefit_units( 1 ).people( 3 ).pid := 2002;
          hh.benefit_units( 1 ).people( 3 ).age := 16;
          hh.benefit_units( 1 ).people( 3 ).gender := male;
          hh.benefit_units( 1 ).people( 3 ).education := school;
          hh.benefit_units( 1 ).people( 3 ).foster_status := currently_fostered;
          hh.benefit_units( 1 ).people( 3 ).employment := in_education;
          hh.benefit_units( 1 ).people( 3 ).relationship := child;
          hh.benefit_units( 1 ).people( 3 ).hours_worked := 0;
          hh.benefit_units( 1 ).people( 3 ).years_fostered := 9.0;
     end case;
     return hh;
   end Get_Household;

end Example_Data.Examples;
