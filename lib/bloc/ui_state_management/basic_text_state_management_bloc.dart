import 'package:flutter_bloc/flutter_bloc.dart';

//can be used to change content on text
class BasicTextManagementBloc extends Bloc<bool, bool> {
  BasicTextManagementBloc() : super(false);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield true;
  }
}
