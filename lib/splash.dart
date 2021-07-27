import 'package:bloc_state_management/bloc/ui_state_management/basic_text_state_management_bloc.dart';
import 'package:bloc_state_management/bloc/ui_state_management/color_change_bloc.dart';
import 'package:bloc_state_management/bloc/ui_state_management/dropdown_change_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/ui_state_management/select_button_bloc.dart';
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
