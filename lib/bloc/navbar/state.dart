import 'package:equatable/equatable.dart';

class BottomNavBarState extends Equatable {
  final int index;

  const BottomNavBarState(this.index);

  BottomNavBarState copyWith({required int index}) {
    return BottomNavBarState(index);
  }

  @override
  List<Object?> get props => [index];
}
