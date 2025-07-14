import 'package:flutter/material.dart';
import 'package:flutter_flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flutter_flix_id/presentation/misc/methods.dart';
import 'package:flutter_flix_id/presentation/providers/router/router_provider.dart';
import 'package:flutter_flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_flix_id/presentation/widgets/flix_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    retypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData && next.value != null) {
        ref.read(routerProvider).goNamed('main');
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              verticalSpaces(50),
              Center(child: Image.asset('assets/flix_logo.png', width: 150)),
              verticalSpaces(50),
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.add_a_photo, size: 50, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    verticalSpaces(24),
                    FlixTextField(
                      labelText: 'Email',
                      controller: emailController,
                    ),
                    verticalSpaces(24),
                    FlixTextField(
                      labelText: 'Name',
                      controller: nameController,
                    ),
                    verticalSpaces(24),
                    FlixTextField(
                      labelText: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    verticalSpaces(24),
                    FlixTextField(
                      labelText: 'Retype Password',
                      controller: retypePasswordController,
                      obscureText: true,
                    ),
                    verticalSpaces(24),
                    ref
                        .watch(userDataProvider)
                        .maybeWhen(
                          data: (user) {
                            if (user == null) {
                              return SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    final email = emailController.text.trim();
                                    final name = nameController.text.trim();
                                    final password =
                                        passwordController.text.trim();
                                    final retypePassword =
                                        retypePasswordController.text.trim();

                                    if ([
                                      email,
                                      name,
                                      password,
                                      retypePassword,
                                    ].any((field) => field.isEmpty)) {
                                      context.showSnackBar(
                                        "Semua field harus diisi!",
                                      );
                                      return;
                                    }

                                    if (password != retypePassword) {
                                      context.showSnackBar(
                                        "Password dan konfirmasi harus sama!",
                                      );
                                      return;
                                    }

                                    ref
                                        .read(userDataProvider.notifier)
                                        .register(
                                          email: email,
                                          password: password,
                                          name: name,
                                        );
                                  },
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                          orElse:
                              () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                        ),
                  ],
                ),
              ),
              verticalSpaces(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Álready have an accoun? '),
                  TextButton(
                    onPressed: () {
                      ref.read(routerProvider).goNamed('login');
                    },
                    child: Text(
                      'Login here',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
