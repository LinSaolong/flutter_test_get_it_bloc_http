import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String msg;

  ServerFailure({this.msg});
}

class CacheFailure extends Failure {
  final String msg;

  CacheFailure({this.msg});
}
