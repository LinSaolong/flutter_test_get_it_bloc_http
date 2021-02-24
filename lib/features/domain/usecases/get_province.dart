import 'package:flutter_test_get_it_bloc_http/core/error/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test_get_it_bloc_http/features/domain/repositories/province_repository.dart';

import '../../../core/usecase/usecase.dart';
import '../entities/province.dart';

class GetProvince implements UseCase<List<Province>, NoParams> {
  final ProvinceRepository provinceRepository;

  GetProvince(this.provinceRepository);
  @override
  Future<Either<Failure, List<Province>>> call(NoParams params) async {
    return await provinceRepository.getProvince();
  }
}
