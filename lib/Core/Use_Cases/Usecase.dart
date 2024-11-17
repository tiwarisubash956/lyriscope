import 'package:dartz/dartz.dart';

import '../app_export.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class Noparams {}
