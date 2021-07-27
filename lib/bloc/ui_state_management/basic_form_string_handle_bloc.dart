import 'package:flutter_bloc/flutter_bloc.dart';

//event => we fire some button or load something that create event
//state => that event leads to change some state . e.g change in ui
//HERE
// Bloc<Event,State>

class BasicFormStringHandleBloc extends Bloc<String, String?> {
  //this is initial state inside super(initialState)
  BasicFormStringHandleBloc() : super(null);

  @override
  Stream<String?> mapEventToState(String? event) async* {
    if (event != null) {
      if (event.isEmpty) {
        yield "";
      } else {
        yield event;
      }
    } else {
      yield "";
    }
  }
}
