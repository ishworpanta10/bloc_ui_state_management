import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeFormDecorationAfterUserInputCubit extends Cubit<String> {
  ChangeFormDecorationAfterUserInputCubit() : super("");

  void getData(String data) {
    emit(data);
  }
}
