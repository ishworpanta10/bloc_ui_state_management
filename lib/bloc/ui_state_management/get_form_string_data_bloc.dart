import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeFormDecorationAfterUserInputBloc extends Bloc<String, bool> {
  ChangeFormDecorationAfterUserInputBloc() : super(false);

  @override
  Stream<bool> mapEventToState(String? event) async* {
    if (event != null) {
      if (event.isEmpty) {
        yield false;
      } else {
        yield true;
      }
    } else {
      yield false;
    }
  }
}
