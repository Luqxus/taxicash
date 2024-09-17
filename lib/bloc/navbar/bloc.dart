import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxicash/bloc/navbar/event.dart';
import 'package:taxicash/bloc/navbar/state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(const BottomNavBarState(0)) {
    on<NavigateEvent>(_navigate);
  }

  _navigate(NavigateEvent event, Emitter emit) {
    // emit state with index from triggered event
    emit(state.copyWith(index: event.index));
  }
}
