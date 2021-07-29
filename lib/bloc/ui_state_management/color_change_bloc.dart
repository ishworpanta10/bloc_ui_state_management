import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/homepage.dart';

class ColorChangeBloc extends Bloc<ColorModel, ColorModel> {
  ColorChangeBloc() : super(ColorModel(color: Colors.black, index: 0));

  @override
  Stream<ColorModel> mapEventToState(ColorModel event) async* {
    if (event.index < HomePage.colorList.length) {
      yield ColorModel(color: HomePage.colorList[event.index], index: event.index);
    } else {
      yield ColorModel(color: Colors.black, index: 0);
    }
  }
}

class ColorModel {
  ColorModel({this.color, required this.index});

  final Color? color;
  final int index;
}
