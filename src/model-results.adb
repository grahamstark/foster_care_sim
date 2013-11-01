with Ada.Strings.Unbounded;
with Text_Utils;

package body Model.Results is

   use Ada.Strings.Unbounded;
   use Text_Utils;
   
   procedure Assign_To_Budgets( 
      res      : Personal_Result;
      expend   : in out Budget_Array;
      receipts : in out Budget_Array ) is
   begin
      Inc( expend( childrens_services ), res.assigned_admin_costs );
      Inc( expend( childrens_services ), res.incomes( foster_care_payments ));
      Inc( expend( childrens_services ), res.student_accommodation_costs );
      Inc( receipts( childrens_services ), res.childs_contributions );
      Inc( receipts( local_authority ), res.incomes( local_taxes ));
      Inc( expend( local_authority ), res.incomes( council_tax_benefit ));
      Inc( expend( welsh_government ), res.incomes( education_allowances ));
      Inc( expend( welsh_government ), res.incomes( student_grants ));
      Inc( expend( welsh_government ), res.incomes( student_loans ));
      Inc( expend( welsh_government ), res.incomes( council_tax_benefit ));
      Inc( expend( welsh_government ), res.incomes( housing_benefit ));
      
      Inc( receipts(  welsh_government ), res.incomes( repayments ));
      for i in disabled_living_allowance .. winter_fuel_payments loop
         Inc( expend(  uk_government ), res.incomes( i ));
      end loop;
      Inc( receipts(  uk_government ), res.incomes( income_tax ));
      Inc( receipts(  uk_government ), res.incomes( national_insurance ));
      Inc( receipts(  uk_government ), res.employers_ni );
      Inc( expend(  uk_government ), res.incomes( tax_credits ));
   end  Assign_To_Budgets;
   
   function Budget_Header( delim : Character; which : String ) return String is 
      s : Unbounded_String;
   begin
      for b in Budget_Type'Range loop
         s := s & Prettify_Image( Budget_Type'Image( b ) & which ) & delim;
      end loop;
      return To_String( s );
   end Budget_Header;
   
   function To_String( ba : Budget_Array; delim : Character ) return String is
      s : Unbounded_String;
   begin
      for b of ba loop
         s := s & To_String( b) & delim;
      end loop;
      return To_String( s );
   end To_String;
      
   function To_String( res :  Personal_Result ) return String is
      s : Unbounded_String;
   begin
      s := s & " incomes                   " & T_Incomes.To_String( T_Incomes.Abs_Amount_Array( res.incomes )) & LINE_BREAK;
      s := s & " employers_ni              " & To_String( res.employers_ni ) & LINE_BREAK;
      s := s & " total_taxable_income      " & To_String( res.total_taxable_income ) & LINE_BREAK;
      s := s & " net_income                " & To_String( res.net_income ) & LINE_BREAK;
      s := s & " marginal_rate_earned      " & Rate'Image( res.marginal_rate_earned ) & LINE_BREAK;
      s := s & " marginal_rate_unearned    " & Rate'Image( res.marginal_rate_unearned ) & LINE_BREAK;
      s := s & " total_student_loans       " & To_String( res.total_student_loans ) & LINE_BREAK;
      s := s & " outstanding_student_loans " & To_String( res.outstanding_student_loans ) & LINE_BREAK;
      s := s & " assigned_admin_costs      " & To_String( res.assigned_admin_costs ) & LINE_BREAK;
      s := s & " childs_contributions      " & To_String(  res.childs_contributions ) & LINE_BREAK;
      s := s & " student_accommodation_costs " & To_String(  res.student_accommodation_costs ) & LINE_BREAK;
      s := s & To_String( res.intermed, "   " );
      return To_String( s );
   end To_String;

   function Summary_String_Header( delim : Character ) return String is
   begin
      return "income tax" & delim
          & "national insurance" & delim
          & "employers ni" & delim
          & "tax credits" & delim
          & "child benefit" & delim
          & "education allowances" & delim
          & "foster care payments" & delim
          & "student grants" & delim
          & "student loans" & delim
          & "total taxable income" & delim
          & "net income" & delim
          & "total student loans" & delim
          & "outstanding student loans" & delim
          & "assigned admin costs" & delim
          & "childs contributions" & delim
          & "student accommodation costs";
   end Summary_String_Header;
   
   function Summary_String( res : Personal_Result; delim : Character ) return String is
      s : Unbounded_String;
   begin
      s := s & To_String( res.incomes( income_tax ) ) & delim;
      s := s & To_String( res.incomes( national_insurance ) ) & delim;
      s := s & To_String( res.employers_ni)  & delim;
      s := s & To_String( res.incomes( tax_credits ) ) & delim;
      s := s & To_String( res.incomes( child_benefit ) ) & delim;
      
      s := s & To_String( res.incomes( education_allowances ) )  & delim;
      s := s & To_String( res.incomes( foster_care_payments ) )  & delim;
      s := s & To_String( res.incomes( student_grants ) )  & delim;
      s := s & To_String( res.incomes( student_loans )) & delim;
      
      s := s & To_String( res.total_taxable_income )  & delim;
      s := s & To_String( res.net_income) & delim;
      s := s & To_String( res.total_student_loans)  & delim;
      s := s & To_String( res.outstanding_student_loans)  & delim;
      s := s & To_String( res.assigned_admin_costs)  & delim;
      s := s & To_String( res.childs_contributions)  & delim;
      s := s & To_String( res.student_accommodation_costs)  & delim;
      return To_String( s );
   end Summary_String;


   function To_String( res :  Benefit_Unit_Result ) return String is
      s : Unbounded_String;
   begin
      s := s & " num_people " & res.num_people'Img & LINE_BREAK;
      s := s & " total_taxable_income      " & To_String( res.total_taxable_income ) & LINE_BREAK;
      s := s & " net_income      " & To_String( res.net_income ) & LINE_BREAK;
      for p in 1 .. res.num_people loop
         s := s & "Personal Result " & p'Img & LINE_BREAK;
         s := s  & To_String( res.pers( p ));
      end loop;
      s := s & To_String( res.intermed, " " );
      return To_String( s );
   end To_String;

   function To_String( res :  Household_Result ) return String is
      s : Unbounded_String;
   begin
      s := s & " num_benefit_units " & res.num_benefit_units'Img & LINE_BREAK;
      s := s & " total_taxable_income      " & To_String( res.total_taxable_income ) & LINE_BREAK;
      s := s & " net_income      " & To_String( res.net_income ) & LINE_BREAK;
      for p in 1 .. res.num_benefit_units loop
         s := s & " BEN UNIT Result " & p'Img & LINE_BREAK;
         s := s  & To_String( res.bus( p ));
      end loop;
      s := s & To_String( res.intermed, "" );
      return To_String( s );
   end To_String;

   procedure Zero( res : in out Personal_Result; including_stocks : Boolean ) is
   begin
      res.incomes := ( others => 0.0 );
      res.employers_ni                 := 0.0; -- since this isn't in the incomes list as a deduction
      res.total_taxable_income         := 0.0;
      res.net_income                   := 0.0;
      res.marginal_rate_earned         := 0.0;
      res.marginal_rate_unearned       := 0.0;
      res.intermed.Clear;
      res.assigned_admin_costs         := 0.0;
      res.childs_contributions         := 0.0;
      res.student_accommodation_costs   := 0.0;     
      if( including_stocks )then
         res.total_student_loans       := 0.0;
         res.outstanding_student_loans := 0.0;
      end if;
   end Zero;

   procedure Zero( res : in out Benefit_Unit_Result; including_stocks : Boolean ) is
   begin
      for p in res.pers'Range loop
         res.pers( p ).Zero( including_stocks );
      end loop;
      res.total_taxable_income := 0.0;
      res.net_income := 0.0;
      res.intermed.Clear;
   end Zero;

   procedure Zero( res : in out Household_Result; including_stocks : Boolean ) is
   begin
      for b in res.bus'Range loop
         res.bus( b ).Zero( including_stocks );
      end loop;
      res.vat                  := 0.0;
      res.total_taxable_income := 0.0;
      res.net_income           := 0.0;
      res.intermed.Clear;
   end Zero;

end Model.Results;
