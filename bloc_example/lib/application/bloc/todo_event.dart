import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {}

class GetTodoEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}