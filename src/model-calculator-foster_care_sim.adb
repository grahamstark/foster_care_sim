with Ada.Exceptions;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

with AUnit.Assertions;
with AUnit.Test_Cases;

with Model.Abstract_Household;
with Example_Data;
with Example_Data.Model_Household;
with Model_Types;

package body Model.Calculator.Foster_Care_Sim is

   use Ada.Strings.Unbounded;
   use Ada.Text_IO;
   use Model_Types;

   use AUnit.Test_Cases;
   use AUnit.Assertions;
   use AUnit.Test_Cases.Registration;

   use Ada.Strings.Unbounded;
   use Ada.Exceptions;

   DEFAULT_ACTIVITY_TIMES_STANDARD : constant Activity_Times :=
     ( initial_review   => ( 14.5, 6.833, 1.083 ),
       maintenance     => (  3.0,  2.5,   0.833 ),
       placement_ceases => ( 21.75, 13.0, 1.66 ),
       bi_annual_review     => ( 7.08, 4.25, 1.0 ));



   --
   -- Table 7.2
   --
   DEFAULT_ACTIVITY_TIMES_WHEN_READY : constant Activity_Times :=
     ( initial_review   => ( 14.5, 6.833, 1.083 ),
       maintenance     => (  3.0, 2.5,   0.833 ),
       placement_ceases => ( 21.75, 13.0, 1.66 ),
       bi_annual_review     => ( 7.08, 4.25, 1.0 ));

--     DEFAULT_PRACTITIONER_COSTS : constant Practioner_Costs :=
--       (
--
--
--       );
--
   function Get_Income( inc : Amount; bands : Vector; amounts : Vector ) return Amount is
   begin
      for i in bands'Range loop
         if( inc <= bands( i ))then
            return amounts( i );
         end if;
      end loop;
      return 0.0;
   end Get_Income;

   function Get_Income( age : Age_Range; bands : Age_Limit_Array; amounts : Amount_Array ) return Amount is
   begin
      for i in bands'Range loop
         if( age <= bands( i ))then
            return amounts( i );
         end if;
      end loop;
      return 0.0;
   end Get_Income;

   procedure Calculate_Foster_Care_Payments(
      sys       : Foster_Payment_System;
      hh        : Household;
      res       : in out Model.Results.Household_Result ) is
      pres : Personal_Result renames res.bus( 1 ).pers( 1 );
   begin
      -- assign everything to person 1, bu 1
      for buno in 1 .. hh.num_benefit_units loop
         declare
            startp : constant Person_Number := ( if buno = 1 then 2 else 1 );
         begin
            for pno in startp .. hh.benefit_units( buno ).num_people loop
               declare
                  pers : Person renames hh.benefit_units( buno ).people( pno );
               begin
                  if pers.foster_status = currently_fostered then
                     pres.incomes( foster_care_payments ) := pres.incomes( foster_care_payments ) +
                        Get_Income( pers.age, sys.age_limits, sys.minimum_amounts );
                     res.bus( buno ).pers( pno ).childs_contributions := Get_Income( pers.age, sys.age_limits, sys.childs_contributions );
                  end if;
               end;
            end loop;
         end;
      end loop;
   end Calculate_Foster_Care_Payments;

   procedure Calculate_Activity_Costs(
      sys       : Social_Care_Costs;
      pers      : Person;
      events    : Events_Set;
      res       : in out Model.Results.Personal_Result ) is
   begin
      -- , maintenance, placement_ceases, bi_annual_review
      if pers.age <= 21 then 
         res.assigned_admin_costs := 0.0;
         if events.Contains_Event( start_fostering )then
            Inc( res.assigned_admin_costs, sys.current_system( initial_review ));
         end if;
         if events.Contains_Event( leave_fostering )then
            if( pers.age <= 18 )then
               Inc( res.assigned_admin_costs, sys.current_system( placement_ceases ));
            else
               Inc( res.assigned_admin_costs, sys.when_i_am_ready( placement_ceases ));
            end if;
         end if;
         -- if events.Contains_Event( start_wiar ) then
         -- end if;
         if pers.foster_status = currently_fostered then
            if( pers.age = 19 )then
               Inc( res.assigned_admin_costs, sys.when_i_am_ready( initial_review ));
            end if;
            if pers.age <= 18 then
               Inc( res.assigned_admin_costs, 2.0 * sys.current_system( bi_annual_review )); -- 2 reviews per year
               Inc( res.assigned_admin_costs, sys.current_system( maintenance ));
            else
               Inc( res.assigned_admin_costs, 2.0 * sys.when_i_am_ready( bi_annual_review ));
               Inc( res.assigned_admin_costs, sys.when_i_am_ready( maintenance ));
            end if;
         end if;
      end if;
   end Calculate_Activity_Costs;

   procedure Calculate_Student_Loan_Repayments(
      sys       : Student_Loan_And_Grant_System;
      pers      : Person;
      res       : in out Model.Results.Personal_Result ) is
      payment : Amount := 0.0;
      income  : Amount := 0.0;
   begin
      if( res.outstanding_student_loans > 0.0 ) and
        ( pers.education = not_in_education ) and
        ( pers.age > 18 )then
         case sys.plan_type is
         when plan_2 =>
            income := Amount'Max( 0.0, res.total_taxable_income - sys.income_limit );
            payment := Amount'Min( res.outstanding_student_loans, income * sys.payment_rate );
         when plan_1 => null;
         end case;
         res.outstanding_student_loans := res.outstanding_student_loans - payment;
         res.incomes( repayments ) := payment;
      end if;
      -- add something to uprate student loans here...
   end  Calculate_Student_Loan_Repayments;

   procedure Get_Student_Grants_And_Loans(
      sys             : Student_Loan_And_Grant_System;
      hh              : Household;
      part_of_main_hh : Boolean;
      pers            : Person;
      taxable_income  : Amount;
      res             : in out Model.Results.Personal_Result ) is
      num_kids : Child_Count := hh.Get_Num_Children;
      is_independent : Boolean := ( pers.years_fostered > 0.0 or pers.age > 25 );
   begin
      -- type Education_Type is ( not_in_education, school, apprentice, further_education, higher_education );
      if pers.age in 16 .. 18 and pers.education = school then
         declare
            income_limit : constant Amount := ( if num_kids > 1 then sys.ema_income_limit_w_kids else sys.ema_income_limit );
         begin
            if( taxable_income < income_limit )then
               res.incomes( education_allowances ) := sys.ema;
            end if;
            -- sys.ema;
         end;
      elsif pers.age in 19 .. 21 and pers.education = further_education then
         -- assume full time
         res.incomes( education_allowances ) := Get_Income( taxable_income, sys.algfe_income_limit, sys.algfe );
      elsif pers.age >= 16 and pers.education = higher_education then
         -- maintenance_loan <= 60
         declare
            asl : Amount := Get_Income( taxable_income, sys.grant_income_limits, sys.assembly_learning_grant );
            ml  : Amount := Get_Income( taxable_income, sys.grant_income_limits, sys.maintenance_loan_away );
         begin
            res.incomes( student_grants ) := asl + sys.tuition_fee_grant;
            if( pers.years_fostered > 0.0 ) then
               if( pers.years_in_education > 0.0 ) and ( pers.years_in_education <= 1.0 )then
                  Inc( res.incomes( student_grants ), sys.higher_education_bursary );
               end if;
               if( not part_of_main_hh )then
                  res.student_accommodation_costs := sys.average_accommodation_costs_out_of_term_time;
               end if;
               -- Inc( res.incomes( student_grants ),  );
            end if;   
            Inc( res.total_student_loans, ml + sys.tuition_fee_loan );            
            res.incomes( student_loans ) := ml + sys.tuition_fee_loan; 
            Inc( res.outstanding_student_loans, ml + sys.tuition_fee_loan );   
         end;
      end if;
   end Get_Student_Grants_And_Loans;

   function Get_Activity_Cost( activity : Admin_Activity_Type; regime : Regime_Type  ) return Amount is
      a : Amount := 0.0;
   begin
      return a;
   end Get_Activity_Cost;


   function Get_Practioner_Costs return Practioner_Costs is
      p : Practioner_Costs := ( others => 0.0) ; -- := DEFAULT_PRACTITIONER_COSTS;
   begin

      return p;
   end Get_Practioner_Costs;

   procedure Run_Sim is
   begin
      null;
   end Run_Sim;

end Model.Calculator.Foster_Care_Sim;
