import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_staff/auth/application/application.dart';
import 'package:swarm_rover_system_staff/auth/presentation/widgets/auth_title_text.dart';
import 'package:swarm_rover_system_staff/auth/presentation/widgets/create_account_form.dart';
import 'package:swarm_rover_system_staff/core/core.dart';

class CreateAccountPage extends ConsumerWidget {
  const CreateAccountPage({super.key});

  Future<void> onCreateAccount(WidgetRef ref) async {
    final authFormState = ref.read(authFormControllerProvider);

    if (authFormState.username.isValid() && authFormState.password.isValid()) {
      await ref
          .read(authControllerProvider.notifier)
          .createAccountUsingEmailAndPassword(
            username: authFormState.username,
            password: authFormState.password,
          );
      if (ref.read(
            authControllerProvider.select((value) => value.successOrFailure),
          ) ==
          right<InfrastructureFailure, Unit>(unit)) {
        ref.read(authFormControllerProvider.notifier).reset();
      }
    } else {
      ref.read(authFormControllerProvider.notifier).onSubmit();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const AuthTitleText(
                      topTitle: 'Welcome to',
                      mediumTitle: 'Patrio',
                      bottomTitle: 'App',
                    ),
                    SizedBox(
                      width: 500,
                      child: CreateAccountForm(
                        onSubmit: () => onCreateAccount(ref),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
