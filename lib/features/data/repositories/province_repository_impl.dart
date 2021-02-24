import 'package:dartz/dartz.dart';
import 'package:flutter_test_get_it_bloc_http/core/error/failures.dart';
import 'package:flutter_test_get_it_bloc_http/features/domain/entities/province.dart';
import 'package:flutter_test_get_it_bloc_http/features/domain/repositories/province_repository.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../datasources/province_remote_datasource.dart';

class ProvinceRepositoryImpl implements ProvinceRepository {
  final ProvinceRemoteDataSource provinceRemoteDataSource;

  ProvinceRepositoryImpl(this.provinceRemoteDataSource);
  @override
  Future<Either<Failure, List<Province>>> getProvince() async {
    try {
      List<Province> response = await provinceRemoteDataSource.getProvince();
      return Right(response);
    } on ServerExcaption catch (e) {
      return Left(ServerFailure(msg: e.message));
    }
  }
}
