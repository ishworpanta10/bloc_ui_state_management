import 'package:flutter_bloc/flutter_bloc.dart';

//can be used in show hide password
class SelectButtonBloc extends Bloc<int, int> {
  SelectButtonBloc() : super(-1);

  @override
  Stream<int> mapEventToState(int event) async* {
    yield event;
  }
}
