part of 'to_dos_cubit.dart';

@immutable
abstract class ToDosState {}

class ToDosInitial extends ToDosState {}
class ToDosLoading extends ToDosState {}
class ToDosSuccess extends ToDosState {}
class ToDosError extends ToDosState {}



