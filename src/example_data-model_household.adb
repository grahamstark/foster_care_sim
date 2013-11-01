with Ada.Assertions;

package body Example_Data.Model_Household is

   use Ada.Assertions;

   function Get_Income( i : Model_Person; w : Non_Calculated_Incomes_Range ) return Amount is
   begin
      return i.income( w );
   end Get_Income;

   function Get_Incomes( i : Model_Person ) return Incomes_List is
      il : Incomes_List := ( others => 0.0 );
   begin
      for it in Non_Calculated_Incomes_Range loop
         il( it ) := i.income( it );
      end loop;
      return il;
   end Get_Incomes;

   function Age( i : Model_Person ) return Age_Range is
   begin
      return i.age;
   end Age;

   function Employment( i : Model_Person ) return Employment_Status is
   begin
      return i.employment;
   end Employment;

   function Gender( i : Model_Person ) return Gender_Type is
   begin
      return i.gender;
   end Gender;

   function Is_Contracted_In_To_Serps( i : Model_Person ) return Boolean is
   begin
       return i.is_in_serps;
   end Is_Contracted_In_To_Serps;

   function Hours_Worked( i : Model_Person ) return Work_Hours_Range is
   begin
       return i.hours_worked;
   end Hours_Worked;

   function Family_Relationship( i : Model_Person ) return Relationship_Type is
   begin
      return i.relationship;
   end Family_Relationship;

   function Average_Wage_Per_Hour( i : Model_Person ) return Amount is
   begin
      return i.wage_per_hour;
   end Average_Wage_Per_Hour;

   function Education_Status( i : Model_Person ) return Education_Type is
   begin
      return i.education;
   end Education_Status;

   function Map_Person( p : Person ) return Model.Abstract_Household.Person'Class is
      mp : Model_Person;
   begin
      mp.age           := p.age;
      mp.gender        := p.gender;
      mp.employment    := p.employment;
      mp.income        := p.income;
      mp.hours_worked  := p.hours_worked;
      mp.is_in_serps   := p.is_in_serps;
      mp.relationship  := p.relationship;
      mp.wage_per_hour := p.wage_per_hour;
      mp.education     := p.education;
      return mp;
   end Map_Person;

   function Map_Household( h : Household ) return Model.Abstract_Household.Household'Class is
      mh : Model_Household;
   begin
      mh.housing := h.housing;
      mh.num_benefit_units := h.num_benefit_units;
      for i in 1 .. mh.num_benefit_units loop
         mh.benefit_units( i ) := h.benefit_units( i );
      end loop;
      return mh;
   end  Map_Household;

   function Get_Housing_Cost( hh : Model_Household; htype : Housing_Cost_Type ) return Amount is
   begin
      return hh.housing( htype );
   end Get_Housing_Cost;

   function Get_Tenure_Type( hh : Model_Household ) return Tenure_Type is
   begin
      return hh.tenure;
   end Get_Tenure_Type;


   function Get_Num_Benefit_Units( hh : Model_Household ) return Benefit_Unit_Count is
   begin
      return hh.num_benefit_units;
   end Get_Num_Benefit_Units;

   function Get_Num_People(
      bu        : Model_Benefit_Unit;
      start_age : Age_Range := 0;
      end_age   : Age_Range := Age_Range'Last;
      relationship_from : Relationship_Type := Relationship_Type'First;
      relationship_to   : Relationship_Type := Relationship_Type'Last;
      start_person : Person_Count := 1 ) return Person_Count is
      n : Person_Count := 0;
   begin
      Assert( start_age <= end_age and relationship_from <= relationship_to,
         "Search ages/relationships are wrong way round " &
         " start_age " & start_age'Img &
         " end_age " & end_age'Img &
         " relationship_from " & relationship_from'Img &
         " relationship_to " & relationship_to'Img );
      for p in start_person .. bu.num_people loop
         declare
            pers : Person := bu.people( p );
         begin
         if( pers.age >= start_age and pers.age <= end_age  and pers.relationship >= relationship_from and pers.relationship <= relationship_to )then
            n := n + 1;
         end if;
         end;
      end loop;
      return n;
   end Get_Num_People;

   function Map_Benefit_Unit( bu : Benefit_Unit ) return Model.Abstract_Household.Benefit_Unit'Class is
      mb : Model_Benefit_Unit;
   begin
      mb.num_people := bu.num_people;
      for i in 1 .. mb.num_people loop
         mb.people( i ) := bu.people( i );
      end loop;
      return mb;
   end Map_Benefit_Unit;

   function Get_Benefit_Unit( hh : Model_Household; which : Positive ) return Model.Abstract_Household.Benefit_Unit'Class is
   begin
      return Map_Benefit_Unit( hh.benefit_units( which ));
   end Get_Benefit_Unit;

   function Get_Num_People(
      hh        : Model_Household;
      start_age : Age_Range := 0;
      end_age   : Age_Range := Age_Range'Last;
      relationship_from : Relationship_Type := Relationship_Type'First;
      relationship_to   : Relationship_Type := Relationship_Type'Last;
      start_person : Person_Count := 1 ) return Person_Count is
      n : Person_Count := 0;
   begin
      for b in 1 .. hh.num_benefit_units loop
            n := n + hh.Get_Benefit_Unit( b ).Get_Num_People( start_age, end_age, relationship_from, relationship_to, start_person );
      end loop;
      return n;
   end Get_Num_People;

   function Get_Person( hh : Model_Household; bu_no : Positive; pers_no : Positive ) return Model.Abstract_Household.Person'Class is
      mp : Model.Abstract_Household.Person'Class := Map_Person( hh.benefit_units( bu_no ).people( pers_no ));
   begin
      return mp;
   end Get_Person;

   function Get_Person( bu : Model_Benefit_Unit; which : Positive ) return Model.Abstract_Household.Person'Class is
      mp : Model.Abstract_Household.Person'Class := Map_Person( bu.people( which ));
   begin
      return mp;
   end Get_Person;

--        procedure Get_People( hh : Model_Household; pv : in out Model.Abstract_Household.Person_Vector ) is
--        begin
--           for i in hh.people'Range loop
--              pv.Append( hh.Get_Person( i ));
--           end loop;
--        end Get_People;

end Example_Data.Model_Household;
