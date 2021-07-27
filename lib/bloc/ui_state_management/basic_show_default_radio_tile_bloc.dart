import 'package:flutter_bloc/flutter_bloc.dart';

//can be used to default option in radio tile or checkbox
//can be use to compare for bool value like selectedIndex == index
//where selectedIndex come from bloc builder and index come from list.generate .....
// and we can add event as .add(index) on onTap event
class BasicShowDefaultRadioTile extends Bloc<int, int> {
  BasicShowDefaultRadioTile() : super(1);

  @override
  Stream<int> mapEventToState(int event) async* {
    yield event;
  }
}
