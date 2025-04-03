import 'package:caffeine_dashboard/featuers/users/data/repo/ban_repo/ban_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BanRepoImpl implements BanRepo {
  @override
  Future<Either<String, bool>> isUserBanned(String userId) async {
    try {
      DocumentSnapshot banDoc =
          await FirebaseFirestore.instance
              .collection('banned_users')
              .doc(userId)
              .get();
      return Right(banDoc.exists);
    } catch (e) {
      return Left("Failed to check ban status: $e");
    }
  }
}
