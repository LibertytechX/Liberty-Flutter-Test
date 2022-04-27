import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class RemoteFailure extends Failure {
  final String message;

  RemoteFailure({required this.message});
}

class LocalFailure extends Failure {
  final String message;

  LocalFailure({required this.message});
}