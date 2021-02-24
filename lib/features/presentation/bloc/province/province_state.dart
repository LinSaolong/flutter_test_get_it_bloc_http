part of 'province_bloc.dart';

@immutable
abstract class ProvinceState {}

class ProvinceInitial extends ProvinceState {}

class ProvinceLoading extends ProvinceState {}

class ProvinceLoaded extends ProvinceState {}
