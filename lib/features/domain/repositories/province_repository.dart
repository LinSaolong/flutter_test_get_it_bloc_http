import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/province.dart';

abstract class ProvinceRepository {
  Future<Either<Failure, List<Province>>> getProvince();
}
