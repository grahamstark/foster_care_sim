with Model_Types;
with Model.Abstract_Household;

package Model.Results is

   use Model_Types;
   use Model.Abstract_Household;

   type Personal_Result is tagged record
      incomes                    : Incomes_List := ( others => 0.0 );
      employers_ni               : Amount := 0.0; -- since this isn't in the incomes list as a deduction
      total_taxable_income       : Amount := 0.0;
      net_income                 : Amount := 0.0;
      marginal_rate_earned       : Rate := 0.0;
      marginal_rate_unearned     : Rate := 0.0;
      intermed                   : Auxiliary_Results;
      total_student_loans        : Amount := 0.0;
      outstanding_student_loans  : Amount := 0.0;
      assigned_admin_costs       : Amount := 0.0;
      childs_contributions       : Amount := 0.0;
      student_accommodation_costs : Amount := 0.0;
   end record;
   
   function Summary_String( res : Personal_Result; delim : Character ) return String;
   function Summary_String_Header( delim : Character ) return String;
   procedure Assign_To_Budgets( 
      res      : Personal_Result;
      expend   : in out Budget_Array;
      receipts : in out Budget_Array );
      
   function To_String( res :  Personal_Result ) return String;
   procedure Zero( res : in out Personal_Result; including_stocks : Boolean );

   type Pers_Result_Array is array( Person_Number ) of Personal_Result;

   type Benefit_Unit_Result is tagged record
      num_people                : Person_Number;
      pers                      : Pers_Result_Array;
      total_taxable_income      : Amount := 0.0;
      net_income                : Amount := 0.0;
      housing_allowance         : Amount := 0.0;
      intermed                  : Auxiliary_Results;
   end record;
   procedure Zero( res : in out Benefit_Unit_Result; including_stocks : Boolean );

   function To_String( res :  Benefit_Unit_Result ) return String;

   type Benefit_Unit_Result_Array is array( Benefit_Unit_Number ) of Benefit_Unit_Result;

   type Household_Result is tagged record
      num_benefit_units    : Benefit_Unit_Number;
      bus                  : Benefit_Unit_Result_Array;
      total_taxable_income : Amount := 0.0;
      net_income           : Amount := 0.0;
      vat                  : Amount := 0.0;
      intermed             : Auxiliary_Results;
   end record;

   function To_String( res :  Household_Result ) return String;

   procedure Zero( res : in out Household_Result; including_stocks : Boolean );

   function Budget_Header( delim : Character; which : String ) return String;   
   function To_String( ba : Budget_Array; delim : Character ) return String;
   
   procedure NPVs( 
      budget_expenditures        : in Budget_By_Year;
      budget_receipts            : in Budget_By_Year;
      discount_rate              : Rate;
      gross_expenditures         : out Budget_Array;
      gross_receipts             : out Budget_Array;
      net_expenditures           : out Budget_Array;
      overall_gross_expenditures : out Amount;
      overall_gross_receipts     : out Amount;
      overall_net_expenditures   : out Amount );
      

end Model.Results;
