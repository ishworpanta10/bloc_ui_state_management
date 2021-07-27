import 'package:flutter_bloc/flutter_bloc.dart';

//can be used in show hide password
class BasicToggleBloc extends Bloc<bool, bool> {
  BasicToggleBloc() : super(false);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }
}
