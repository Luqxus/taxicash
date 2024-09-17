import 'package:equatable/equatable.dart';

class BottomNavBarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigateEvent extends BottomNavBarEvent {
  final int index;

  NavigateEvent(this.index);

  @override
  List<Object?> get props => [index];
}
