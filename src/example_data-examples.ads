package Example_Data.Examples is

   type Pers_Type is ( peter, anita, laura );

   function Get_Person( who : Pers_Type ) return Person;

   type HH_Type is ( hh1, uc_anne, catherine, christian );
   function Get_Household( which : HH_Type ) return Household;

   function Create_Events( which : Positive ) return Events_List;

end Example_Data.Examples;
