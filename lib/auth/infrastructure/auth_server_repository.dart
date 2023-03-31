import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_staff/api/api.dart';
import 'package:swarm_rover_system_staff/auth/domain/domain.dart';
import 'package:swarm_rover_system_staff/core/core.dart';

abstract class BaseAuthServerRepository {
  /// Returns UserApiResponse if the response status code from the server is 200
  /// else returns InfrastructureFailure such as
  /// - invalidData
  /// - userAlreadyExists
  /// - serverError
  Future<Either<InfrastructureFailure, UserApiResponse>>
      createAccountUsingEmailAndPassword({
    required Username username,
    required Password password,
  });

  /// Returns UserApiResponse if the response status code from the server is 200
  /// else returns InfrastructureFailure such as
  /// - invalidData
  /// - invalidCredentials
  /// - serverError
  Future<Either<InfrastructureFailure, UserApiResponse>>
      loginUsingEmailAndPassword({
    required Username username,
    required Password password,
  });
}

final authServerRepositoryProvider = Provider<AuthServerRepository>(
  (ref) {
    final dio = ref.watch(dioClientProvider);
    final authApiClient = AuthApiClient(dio, baseUrl: dotenv.env['PROD_URL']!);

    return AuthServerRepository(authApiClient);
  },
);

class AuthServerRepository implements BaseAuthServerRepository {
  AuthServerRepository(this.authApiClient);

  final AuthApiClient authApiClient;

  @override
  Future<Either<InfrastructureFailure, UserApiResponse>>
      createAccountUsingEmailAndPassword({
    required Username username,
    required Password password,
  }) async {
    final usernameStr = username.value;
    final passwordStr = password.value;

    // Checks if all the fields are valid or not. If any one field is invalid
    // then it returns an InfrastructureFailure.
    if (!username.isValid() || !password.isValid()) {
      return left(const CoreInfrastructureFailure.invalidData());
    } else {
      final createAccountInput = CreateAccountInput(
        hotelName: usernameStr,
        password: passwordStr,
      );

      try {
        // Sends a request to the server for creating a new user.
        final createAccountResponse =
            await authApiClient.createAccount(createAccountInput);

        // If the response status code is 200 then it returns the
        // AuthResponseApi.
        return right(createAccountResponse);
      } on DioError catch (error) {
        // If there is any error the it returns an InfrastructureFailure.
        final response = error.response;

        if (response != null) {
          try {
            final userApiResponse =
                UserApiResponse.fromJson(response.data as Map<String, dynamic>);

            switch (userApiResponse.error) {
              case ServerFailures.invalidData:
                return left(const CoreInfrastructureFailure.invalidData());
              case ServerFailures.userAlreadyExists:
                return left(
                  const AuthInfrastructureFailure.userAlreadyExists(),
                );
            }
          } catch (_) {}
        }

        return left(const CoreInfrastructureFailure.serverError());
      }
    }
  }

  @override
  Future<Either<InfrastructureFailure, UserApiResponse>>
      loginUsingEmailAndPassword({
    required Username username,
    required Password password,
  }) async {
    final usernameStr = username.value;
    final passwordStr = password.value;

    // Checks if all the fields are valid or not. If any one field is invalid
    // then it returns an InfrastructureFailure.
    if (!username.isValid() || !password.isValid()) {
      return left(const CoreInfrastructureFailure.invalidData());
    } else {
      final loginInput = LoginInput(
        hotelName: usernameStr,
        password: passwordStr,
      );

      try {
        // Sends a request to the server for logging in the user.
        final loginUserResponse = await authApiClient.loginUser(loginInput);

        // If the response status code is 200 then it returns the
        // AuthResponseApi.
        return right(loginUserResponse);
      } on DioError catch (error) {
        // If there is any error the it returns an InfrastructureFailure.
        final response = error.response;

        if (response != null) {
          try {
            final userApiResponse =
                UserApiResponse.fromJson(response.data as Map<String, dynamic>);

            switch (userApiResponse.error) {
              case ServerFailures.invalidData:
                return left(const CoreInfrastructureFailure.invalidData());
              case ServerFailures.invalidCredentials:
                return left(
                  const AuthInfrastructureFailure.invalidCredentials(),
                );
            }
          } catch (_) {}
        }

        return left(const CoreInfrastructureFailure.serverError());
      }
    }
  }
}
