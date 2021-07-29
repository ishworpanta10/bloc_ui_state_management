import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/select_button_and_take_data_bloc_model.dart';

class SelectButtonAndTakeTextDataCubit extends Cubit<SelectButtonAndTakeDataBlocModel> {
  SelectButtonAndTakeTextDataCubit() : super(SelectButtonAndTakeDataBlocModel(textData: "", position: -1));

  void getData(SelectButtonAndTakeDataBlocModel data) {
    emit(data);
  }
}
