import 'package:flutter_bloc/flutter_bloc.dart';

//can be used in tab bar and we can show widget based on index

class BasicShowHideBasedOnIndexBloc extends Bloc<int, bool> {
  BasicShowHideBasedOnIndexBloc() : super(false);

  @override
  Stream<bool> mapEventToState(int event) async* {
    if (event == 0) {
      yield false;
    } else if (event == 1) {
      yield true;
    }
  }
}
