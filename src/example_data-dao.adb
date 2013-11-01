with Model_Types;

package body Example_Data.DAO is

   use Model_Types;

   procedure Get_Household( which : Positive; hh : in out Household'Class ) is
      wf : constant Amount := Amount( which );
   begin
      null;
--        for i in hh.people'Range loop
--           hh.people( i ).age := 45 + i + which;
--           for j in Non_Calculated_Incomes_Range loop
--              hh.people( i ).income( j ) := ( 1000.0 * wf ) +  Amount( i*10 + Incomes_Type'Pos( j ));
--           end loop;
--        end loop;
   end Get_Household;

end Example_Data.DAO;
