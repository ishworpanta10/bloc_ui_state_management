import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLikeToDoBloc extends Bloc<FeedbackModel, FeedbackModel> {
  SelectLikeToDoBloc() : super(FeedbackModel(position: -1));

  @override
  Stream<FeedbackModel> mapEventToState(FeedbackModel event) async* {
    yield event;
  }
}

class FeedbackModel {
  FeedbackModel({this.title, this.iconData, this.position});
  String? title;
  String? iconData;
  int? position;
}
