import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

typedef EitherMap = Future<Either<String, Map<String, dynamic>>>;

typedef EitherUser = Future<Either<String, User?>>;

typedef EitherBool = Future<Either<String, bool?>>;

typedef EitherAuthResponse = Future<Either<String, AuthResponse>>;
