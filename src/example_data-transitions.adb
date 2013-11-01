package body Example_Data.Transitions is
   
   use Model_Types;
   use Base_Model_Types;

   procedure Transition( hh : in out Household; events : Events_Set ) is
   begin
      for event of events loop
         case event is
           when others => null;
         end case;
      end loop;
   end Transition;

   procedure Transition( pers : in out Person; events : Events_Set )is
   begin
      for event of events loop
         case event is
           when age_1_year =>
             pers.age := pers.age + 1;
             pers.wage_per_hour := Infer_Wage( pers );
           when 
           when others => null;
         end case;
      end loop;
   end Transition;

   function Infer_Wage( p : Person ) return Amount is
   begin
      return p.wage_per_hour;
   end Infer_Wage;

   function Minimum_Wage( p : Person ) return Amount is
      mw : Amount;
   begin
       if( p.education = apprentice )then
          mw := 2.68;
       else
          case p.age is
            when 21..Age_Range'Last => mw := 6.31;
            when 18 .. 20 => mw := 5.03;
            when 16 .. 17 => mw := 3.72;
            when 0 .. 15 => mw  := 0.0;
          end case;
       end if;
       return mw;
--      the adult rate will increase by 12p to £6.31 an hour
--      the rate for 18-20 year olds will increase by 5p to £5.03 an hour
--      the rate for 16-17 year olds will increase by 4p to £3.72 an hour
--      the apprentice rate will increase by 3p to £2.68 an hour
--      the accommodation offset increases from the current £4.82 to £4.91
   end Minimum_Wage;

end Example_Data.Transitions;