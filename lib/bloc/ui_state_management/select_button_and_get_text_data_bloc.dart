import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/select_button_and_take_data_bloc_model.dart';

//can be used in show hide password
class SelectButtonAndTakeTextDataBloc extends Bloc<SelectButtonAndTakeDataBlocModel, SelectButtonAndTakeDataBlocModel> {
  SelectButtonAndTakeTextDataBloc() : super(SelectButtonAndTakeDataBlocModel(position: -1, textData: ""));

  @override
  Stream<SelectButtonAndTakeDataBlocModel> mapEventToState(SelectButtonAndTakeDataBlocModel? event) async* {
    if (event != null) {
      yield event;
    } else {
      yield SelectButtonAndTakeDataBlocModel(position: -1, textData: "");
    }
  }
}
