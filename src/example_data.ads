with Model_Types;
with Base_Model_Types;
with T_Utils;
with Ada.Calendar;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

package Example_Data is

   use Model_Types;
   use Base_Model_Types;
   use Ada.Calendar;
   use Ada.Strings.Unbounded;

   WEEKS_WORKED_PER_YEAR : constant := 52; -- assume holiday pay as HR suggested
   ONE_BEDROOM_FLAT_SOCIAL_HOUSING : constant Amount := 64.63;
   type Foster_Status_Type is ( not_fostered, currently_fostered, when_i_am_ready, previously_fostered );
   type Event_Type is (
	     age_1_year,
        start_fostering,
        leave_fostering,
        start_wiar,
        end_wiar,
        leave_school,
        start_apprenticeship,
        completes_apprenticeship,
        start_higher_education,
        end_higher_education,
        start_work,
        leave_work,
        leave_household,
        completes_gcses,
        completes_a_levels,
        graduates,
        wages_bump,
        arbitrary_event );
   
   type Event_Obj is tagged record
      event       : Event_Type;
      name        : Unbounded_String;
      value       : Amount := 0.0;
      cost_centre : Budget_Type;
   end record;
   
   package Event_Ops is new Ada.Containers.Vectors( Index_Type=>Positive, Element_Type => Event_Obj );
   type Events_Set is new Event_Ops.Vector with null record;
   procedure Add_Event( events : in out Events_Set; event : Event_Type ); 
   procedure Add_Arbitrary_Event( 
      events      : in out Events_Set; 
      name        : String; 
      value       : Amount; 
      cost_centre : Budget_Type  ); 
   function Contains_Event( events : Events_Set; event : Event_Type ) return Boolean; 
   function Find_Event( events : Events_Set; event : Event_Type; found : out Boolean ) return Event_Obj'Class;
   function Find_Events( events : Events_Set; event : Event_Type; found : out Boolean ) return Events_Set'Class;
   

   -- package T_Events is new T_Utils(
      -- T             => Event_Type,
      -- Rate_Type     => Base_Model_Types.Rate,
      -- Amount_Type   => Base_Model_Types.Amount,
      -- Counter_Type  => Base_Model_Types.Counter_Type );
   -- subtype Events_List is T_Events.List;
   -- 
   function Event_String_Header( delim : Character; to_print : Positive ) return String;
   function To_String( events : Events_Set; to_print : Positive; delim : Character ) return String;
   
   type Events_List is array( Positive range <> ) of Events_Set;
   TARGET_YEAR : constant Year_Number := 2013;
   subtype Year_Range is Year_Number range TARGET_YEAR .. TARGET_YEAR + 25;

   type Income_Array is array(  Non_Calculated_Incomes_Range ) of Amount;

   type Person is tagged record
      pid           : Positive := 1;
      age           : Age_Range := Age_Range'First;
      gender        : Gender_Type := Gender_Type'First;
      education     : Education_Type := Education_Type'First;
      highest_qualification : Qualification_Type := Qualification_Type'First;
      employment    : Employment_Status := Employment_Status'First;
      income        : Income_Array := ( others => 0.0 );
      hours_worked  : Natural := 0;
      wage_per_hour : Amount := 0.0;
      relationship  : Relationship_Type := head;
      is_in_serps   : Boolean := False;
      foster_status : Foster_Status_Type := not_fostered;
      -- state data
      -- state
      years_fostered              : Amount := 0.0;
      years_in_education          : Amount := 0.0;
      years_in_work_this_spell    : Amount := 0.0;
      years_unemployed_this_spell : Amount := 0.0;
      years_in_work_total         : Amount := 0.0;
      years_unemployed_total      : Amount := 0.0;
      wage_scale                  : Rate := 1.0;
      ends_fostering_this_period  : Boolean := False;
   end record;

   function To_String( pers : Person ) return String;
   function Summary_String( pers : Person; delim :Character ) return String;
   function Infer_Wage( p : Person ) return Amount;
   function Minimum_Wage( p : Person ) return Amount;

   type Person_Array is array( Person_Number ) of Person;

   type Benefit_Unit is tagged record
      num_people   : Person_Count := 0;
      bu_number    : Benefit_Unit_Number := 1; 
      people       : Person_Array;
   end record;
   function To_String( bu : Benefit_Unit ) return String;

   type Benefit_Unit_Array is array( 1 .. 2 ) of Benefit_Unit;

   type Household is tagged record
      housing           : Housing_Array := ( others => 0.0 );
      tenure            : Tenure_Type := Tenure_Type'First;
      num_benefit_units : Benefit_Unit_Count := Benefit_Unit_Count'First;
      benefit_units     : Benefit_Unit_Array;
   end record;

   function To_String( hh : Household ) return String;
   procedure Find_Person( hh : Household; pid : Positive; buno : out Benefit_Unit_Number; pno : out Person_Number; found : out Boolean );
   function Find_Person( hh : Household; pid : Positive; found : out Boolean ) return Person'Class;
   procedure Delete_BU( hh : in out Household; buno : Benefit_Unit_Number );

   function Get_Num_Children( hh : Household ) return Child_Count;

   procedure Trigger_Events(
      hh              : in out Household;
      parents_hh      : out Household;
      events          : Events_Set'Class;
      target_pid      : Positive );

   function Get_One_Person( hh : Household; which_bu : Benefit_Unit_Number; which_pers : Person_Number ) return Person'Class;
   
   function Summary_String_Header( delim : Character ) return String;
      
   function Vatable_Expenditure( p : Person; inc : Amount ) return Amount;

end Example_Data;
