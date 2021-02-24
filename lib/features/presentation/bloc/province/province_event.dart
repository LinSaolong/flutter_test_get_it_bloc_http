part of 'province_bloc.dart';

@immutable
abstract class ProvinceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnGetProvince extends ProvinceEvent {
  final List<Province> listPrice;

  OnGetProvince({this.listPrice});
  @override
  List<Object> get props => [];
}

class ResetProvince extends ProvinceEvent {}
