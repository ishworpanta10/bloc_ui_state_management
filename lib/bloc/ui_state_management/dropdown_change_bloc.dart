import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/homepage.dart';

//can be used in show hide password
class DropdownChangeBloc extends Bloc<String, String> {
  DropdownChangeBloc() : super(HomePage.dropDownItemsList[0]);

  @override
  Stream<String> mapEventToState(String event) async* {
    yield event;
  }
}
