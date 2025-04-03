import 'package:dartz/dartz.dart';

abstract class BanRepo {
  Future<Either<String, bool>> isUserBanned(String userId);
}
