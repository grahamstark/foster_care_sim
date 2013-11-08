with Model.Abstract_Household;
with Model_Types;
with Base_Model_Types;

package Example_Data.Model_Household is

   use Model_Types;
   use Base_Model_Types;
   use Model.Abstract_Household;

   type Model_Person is new Person and Model.Abstract_Household.Person with null record;

   overriding function Get_Income( i : Model_Person; w : Non_Calculated_Incomes_Range ) return Amount;
   overriding function Get_Incomes( i : Model_Person ) return Incomes_List;
   overriding function Age( i : Model_Person ) return Age_Range;
   overriding function Family_Relationship( i : Model_Person ) return Relationship_Type;
   overriding function Education_Status( i : Model_Person ) return Education_Type;
   overriding function Employment( i : Model_Person ) return Employment_Status;
   overriding function Gender( i : Model_Person ) return Gender_Type;
   overriding function Is_Contracted_In_To_Serps( i : Model_Person ) return Boolean;
   overriding function Hours_Worked( i : Model_Person ) return Work_Hours_Range;
   overriding function Average_Wage_Per_Hour( i : Model_Person ) return Amount;

   type Model_Benefit_Unit is new Benefit_Unit and Model.Abstract_Household.Benefit_Unit with null record;
   overriding function Get_Person( bu : Model_Benefit_Unit; which : Positive ) return Model.Abstract_Household.Person'Class;
   overriding function Get_Num_People(
      bu                : Model_Benefit_Unit;
      start_age         : Age_Range := 0;
      end_age           : Age_Range := Age_Range'Last;
      relationship_from : Relationship_Type := Relationship_Type'First;
      relationship_to   : Relationship_Type := Relationship_Type'Last;
      start_person : Person_Count := 1 ) return Person_Count;
   overriding function Get_Benefit_Unit_Type( bu : Model_Benefit_Unit ) return Primary_Or_Secondary;
   

   type Model_Household is new Household and Model.Abstract_Household.Household with null record;
   overriding function Get_Num_Benefit_Units( hh : Model_Household ) return Benefit_Unit_Count;
   overriding function Get_Benefit_Unit( hh : Model_Household; which : Positive ) return Model.Abstract_Household.Benefit_Unit'Class;
   overriding function Get_Person( hh : Model_Household; bu_no : Positive; pers_no : Positive ) return Model.Abstract_Household.Person'Class;
   -- todo overriding procedure Get_People( hh : Model_Household; pv : in out Model.Abstract_Household.Person_Vector );
   overriding function Get_Housing_Cost( hh : Model_Household; htype : Housing_Cost_Type ) return Amount;
   overriding function Get_Num_People(
      hh        : Model_Household;
      start_age : Age_Range := 0;
      end_age   : Age_Range := Age_Range'Last;
      relationship_from : Relationship_Type := Relationship_Type'First;
      relationship_to   : Relationship_Type := Relationship_Type'Last;
      start_person : Person_Count := 1 ) return Person_Count;

   overriding function Get_Tenure_Type( hh : Model_Household ) return Tenure_Type;

   function Map_Person( p : Person ) return Model.Abstract_Household.Person'Class;
   function Map_Household( h : Household ) return Model.Abstract_Household.Household'Class;
   function Map_Benefit_Unit( bu : Benefit_Unit ) return Model.Abstract_Household.Benefit_Unit'Class;

end Example_Data.Model_Household;
