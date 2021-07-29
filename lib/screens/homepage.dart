import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ui_state_management/basic_text_state_management_bloc.dart';
import '../bloc/ui_state_management/basic_toggle_bloc.dart';
import '../bloc/ui_state_management/change_form_decoration_bloc.dart';
import '../bloc/ui_state_management/color_change_bloc.dart';
import '../bloc/ui_state_management/date_picker_bloc.dart';
import '../bloc/ui_state_management/dropdown_change_bloc.dart';
import '../bloc/ui_state_management/get_form_string_data_bloc.dart';
import '../bloc/ui_state_management/radio_button_toggle_bloc.dart';
import '../bloc/ui_state_management/range_slide_bloc.dart';
import '../bloc/ui_state_management/select_button_and_get_text_data_bloc.dart';
import '../bloc/ui_state_management/select_button_bloc.dart';
import '../models/button_model.dart';
import '../models/range_slide_model.dart';
import '../models/select_button_and_take_data_bloc_model.dart';
import '../widgets/widgets.dart';

enum RadioOptions { Singer, Dancer, Athletic }

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
                    // var color = Colors.black;
                    // if (state == "Green") {
                    //   color = HomePage.colorList[0];
                    // } else if (state == "Blue") {
                    //   color = HomePage.colorList[1];
                    // } else if (state == "Red") {
                    //   color = HomePage.colorList[2];
                    // } else if (state == "Orange") {
                    //   color = HomePage.colorList[3];
                    // }
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
                          // print(value);
                          BlocProvider.of<DropdownChangeBloc>(context).add(value!);
                        },
                        value: dropDownState,
                        items: HomePage.dropDownItemsList.map((e) {
                          var color = Colors.black;
                          if (dropDownState == "Green") {
                            color = HomePage.colorList[0];
                          } else if (dropDownState == "Blue") {
                            color = HomePage.colorList[1];
                          } else if (dropDownState == "Red") {
                            color = HomePage.colorList[2];
                          } else if (dropDownState == "Orange") {
                            color = HomePage.colorList[3];
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
                      // print(buttonState);
                      return Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: index == buttonState ? Colors.greenAccent : null,
                          ),
                          onPressed: () {
                            // print(index);
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
                            // print("Selected Index : ${buttonState.position}");
                            // print("Selected Text : ${buttonState.textData}");
                          },
                          child: Text(buttonModel.text),
                        ),
                      );
                    },
                  );
                })
              ],
            ),
            //selected data showing widget
            BlocBuilder<SelectButtonAndTakeTextDataBloc, SelectButtonAndTakeDataBlocModel>(
              builder: (context, selectDataModel) {
                return selectDataModel.textData.isNotEmpty ? Text("Selected Button is ${selectDataModel.textData} and Index is ${selectDataModel.position}") : Container();
              },
            ),
            divider,
            //form decoration change with user type bloc also getting data with another bloc
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
                    BlocProvider.of<GetFormStringDataBloc>(context).add(value);
                  },
                );
              },
            ),
            //  showing user typed data in bloc builder
            BlocBuilder<GetFormStringDataBloc, String>(
              builder: (context, formDataState) {
                return Text(formDataState);
              },
            ),

            divider,
            //password toggle bloc
            BlocBuilder<PasswordToggleInFormBloc, bool>(
              builder: (context, passwordState) {
                return TextFormField(
                  obscureText: passwordState,
                  decoration: InputDecoration(
                    hintText: "password",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<PasswordToggleInFormBloc>(context).add(!passwordState);
                      },
                      icon: Icon(passwordState ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
                      color: passwordState ? Colors.grey : Colors.blue,
                    ),
                  ),
                );
              },
            ),
            divider,
            //toggle radio tile with enum
            BlocBuilder<RadioButtonToggleBloc, RadioOptions>(
              builder: (context, radioToggleState) {
                // print("Toggle Radio Value $radioToggleState");
                // var toggleValue = "Singer";
                // if (radioToggleState == RadioOptions.Singer) {
                //   toggleValue = "Singer";
                // } else if (radioToggleState == RadioOptions.Dancer) {
                //   toggleValue = "Dancer";
                // } else if (radioToggleState == RadioOptions.Athletic) {
                //   toggleValue = "Athletic";
                // }
                // print("Toggle String Value $toggleValue");
                return Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: RadioOptions.Singer,
                            groupValue: radioToggleState,
                            onChanged: (value) {
                              context.read<RadioButtonToggleBloc>().add(value as RadioOptions);

                              // setState(() {
                              // // this _currentOption is defined in top with initial value as RadioOptions.Singer if we use setState
                              // // and we use _currentOption as groupValue and Change it as below using onChanged value
                              //   _currentOption = value as RadioOptions;
                              // });
                            },
                          ),
                          const Text('Singer'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: RadioOptions.Dancer,
                            groupValue: radioToggleState,
                            onChanged: (value) {
                              context.read<RadioButtonToggleBloc>().add(value as RadioOptions);
                            },
                          ),
                          const Text('Dancer'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: RadioOptions.Athletic,
                            groupValue: radioToggleState,
                            onChanged: (value) {
                              context.read<RadioButtonToggleBloc>().add(value as RadioOptions);
                            },
                          ),
                          const Text('Athletic'),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            //showing selected radio tile using bloc builder
            BlocBuilder<RadioButtonToggleBloc, RadioOptions>(
              builder: (context, radioToggleState) {
                var toggleValue = "Singer";
                if (radioToggleState == RadioOptions.Singer) {
                  toggleValue = "Singer";
                } else if (radioToggleState == RadioOptions.Dancer) {
                  toggleValue = "Dancer";
                } else if (radioToggleState == RadioOptions.Athletic) {
                  toggleValue = "Athletic";
                }
                return Text("Selected Radio Value : $toggleValue");
              },
            ),
            divider,
            // range slider using bloc
            BlocBuilder<RangeSlideBloc, RangeSlideModel>(
              builder: (context, rangeSlideState) {
                return RangeSlider(
                  values: RangeValues(rangeSlideState.start, rangeSlideState.end),
                  max: 100,
                  onChanged: (values) {
                    context.read<RangeSlideBloc>().add(
                          RangeSlideModel(start: values.start, end: values.end),
                        );
                  },
                );
              },
            ),
            //showing the selected range
            BlocBuilder<RangeSlideBloc, RangeSlideModel>(
              builder: (context, rangeSlideState) {
                return Text('Selected Start ${rangeSlideState.start.round()} Range End Range ${rangeSlideState.end.round()}');
              },
            ),
            divider,
            //date selector using bloc
            BlocBuilder<DatePickerBloc, DateTime>(
              builder: (context, datePickerState) {
                final formattedDate = "${datePickerState.year}-${datePickerState.month}- ${datePickerState.day}";

                return Text("Selected Dated : $formattedDate");
              },
            ),
            TextButton.icon(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.dark(),
                      child: child ?? Container(),
                    );
                  },
                );
                BlocProvider.of<DatePickerBloc>(context).add(selectedDate);
              },
              icon: const Icon(Icons.date_range),
              label: const Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}
