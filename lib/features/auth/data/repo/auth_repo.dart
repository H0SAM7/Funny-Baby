abstract class AuthRepo {
  // Future<Either<Failure,Success>>
  Future<void> registerWithEmailAndPassword(
      {required String email, required String password});
  Future<void> loginWithEmailAndPassword(
      {required String email, required String password});
  Future<void> forgetPassword({
    required String email,
  }); 
}