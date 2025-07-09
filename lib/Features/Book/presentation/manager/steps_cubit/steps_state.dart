part of 'steps_cubit.dart';

@immutable
sealed class StepsState {}

final class StepsInitial extends StepsState {}

final class StepsChanged extends StepsState {
  final int index;
  StepsChanged({required this.index});
}

final class StepsDateRangeSelected extends StepsState {
  final DateTimeRange<DateTime> range;
  StepsDateRangeSelected({required this.range});
}
