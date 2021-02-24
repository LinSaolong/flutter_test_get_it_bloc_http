import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_get_it_bloc_http/features/domain/usecases/get_province.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../domain/entities/province.dart';

part 'province_event.dart';
part 'province_state.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final GetProvince getProvince;
  ProvinceBloc({this.getProvince}) : super(ProvinceInitial());

  @override
  Stream<ProvinceState> mapEventToState(
    ProvinceEvent event,
  ) async* {
    if (event is OnGetProvince) {
      yield ProvinceLoading();
      var failOrTest = await getProvince(NoParams());
      yield failOrTest.fold((failure) => ProvinceError(failure: failure),
          (listProvince) => ProvinceLoaded(listProvince: listProvince));
    }
  }
}
