import 'package:flutter_bloc/flutter_bloc.dart';

class GetFormStringDataBloc extends Bloc<String, String> {
  GetFormStringDataBloc() : super("");

  @override
  Stream<String> mapEventToState(String event) async* {
    yield event;
  }
}
