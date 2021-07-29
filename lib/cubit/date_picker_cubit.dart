import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickerCubit extends Cubit<DateTime> {
  DatePickerCubit() : super(DateTime.now());

  void pickedDate(DateTime? dateTime) {
    if (dateTime != null) {
      emit(dateTime);
    }
  }

  void pickDateForTomorrow(DateTime? dateTime) {
    if (dateTime != null) {
      final tomorrow = dateTime.add(const Duration(days: 1));
      emit(tomorrow);
    }
  }
}
