pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~harness.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~harness.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E181 : Short_Integer; pragma Import (Ada, E181, "system__os_lib_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__soft_links_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "system__fat_lflt_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "system__fat_llf_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "system__exception_table_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "ada__containers_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "ada__io_exceptions_E");
   E271 : Short_Integer; pragma Import (Ada, E271, "ada__numerics_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "ada__strings_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "ada__strings__maps_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "ada__strings__maps__constants_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__tags_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__streams_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "interfaces__c_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "interfaces__c__strings_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "system__exceptions_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__finalization_root_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "ada__finalization_E");
   E311 : Short_Integer; pragma Import (Ada, E311, "system__regpat_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__storage_pools_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "system__finalization_masters_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "system__storage_pools__subpools_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "ada__calendar_E");
   E287 : Short_Integer; pragma Import (Ada, E287, "ada__calendar__time_zones_E");
   E289 : Short_Integer; pragma Import (Ada, E289, "gnat__calendar_E");
   E291 : Short_Integer; pragma Import (Ada, E291, "gnat__calendar__time_io_E");
   E295 : Short_Integer; pragma Import (Ada, E295, "gnat__directory_operations_E");
   E270 : Short_Integer; pragma Import (Ada, E270, "system__assertions_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "system__pool_global_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "system__file_control_block_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "ada__streams__stream_io_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "system__file_io_E");
   E350 : Short_Integer; pragma Import (Ada, E350, "system__direct_io_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "system__object_reader_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "system__dwarf_lines_E");
   E280 : Short_Integer; pragma Import (Ada, E280, "system__random_seed_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__secondary_stack_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "ada__strings__unbounded_E");
   E318 : Short_Integer; pragma Import (Ada, E318, "ada__directories_E");
   E308 : Short_Integer; pragma Import (Ada, E308, "gnat__expect_E");
   E384 : Short_Integer; pragma Import (Ada, E384, "gnat__string_split_E");
   E322 : Short_Integer; pragma Import (Ada, E322, "system__regexp_E");
   E424 : Short_Integer; pragma Import (Ada, E424, "gnat__command_line_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "system__strings__stream_ops_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "ada__text_io_E");
   E355 : Short_Integer; pragma Import (Ada, E355, "ada__text_io__editing_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "ada_containers__aunit_lists_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "aunit_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "aunit__memory_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "aunit__memory__utils_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "aunit__tests_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "aunit__test_filters_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "aunit__time_measure_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "aunit__test_results_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "aunit__assertions_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "aunit__reporter_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "aunit__reporter__text_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "aunit__simple_test_cases_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "aunit__test_cases_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "aft_tests_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "aunit__test_suites_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "aunit__run_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "base_model_types_E");
   E399 : Short_Integer; pragma Import (Ada, E399, "financial_functions_E");
   E301 : Short_Integer; pragma Import (Ada, E301, "gnatcoll__mmap_E");
   E304 : Short_Integer; pragma Import (Ada, E304, "gnatcoll__utils_E");
   E336 : Short_Integer; pragma Import (Ada, E336, "gnatcoll__io_E");
   E328 : Short_Integer; pragma Import (Ada, E328, "gnatcoll__path_E");
   E340 : Short_Integer; pragma Import (Ada, E340, "gnatcoll__io__native_E");
   E323 : Short_Integer; pragma Import (Ada, E323, "gnatcoll__remote_E");
   E338 : Short_Integer; pragma Import (Ada, E338, "gnatcoll__io__remote_E");
   E342 : Short_Integer; pragma Import (Ada, E342, "gnatcoll__io__remote__unix_E");
   E344 : Short_Integer; pragma Import (Ada, E344, "gnatcoll__io__remote__windows_E");
   E326 : Short_Integer; pragma Import (Ada, E326, "gnatcoll__remote__db_E");
   E330 : Short_Integer; pragma Import (Ada, E330, "gnatcoll__vfs_E");
   E283 : Short_Integer; pragma Import (Ada, E283, "gnatcoll__traces_E");
   E316 : Short_Integer; pragma Import (Ada, E316, "gnatcoll__vfs_utils_E");
   E407 : Short_Integer; pragma Import (Ada, E407, "line_extractor_E");
   E359 : Short_Integer; pragma Import (Ada, E359, "numeric_io_E");
   E401 : Short_Integer; pragma Import (Ada, E401, "optimiser_E");
   E348 : Short_Integer; pragma Import (Ada, E348, "random_normal_draw_E");
   E346 : Short_Integer; pragma Import (Ada, E346, "maths_functions_E");
   E361 : Short_Integer; pragma Import (Ada, E361, "set_of_E");
   E390 : Short_Integer; pragma Import (Ada, E390, "t_utils_E");
   E392 : Short_Integer; pragma Import (Ada, E392, "tax_utils_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "text_utils_E");
   E405 : Short_Integer; pragma Import (Ada, E405, "keyed_text_buffer_E");
   E403 : Short_Integer; pragma Import (Ada, E403, "key_value_io_E");
   E364 : Short_Integer; pragma Import (Ada, E364, "utils_E");
   E357 : Short_Integer; pragma Import (Ada, E357, "format_utils_E");
   E370 : Short_Integer; pragma Import (Ada, E370, "zip_streams_E");
   E366 : Short_Integer; pragma Import (Ada, E366, "zip_E");
   E372 : Short_Integer; pragma Import (Ada, E372, "zip__compress_E");
   E374 : Short_Integer; pragma Import (Ada, E374, "zip__compress__shrink_E");
   E380 : Short_Integer; pragma Import (Ada, E380, "zip__crc_E");
   E368 : Short_Integer; pragma Import (Ada, E368, "zip__headers_E");
   E382 : Short_Integer; pragma Import (Ada, E382, "zip__create_E");
   E397 : Short_Integer; pragma Import (Ada, E397, "model_E");
   E353 : Short_Integer; pragma Import (Ada, E353, "model_types_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "example_data_E");
   E394 : Short_Integer; pragma Import (Ada, E394, "example_data__examples_E");
   E408 : Short_Integer; pragma Import (Ada, E408, "model__abstract_household_E");
   E396 : Short_Integer; pragma Import (Ada, E396, "example_data__model_household_E");
   E422 : Short_Integer; pragma Import (Ada, E422, "model__parameter_system__defaults_E");
   E414 : Short_Integer; pragma Import (Ada, E414, "model__results_E");
   E411 : Short_Integer; pragma Import (Ada, E411, "model__calculator__direct_tax_E");
   E416 : Short_Integer; pragma Import (Ada, E416, "model__calculator__driver_E");
   E418 : Short_Integer; pragma Import (Ada, E418, "model__calculator__foster_care_sim_E");
   E420 : Short_Integer; pragma Import (Ada, E420, "model__calculator__universal_benefit_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E186 := E186 - 1;
      E414 := E414 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "model__results__finalize_spec");
      begin
         F1;
      end;
      E396 := E396 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "example_data__model_household__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "model__abstract_household__finalize_spec");
      begin
         E408 := E408 - 1;
         F3;
      end;
      E266 := E266 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "example_data__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "model_types__finalize_spec");
      begin
         E353 := E353 - 1;
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "model__finalize_spec");
      begin
         E397 := E397 - 1;
         F6;
      end;
      E382 := E382 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "zip__create__finalize_spec");
      begin
         F7;
      end;
      E370 := E370 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "zip_streams__finalize_spec");
      begin
         F8;
      end;
      E194 := E194 - 1;
      E407 := E407 - 1;
      E196 := E196 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "text_utils__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "line_extractor__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "gnatcoll__traces__finalize_body");
      begin
         E283 := E283 - 1;
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "gnatcoll__traces__finalize_spec");
      begin
         F12;
      end;
      E330 := E330 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "gnatcoll__vfs__finalize_spec");
      begin
         F13;
      end;
      E338 := E338 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "gnatcoll__io__remote__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "gnatcoll__remote__finalize_spec");
      begin
         E323 := E323 - 1;
         F15;
      end;
      E340 := E340 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "gnatcoll__io__native__finalize_spec");
      begin
         F16;
      end;
      E336 := E336 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "gnatcoll__io__finalize_spec");
      begin
         F17;
      end;
      declare
         procedure F18;
         pragma Import (Ada, F18, "base_model_types__finalize_spec");
      begin
         F18;
      end;
      E104 := E104 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "aunit__test_suites__finalize_spec");
      begin
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "aft_tests__finalize_spec");
      begin
         F20;
      end;
      E192 := E192 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "aunit__test_cases__finalize_spec");
      begin
         F21;
      end;
      E107 := E107 - 1;
      E109 := E109 - 1;
      declare
         procedure F22;
         pragma Import (Ada, F22, "aunit__simple_test_cases__finalize_spec");
      begin
         F22;
      end;
      E092 := E092 - 1;
      declare
         procedure F23;
         pragma Import (Ada, F23, "aunit__reporter__text__finalize_spec");
      begin
         F23;
      end;
      E111 := E111 - 1;
      declare
         procedure F24;
         pragma Import (Ada, F24, "aunit__assertions__finalize_spec");
      begin
         F24;
      end;
      E077 := E077 - 1;
      declare
         procedure F25;
         pragma Import (Ada, F25, "aunit__test_results__finalize_spec");
      begin
         F25;
      end;
      declare
         procedure F26;
         pragma Import (Ada, F26, "aunit__test_filters__finalize_spec");
      begin
         F26;
      end;
      declare
         procedure F27;
         pragma Import (Ada, F27, "aunit__tests__finalize_spec");
      begin
         E112 := E112 - 1;
         F27;
      end;
      E174 := E174 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "ada__text_io__finalize_spec");
      begin
         F28;
      end;
      E318 := E318 - 1;
      E322 := E322 - 1;
      declare
         procedure F29;
         pragma Import (Ada, F29, "system__regexp__finalize_spec");
      begin
         F29;
      end;
      E308 := E308 - 1;
      declare
         procedure F30;
         pragma Import (Ada, F30, "gnat__expect__finalize_spec");
      begin
         F30;
      end;
      declare
         procedure F31;
         pragma Import (Ada, F31, "ada__directories__finalize_spec");
      begin
         F31;
      end;
      E188 := E188 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "ada__strings__unbounded__finalize_spec");
      begin
         F32;
      end;
      declare
         procedure F33;
         pragma Import (Ada, F33, "system__object_reader__finalize_body");
      begin
         E163 := E163 - 1;
         F33;
      end;
      E114 := E114 - 1;
      E167 := E167 - 1;
      declare
         procedure F34;
         pragma Import (Ada, F34, "system__file_io__finalize_body");
      begin
         E176 := E176 - 1;
         F34;
      end;
      declare
         procedure F35;
         pragma Import (Ada, F35, "system__object_reader__finalize_spec");
      begin
         F35;
      end;
      E350 := E350 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "system__direct_io__finalize_spec");
      begin
         F36;
      end;
      E214 := E214 - 1;
      declare
         procedure F37;
         pragma Import (Ada, F37, "ada__streams__stream_io__finalize_spec");
      begin
         F37;
      end;
      declare
         procedure F38;
         pragma Import (Ada, F38, "system__file_control_block__finalize_spec");
      begin
         E184 := E184 - 1;
         F38;
      end;
      E128 := E128 - 1;
      declare
         procedure F39;
         pragma Import (Ada, F39, "system__pool_global__finalize_spec");
      begin
         F39;
      end;
      declare
         procedure F40;
         pragma Import (Ada, F40, "system__storage_pools__subpools__finalize_spec");
      begin
         F40;
      end;
      declare
         procedure F41;
         pragma Import (Ada, F41, "system__finalization_masters__finalize_spec");
      begin
         F41;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Fat_Lflt'Elab_Spec;
      E262 := E262 + 1;
      System.Fat_Llf'Elab_Spec;
      E226 := E226 + 1;
      System.Exception_Table'Elab_Body;
      E042 := E042 + 1;
      Ada.Containers'Elab_Spec;
      E204 := E204 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E100 := E100 + 1;
      Ada.Numerics'Elab_Spec;
      E271 := E271 + 1;
      Ada.Strings'Elab_Spec;
      E145 := E145 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E199 := E199 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E066 := E066 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E048 := E048 + 1;
      System.Finalization_Root'Elab_Spec;
      E124 := E124 + 1;
      Ada.Finalization'Elab_Spec;
      E122 := E122 + 1;
      System.Regpat'Elab_Spec;
      System.Storage_Pools'Elab_Spec;
      E126 := E126 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E086 := E086 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E287 := E287 + 1;
      Gnat.Calendar'Elab_Spec;
      E289 := E289 + 1;
      Gnat.Calendar.Time_Io'Elab_Spec;
      Gnat.Directory_Operations'Elab_Spec;
      System.Assertions'Elab_Spec;
      E270 := E270 + 1;
      System.Pool_Global'Elab_Spec;
      E128 := E128 + 1;
      System.File_Control_Block'Elab_Spec;
      E184 := E184 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E214 := E214 + 1;
      System.Direct_Io'Elab_Spec;
      E350 := E350 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.Random_Seed'Elab_Body;
      E280 := E280 + 1;
      System.File_Io'Elab_Body;
      E176 := E176 + 1;
      E167 := E167 + 1;
      System.Finalization_Masters'Elab_Body;
      E114 := E114 + 1;
      E311 := E311 + 1;
      E140 := E140 + 1;
      E088 := E088 + 1;
      Ada.Tags'Elab_Body;
      E068 := E068 + 1;
      E149 := E149 + 1;
      System.Soft_Links'Elab_Body;
      E018 := E018 + 1;
      System.Os_Lib'Elab_Body;
      E181 := E181 + 1;
      System.Secondary_Stack'Elab_Body;
      E022 := E022 + 1;
      System.Dwarf_Lines'Elab_Body;
      E144 := E144 + 1;
      System.Object_Reader'Elab_Body;
      E163 := E163 + 1;
      Gnat.Directory_Operations'Elab_Body;
      E295 := E295 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E188 := E188 + 1;
      Ada.Directories'Elab_Spec;
      Gnat.Expect'Elab_Spec;
      E308 := E308 + 1;
      Gnat.String_Split'Elab_Spec;
      E384 := E384 + 1;
      System.Regexp'Elab_Spec;
      E322 := E322 + 1;
      Ada.Directories'Elab_Body;
      E318 := E318 + 1;
      Gnat.Command_Line'Elab_Spec;
      System.Strings.Stream_Ops'Elab_Body;
      E212 := E212 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E174 := E174 + 1;
      Gnat.Command_Line'Elab_Body;
      E424 := E424 + 1;
      E291 := E291 + 1;
      Ada.Text_Io.Editing'Elab_Spec;
      E355 := E355 + 1;
      E008 := E008 + 1;
      E005 := E005 + 1;
      E079 := E079 + 1;
      E082 := E082 + 1;
      Aunit.Tests'Elab_Spec;
      E112 := E112 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Time_Measure'Elab_Spec;
      E084 := E084 + 1;
      Aunit.Test_Results'Elab_Spec;
      Aunit.Test_Results'Elab_Body;
      E077 := E077 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E111 := E111 + 1;
      Aunit.Reporter'Elab_Spec;
      E012 := E012 + 1;
      Aunit.Reporter.Text'Elab_Spec;
      Aunit.Reporter.Text'Elab_Body;
      E092 := E092 + 1;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E109 := E109 + 1;
      E107 := E107 + 1;
      Aunit.Test_Cases'Elab_Spec;
      E192 := E192 + 1;
      Aft_Tests'Elab_Spec;
      Aunit.Test_Suites'Elab_Spec;
      E104 := E104 + 1;
      E102 := E102 + 1;
      Base_Model_Types'Elab_Spec;
      E301 := E301 + 1;
      GNATCOLL.UTILS'ELAB_SPEC;
      E304 := E304 + 1;
      GNATCOLL.IO'ELAB_SPEC;
      E336 := E336 + 1;
      GNATCOLL.PATH'ELAB_SPEC;
      GNATCOLL.PATH'ELAB_BODY;
      E328 := E328 + 1;
      GNATCOLL.IO.NATIVE'ELAB_SPEC;
      GNATCOLL.IO.NATIVE'ELAB_BODY;
      E340 := E340 + 1;
      GNATCOLL.REMOTE'ELAB_SPEC;
      E323 := E323 + 1;
      GNATCOLL.IO.REMOTE'ELAB_SPEC;
      E342 := E342 + 1;
      E344 := E344 + 1;
      GNATCOLL.REMOTE.DB'ELAB_SPEC;
      E326 := E326 + 1;
      E338 := E338 + 1;
      GNATCOLL.VFS'ELAB_SPEC;
      GNATCOLL.VFS'ELAB_BODY;
      E330 := E330 + 1;
      GNATCOLL.TRACES'ELAB_SPEC;
      GNATCOLL.VFS_UTILS'ELAB_SPEC;
      E316 := E316 + 1;
      GNATCOLL.TRACES'ELAB_BODY;
      E283 := E283 + 1;
      Line_Extractor'Elab_Spec;
      E401 := E401 + 1;
      E399 := E399 + 1;
      E348 := E348 + 1;
      E361 := E361 + 1;
      E359 := E359 + 1;
      Text_Utils'Elab_Spec;
      Text_Utils'Elab_Body;
      E196 := E196 + 1;
      E392 := E392 + 1;
      E346 := E346 + 1;
      E407 := E407 + 1;
      E194 := E194 + 1;
      E405 := E405 + 1;
      Utils'Elab_Spec;
      E357 := E357 + 1;
      E403 := E403 + 1;
      E390 := E390 + 1;
      Zip_Streams'Elab_Spec;
      E370 := E370 + 1;
      Zip'Elab_Spec;
      Zip.Compress'Elab_Spec;
      E380 := E380 + 1;
      E374 := E374 + 1;
      E372 := E372 + 1;
      Zip.Headers'Elab_Spec;
      Zip.Headers'Elab_Body;
      E368 := E368 + 1;
      E366 := E366 + 1;
      Zip.Create'Elab_Spec;
      E382 := E382 + 1;
      Utils'Elab_Body;
      E364 := E364 + 1;
      Model'Elab_Spec;
      E397 := E397 + 1;
      Model_Types'Elab_Spec;
      E353 := E353 + 1;
      Example_Data'Elab_Spec;
      Example_Data'Elab_Body;
      E266 := E266 + 1;
      E394 := E394 + 1;
      Model.Abstract_Household'Elab_Spec;
      E408 := E408 + 1;
      Example_Data.Model_Household'Elab_Spec;
      E396 := E396 + 1;
      E422 := E422 + 1;
      Model.Results'Elab_Spec;
      E414 := E414 + 1;
      E411 := E411 + 1;
      E418 := E418 + 1;
      Model.Calculator.Universal_Benefit'Elab_Body;
      E420 := E420 + 1;
      E416 := E416 + 1;
      Aft_Tests'Elab_Body;
      E186 := E186 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_harness");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/ada.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-charac.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-chlat1.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/gnat.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/interfac.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/system.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-addope.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-atocou.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-casuti.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-exnllf.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-expint.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-flocon.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgboo.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgcha.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imenne.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgint.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgdec.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imglli.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imglld.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-io.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-maccod.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-osprim.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-parame.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-crtl.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/i-cstrea.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-powtab.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-excdeb.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-stoele.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-stache.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-strhas.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-htable.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-string.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-traent.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-arit64.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-unstyp.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-expuns.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-fatlfl.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-fatllf.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgbiu.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgllb.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgllu.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgllw.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imguns.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgrea.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-imgwiu.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-vallld.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-valdec.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-valuns.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-valrea.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-valllu.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-vallli.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-valint.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-valenu.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-valboo.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-wchcon.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-wchjis.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-wchcnv.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-wchstw.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-elchha.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-bitops.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-carun8.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-conca2.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-valuti.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-conca3.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-conca4.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-conca5.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-conca6.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-conca7.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-conca8.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-conca9.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-exctab.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-contai.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-cohata.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-coprnu.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-crbltr.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-ioexce.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-numeri.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-gearop.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-numaux.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-string.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-strhas.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-stmaco.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-strsea.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-strbou.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-stream.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-commun.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-crtrun.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-except.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-finroo.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-finali.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-oscons.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/g-regpat.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-stopoo.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-spsufi.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-stratt.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-calend.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-catizo.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-assert.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-assert.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-memory.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-stalib.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-pooglo.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-ficobl.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-ststio.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-direio.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-nuflra.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-ransee.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-fileio.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-stposu.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-finmas.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-regpat.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/i-cstrin.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/i-c.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-tags.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-strsup.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-strfix.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-strmap.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-soflin.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-os_lib.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-comlin.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-chahan.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-secsta.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-rannum.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-calfor.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-addima.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-strunb.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-dirval.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/g-strspl.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-regexp.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-direct.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-ststop.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-except.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/s-traceb.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-textio.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-suteio.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-tigeau.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-tiflau.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-tienau.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-tideau.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-tiinau.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-teioed.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/a-tiunio.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/text_io.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/suite.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/harness.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/optimiser.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/financial_functions.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/random_normal_draw.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/set_of.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/numeric_io.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/text_utils.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/tax_utils.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/maths_functions.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/line_extractor.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/base_model_types.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/keyed_text_buffer.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/format_utils.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/key_value_io.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/t_utils.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/zip_streams.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/zip-crc.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/zip-compress-shrink.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/zip-compress.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/zip-headers.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/zip.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/zip-create.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/utils.o
   --   /home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/model.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model-calculator.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model_types.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/example_data.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/example_data-examples.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model-abstract_household.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/example_data-model_household.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model-parameter_system.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model-parameter_system-defaults.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model-results.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model-calculator-direct_tax.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model-calculator-foster_care_sim.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model-calculator-universal_benefit.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/model-calculator-driver.o
   --   /home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/aft_tests.o
   --   -L/home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/
   --   -L/home/graham_s/VirtualWorlds/projects/action_for_children/foster_care_sim/bin/
   --   -L/home/graham_s/VirtualWorlds/projects/tax_benefit_model_components/bin/
   --   -L/opt/gnat/2013/lib/aunit/native-full/
   --   -L/opt/gnat/2013/lib/xmlada/static/
   --   -L/opt/ada_libraries/2013/lib/aws/static/
   --   -L/opt/ada_libraries/2013/lib/gnatcoll/static/
   --   -L/opt/gnat/2013/lib/gnat_util/static/
   --   -L/opt/ada_libraries/simple_components/
   --   -L/opt/gnat/2013/lib/gcc/x86_64-pc-linux-gnu/4.7.4/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
