import 'package:flutter_bloc/flutter_bloc.dart';

class GetStringFormDataBloc extends Bloc<String, bool> {
  GetStringFormDataBloc() : super(false);

  @override
  Stream<bool> mapEventToState(String? event) async* {
    if (event != null) {
      if (event.isEmpty) {
        yield false;
      } else {
        yield false;
      }
    } else {
      yield true;
    }
  }
}
