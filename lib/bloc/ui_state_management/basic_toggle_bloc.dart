import 'package:flutter_bloc/flutter_bloc.dart';

//can be used in show hide password
class PasswordToggleInFormBloc extends Bloc<bool, bool> {
  PasswordToggleInFormBloc() : super(true);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }
}
