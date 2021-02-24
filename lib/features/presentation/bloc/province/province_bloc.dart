import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'province_event.dart';
part 'province_state.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  ProvinceBloc() : super(ProvinceInitial());

  @override
  Stream<ProvinceState> mapEventToState(
    ProvinceEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
