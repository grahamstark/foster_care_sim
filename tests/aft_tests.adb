with AUnit.Assertions;
with AUnit.Test_Cases;

with Ada.Exceptions;
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada.Calendar;

with GNATColl.Traces;

with Base_Model_Types;
with Example_Data.Examples;
with Example_Data.Model_Household;
with Example_Data;

with Model.Abstract_Household;
with Model.Calculator.Direct_Tax;
with Model.Calculator.Driver;
with Model.Calculator.Foster_Care_Sim;
with Model.Calculator.Universal_Benefit;
with Model.Parameter_System.Defaults;
with Model.Parameter_System;
with Model.Results;
with Model_Types;

package body AFT_Tests is

   use Ada.Strings.Unbounded;
   use Ada.Text_IO;

   use AUnit.Test_Cases;
   use AUnit.Assertions;
   use AUnit.Test_Cases.Registration;

   use Ada.Strings.Unbounded;
   use Ada.Exceptions;
   use Ada.Calendar;

   procedure Test_Params( t : in out AUnit.Test_Cases.Test_Case'Class ) is
     use Model.Parameter_System;
     s07: Income_Tax_System := Defaults.Get_Complete_System( 2007 ).it;
   begin
     Put_Line( s07.non_savings_income_rates.To_String );
     s07.non_savings_income_rates.Remove_Up_To( 1000.0 );
     Put_Line( s07.non_savings_income_rates.To_String );
     s07.savings_income_rates.Remove_Up_To( 30_000.0 );
     Put_Line( s07.savings_income_rates.To_String );
     s07.dividend_income_rates.Remove_Up_To( 120_000.0 );
     Put_Line( s07.dividend_income_rates.To_String );
   end Test_Params;

   use Example_Data;

   TARGET_YEAR : constant Year_Number := 2013;
   subtype Year_Range is Year_Number range TARGET_YEAR .. TARGET_YEAR + 20;


   procedure Test_Complete_System( t : in out AUnit.Test_Cases.Test_Case'Class ) is
     use Model.Parameter_System;
     use Model.Results;
     use Model.Abstract_Household;
     use Example_Data;
     use Example_Data.Model_Household;
     use Example_Data.Examples;
     use Base_Model_Types;
     use Model_Types;
     s13     : Complete_System := Model.Parameter_System.Defaults.Get_Complete_System( 2013 );
     results : Model.Results.Household_Result;
     target_pid : Positive := 2002;
     start, stop : Positive;
   begin
     for which_hh in catherine .. christian loop
        case which_hh is
           when catherine => start := 1; stop := 4;
           when christian => start := 1; stop := 9;
        end case;
        for eno in start .. stop loop
           declare
              fname : constant String := "output/" & which_hh'Img & "_path_" & eno'Img & ".csv";
              events  : Events_List := Example_Data.Examples.Create_Events( which_hh, eno );
           begin
              Put_Line( "Case " & eno'Img & " which_hh " & which_hh'Img );
              results.Zero( True );
              Model.Calculator.Driver.Run_Model( events, s13, which_hh, target_pid, results, fname );
           end;
        end loop;
     end loop;
   end Test_Complete_System;

   procedure Test_Income_Tax( t : in out AUnit.Test_Cases.Test_Case'Class ) is
     use Model.Parameter_System;
     use Model.Results;
     use Model_Types;
     use Model.Abstract_Household;
     use Example_Data;
     use Example_Data.Model_Household;
     use Example_Data.Examples;
     use Base_Model_Types;
     it07   : Income_Tax_System := Defaults.Get_Complete_System( 2007 ).it;
     ni07   : National_Insurance_System := Defaults.Get_Complete_System( 2007 ).ni;
     res : Model.Results.Personal_Result;
   begin
      for p in Pers_Type loop
         declare
            person : Model.Abstract_Household.Person'Class :=
               Example_Data.Model_Household.Map_Person( Example_Data.Examples.Get_Person( p ));
         begin
            Put_Line( p'Img );
            Model.Calculator.Direct_Tax.Calculate_Income_Tax( it07, person, res );
            Model.Calculator.Direct_Tax.Calculate_National_Insurance( ni07, person, res );
            Put_Line( "Income Tax " & To_String( res.incomes( income_tax )));
            Put_Line( "Employees' NI " & To_String( res.incomes( national_insurance )));
            Put_Line( "Employer's NI " & To_String( res.employers_ni ));
            Put_Line( Base_Model_Types.To_String( res.intermed, "   " ));
         end;
      end loop;
   end Test_Income_Tax;

   procedure Initialise_Logging( filename : String ) is
      use Ada.Text_IO;
   begin
      Put_Line( "Initialise_Logging reading from: |" & filename );
      GNATColl.Traces.Parse_Config_File( filename );
      Put_Line( "Log file read OK" );
   end Initialise_Logging;

   function Name ( t : Test_Case ) return Message_String is
   begin
      return Format( "Lab_Test Test Suite" );
   end Name;

   --  Preparation performed before each routine:
   procedure Set_Up( t : in out Test_Case ) is
   begin
      null;
   end Set_Up;

   --  Preparation performed after each routine:
   procedure Shut_Down( t : in out Test_Case ) is
   begin
      null;
   end Shut_Down;

   procedure Register_Tests (T : in out Test_Case) is
   begin
      -- Register_Routine (T, Test_Params'Access, "Test Params" );
      -- Register_Routine (T, Test_Income_Tax'Access, "Test Income Tax" );
      Register_Routine (T, Test_Complete_System'Access, "Test Universal Credit" );
   end Register_Tests;

begin
    Initialise_Logging( "etc/logging_config_file.txt" );
end AFT_Tests;
