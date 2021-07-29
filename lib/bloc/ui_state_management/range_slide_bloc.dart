import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/range_slide_model.dart';

class RangeSlideBloc extends Bloc<RangeSlideModel, RangeSlideModel> {
  RangeSlideBloc() : super(RangeSlideModel(start: 40, end: 80));

  @override
  Stream<RangeSlideModel> mapEventToState(RangeSlideModel event) async* {
    yield event;
  }
}
