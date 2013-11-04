with Model_Types;
with Example_Data;
with Model.Results;
with Model.Parameter_System;
with Model_Types;

package Model.Calculator.Foster_Care_Sim is

   use Model_Types;
   use Example_Data;
   use Model.Results;
   use Model.Parameter_System;

   type Regime_Type is ( current, wiar );

   procedure Calculate_Foster_Care_Payments(
      sys       : Foster_Payment_System;
      hh        : Household;
      res       : in out Model.Results.Household_Result );

   procedure Calculate_Activity_Costs(
      sys       : Social_Care_Costs;
      pers      : Person;
      events    : Events_Set;
      res       : in out Model.Results.Personal_Result );

   procedure Calculate_Student_Loan_Repayments(
      sys       : Student_Loan_And_Grant_System;
      pers      : Person;
      res       : in out Model.Results.Personal_Result );

   procedure Get_Student_Grants_And_Loans(
      sys             : Student_Loan_And_Grant_System;
      hh              : Household;
      events          : Events_Set;
      part_of_main_hh : Boolean;
      pers            : Person;
      taxable_income  : Amount;
      res             : in out Model.Results.Personal_Result );

   function Get_Income( inc : Amount; bands : Vector; amounts : Vector ) return Amount;

private

   function Get_Activity_Cost( activity : Admin_Activity_Type; regime : Regime_Type ) return Amount;
   -- function Get_Practioner_Costs return Practioner_Costs;
   -- function Get_Activity_Times return Activity_Times;

end Model.Calculator.Foster_Care_Sim;
