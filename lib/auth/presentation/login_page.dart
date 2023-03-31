import 'package:flutter/material.dart';
import 'package:swarm_rover_system_staff/auth/presentation/widgets/auth_title_text.dart';
import 'package:swarm_rover_system_staff/auth/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  children: const [
                    AuthTitleText(
                      topTitle: 'Login to Your',
                      mediumTitle: 'Patrio',
                      bottomTitle: 'Account',
                    ),
                    SizedBox(width: 500, child: LoginForm()),
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
