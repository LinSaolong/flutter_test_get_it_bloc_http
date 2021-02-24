part of 'province_bloc.dart';

@immutable
abstract class ProvinceState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProvinceInitial extends ProvinceState {}

class ProvinceLoading extends ProvinceState {}

class ProvinceLoaded extends ProvinceState {
  final List<Province> listProvince;

  ProvinceLoaded({this.listProvince});
  @override
  List<Object> get props => [listProvince];
}

class ProvinceError extends ProvinceState {
  final Failure failure;

  ProvinceError({@required this.failure});
  @override
  List<Object> get props => [failure];
}
