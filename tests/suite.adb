--
-- Created by ada_generator.py on 2013-04-12 16:52:17.765545
-- 
with AUnit.Test_Suites; use AUnit.Test_Suites;

-- with LAB_Test;
with AFT_Tests;

with GNAT.Command_Line;
with Ada.Text_IO;

function Suite return Access_Test_Suite is
   
use GNAT.Command_Line;   
use Ada.Text_IO;
   
   result              : Access_Test_Suite := new Test_Suite;
   run_old_tests       : Boolean := False;
   create_frs          : Boolean := False;
   run_generator_tests : Boolean := False;
   
   
   
begin
   Add_Test( result, new AFT_Tests.Test_Case );
   return result;
end Suite;
