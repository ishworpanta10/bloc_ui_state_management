import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeFormDecorationAfterUserInputCubit extends Cubit<FormDecorationChangeForCubitModel> {
  ChangeFormDecorationAfterUserInputCubit() : super(FormDecorationChangeForCubitModel(isTyped: false, text: ""));

  void isTextFieldTyped(FormDecorationChangeForCubitModel formDecorationChangeForCubitModel) {
    emit(FormDecorationChangeForCubitModel(isTyped: formDecorationChangeForCubitModel.isTyped, text: formDecorationChangeForCubitModel.text));
  }
}

class FormDecorationChangeForCubitModel {
  FormDecorationChangeForCubitModel({this.text, required this.isTyped});

  final String? text;
  final bool isTyped;
}
