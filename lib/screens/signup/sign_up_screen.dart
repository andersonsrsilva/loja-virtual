import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user_login.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(builder: (_, userManager, __) {
              return ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    controller: emailController,
                    enabled: !userManager.loading,
                    decoration: const InputDecoration(hintText: 'Nome'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (input) =>
                        input!.isValidEmail() ? null : 'E-mail inválido',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: emailController,
                    enabled: !userManager.loading,
                    decoration: const InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (input) =>
                        input!.isValidEmail() ? null : 'E-mail inválido',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: passController,
                    enabled: !userManager.loading,
                    decoration: const InputDecoration(hintText: 'Senha'),
                    autocorrect: false,
                    obscureText: true,
                    maxLength: 10,
                    validator: (input) =>
                        input!.isValidPassword() ? null : 'Senha inválido',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: passController,
                    enabled: !userManager.loading,
                    decoration:
                        const InputDecoration(hintText: 'Repita a Senha'),
                    autocorrect: false,
                    obscureText: true,
                    maxLength: 10,
                    validator: (input) =>
                        input!.isValidPassword() ? null : 'Senha inválido',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                    onPressed: userManager.loading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              userManager.signIn(
                                  userLogin: UserLogin(
                                      email: emailController.text,
                                      password: passController.text),
                                  onFail: (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('onFail: $e'),
                                      ),
                                    );
                                  },
                                  onSuccess: (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('onSuccess: $e'),
                                      ),
                                    );
                                  });
                            }
                          },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      disabledBackgroundColor:
                          Theme.of(context).primaryColor.withAlpha(100),
                    ),
                    child: userManager.loading
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                            strokeWidth: 2.0,
                          )
                        : const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
