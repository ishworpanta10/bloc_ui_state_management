import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/ui_state_management/basic_text_state_management_bloc.dart';
import 'bloc/ui_state_management/basic_toggle_bloc.dart';
import 'bloc/ui_state_management/change_form_decoration_bloc.dart';
import 'bloc/ui_state_management/color_change_bloc.dart';
import 'bloc/ui_state_management/date_picker_bloc.dart';
import 'bloc/ui_state_management/dropdown_change_bloc.dart';
import 'bloc/ui_state_management/get_form_string_data_bloc.dart';
import 'bloc/ui_state_management/radio_button_toggle_bloc.dart';
import 'bloc/ui_state_management/range_slide_bloc.dart';
import 'bloc/ui_state_management/select_button_and_get_text_data_bloc.dart';
import 'bloc/ui_state_management/select_button_bloc.dart';
import 'cubit/change_form_decoration_after_user_input_cubit.dart';
import 'cubit/date_picker_cubit.dart';
import 'cubit/select_button_and_take_text_cubit.dart';
import 'screens/screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BasicTextManagementBloc(),
        ),
        BlocProvider(
          create: (_) => ColorChangeBloc(),
        ),
        BlocProvider(
          create: (_) => DropdownChangeBloc(),
        ),
        BlocProvider(
          create: (_) => SelectButtonBloc(),
        ),
        BlocProvider(
          create: (_) => SelectButtonAndTakeTextDataBloc(),
        ),
        BlocProvider(
          create: (_) => ChangeFormDecorationAfterUserInputBloc(),
        ),
        BlocProvider(
          create: (_) => GetFormStringDataBloc(),
        ),
        BlocProvider(
          create: (_) => PasswordToggleInFormBloc(),
        ),
        BlocProvider(
          create: (_) => RadioButtonToggleBloc(),
        ),
        BlocProvider(
          create: (_) => RangeSlideBloc(),
        ),
        BlocProvider(
          create: (_) => DatePickerBloc(),
        ),
        BlocProvider(
          create: (_) => DatePickerCubit(),
        ),
        BlocProvider(
          create: (_) => ChangeFormDecorationAfterUserInputCubit(),
        ),
        BlocProvider(
          create: (_) => SelectButtonAndTakeTextDataCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc State Management Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
