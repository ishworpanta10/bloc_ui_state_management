import 'package:bloc_state_management/bloc/ui_state_management/change_form_decoration_bloc.dart';
import 'package:bloc_state_management/bloc/ui_state_management/color_change_bloc.dart';
import 'package:bloc_state_management/bloc/ui_state_management/dropdown_change_bloc.dart';
import 'package:bloc_state_management/bloc/ui_state_management/select_button_and_get_text_data_bloc.dart';
import 'package:bloc_state_management/bloc/ui_state_management/select_button_bloc.dart';
import 'package:bloc_state_management/models/button_model.dart';
import 'package:bloc_state_management/models/select_button_and_take_data_bloc_model.dart';
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
            //basic ui for text and color
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
            //bloc event button for above widget
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
                          var color = Colors.black;
                          if (dropDownState == "Green") {
                            color = colorList[0];
                          } else if (dropDownState == "Blue") {
                            color = colorList[1];
                          } else if (dropDownState == "Red") {
                            color = colorList[2];
                          } else if (dropDownState == "Orange") {
                            color = colorList[3];
                          }
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(color: color),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                )
              ],
            ),
            divider,
            //select button and change button bg color with bloc
            Row(
              children: [
                ...List.generate(buttonModelList.length, (index) {
                  final buttonModel = buttonModelList[index];
                  return BlocBuilder<SelectButtonBloc, int>(
                    builder: (context, buttonState) {
                      print(buttonState);
                      return Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: index == buttonState ? Colors.greenAccent : null,
                          ),
                          onPressed: () {
                            print(index);
                            BlocProvider.of<SelectButtonBloc>(context).add(index);
                          },
                          child: Text(buttonModel.text),
                        ),
                      );
                    },
                  );
                })
              ],
            ),
            divider,
            //select button and change bg color and take button data with bloc
            Row(
              children: [
                ...List.generate(buttonModelList.length, (index) {
                  final buttonModel = buttonModelList[index];
                  return BlocBuilder<SelectButtonAndTakeTextDataBloc, SelectButtonAndTakeDataBlocModel>(
                    builder: (context, buttonState) {
                      return Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: index == buttonState.position ? Colors.greenAccent : null,
                          ),
                          onPressed: () {
                            BlocProvider.of<SelectButtonAndTakeTextDataBloc>(context).add(
                              SelectButtonAndTakeDataBlocModel(
                                position: index,
                                textData: buttonModel.text,
                              ),
                            );
                            print("Selected Index : ${buttonState.position}");
                            print("Selected Text : ${buttonState.textData}");
                          },
                          child: Text(buttonModel.text),
                        ),
                      );
                    },
                  );
                })
              ],
            ),
            BlocBuilder<SelectButtonAndTakeTextDataBloc, SelectButtonAndTakeDataBlocModel>(
              builder: (context, selectDataModel) {
                return selectDataModel.textData.isNotEmpty ? Text("Selected Button is ${selectDataModel.textData} and Index is ${selectDataModel.position}") : Container();
              },
            ),
            divider,
            BlocBuilder<ChangeFormDecorationAfterUserInputBloc, bool>(
              builder: (context, changeFormColorState) {
                return TextFormField(
                  decoration: InputDecoration(
                    hintText: 'email',
                    filled: changeFormColorState,
                    fillColor: Colors.green.withOpacity(0.6),
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    BlocProvider.of<ChangeFormDecorationAfterUserInputBloc>(context).add(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
