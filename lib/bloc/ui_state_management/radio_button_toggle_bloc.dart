import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/homepage.dart';

class RadioButtonToggleBloc extends Bloc<RadioOptions, RadioOptions> {
  RadioButtonToggleBloc() : super(RadioOptions.Singer);

  @override
  Stream<RadioOptions> mapEventToState(RadioOptions event)async* {
    yield event;
  }
}
