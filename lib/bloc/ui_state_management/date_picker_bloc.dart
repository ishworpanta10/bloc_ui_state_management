import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickerBloc extends Bloc<DateTime?, DateTime> {
  DatePickerBloc() : super(DateTime.now());

  @override
  Stream<DateTime> mapEventToState(DateTime? event) async* {
    if (event != null) {
      yield event;
    }
  }
}
