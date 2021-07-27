import 'package:bloc_state_management/bloc/ui_state_management/color_change_bloc.dart';
import 'package:bloc_state_management/bloc/ui_state_management/dropdown_change_bloc.dart';
import 'package:bloc_state_management/bloc/ui_state_management/select_button_bloc.dart';
import 'package:bloc_state_management/models/button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ui_state_management/basic_text_state_management_bloc.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static final List<Color> colorList = [Colors.green, Colors.blue, Colors.red, Colors.orange, Colors.cyanAccent, Colors.black, Colors.purple];
  static final dropDownItemsList = ["Green", "Blue", "Red", "Orange"];
  final List<ButtonModel> buttonModelList = [
    ButtonModel(text: "Menu", icon: Icons.menu),
    ButtonModel(text: "Home", icon: Icons.account_balance_sharp),
    ButtonModel(text: "Form", icon: Icons.email),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc State Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<BasicTextManagementBloc, bool>(
              builder: (context, textChangeState) {
                return BlocBuilder<DropdownChangeBloc, String>(
                  builder: (context, state) {
                    var color = Colors.black;
                    if (state == "Green") {
                      color = colorList[0];
                    } else if (state == "Blue") {
                      color = colorList[1];
                    } else if (state == "Red") {
                      color = colorList[2];
                    } else if (state == "Orange") {
                      color = colorList[3];
                    }
                    return BlocBuilder<ColorChangeBloc, ColorModel>(
                      builder: (context, stateColor) {
                        return Text(
                          textChangeState ? "I am Changed because someone fire me" : "Bloc state Management",
                          style: TextStyle(
                            // color: colorState,
                            color: stateColor.color,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            Row(
              children: [
                Flexible(
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<BasicTextManagementBloc>(context).add(true);
                    },
                    child: const Text('Change Text'),
                  ),
                ),
                BlocBuilder<ColorChangeBloc, ColorModel>(
                  builder: (context, stateColor) {
                    return Flexible(
                      child: TextButton(
                        onPressed: () {
                          // final shuffleList = colorList
                          //   ..shuffle()
                          //   ..toList();
                          BlocProvider.of<ColorChangeBloc>(context).add(ColorModel(index: stateColor.index + 1));
                        },
                        child: const Text('Change Color'),
                      ),
                    );
                  },
                ),
                sbw10,
                Flexible(
                  child: BlocBuilder<DropdownChangeBloc, String?>(
                    builder: (context, dropDownState) {
                      return DropdownButton<String>(
                        onChanged: (value) {
                          print(value);
                          BlocProvider.of<DropdownChangeBloc>(context).add(value!);
                        },
                        value: dropDownState,
                        items: dropDownItemsList.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                      );
                    },
                  ),
                )
              ],
            ),
            divider,
            ...List.generate(buttonModelList.length, (index) {
              final buttonModel = buttonModelList[index];
              return BlocBuilder<SelectButtonBloc, int>(
                builder: (context, buttonState) {
                  print(buttonState);
                  return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: index == buttonState ? Colors.greenAccent : null,
                    ),
                    onPressed: () {
                      print(index);
                      BlocProvider.of<SelectButtonBloc>(context).add(index);
                    },
                    child: Text(buttonModel.text),
                  );
                },
              );
            }),
            // TextFormField(
            //   decoration: const InputDecoration(hintText: 'email'),
            //   onChanged: (value) {
            //     print(value);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
