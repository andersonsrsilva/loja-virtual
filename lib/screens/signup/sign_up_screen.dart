import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final User user = User();
  late String passwordConfirm = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                    enabled: !userManager.loading,
                    decoration: const InputDecoration(hintText: 'Nome'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (!input.isValidName()) {
                        return 'Nome inválido';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      user.name = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    enabled: !userManager.loading,
                    decoration: const InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (!input.isValidEmail()) {
                        return 'E-mail inválido';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      user.email = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    enabled: !userManager.loading,
                    decoration: const InputDecoration(hintText: 'Senha'),
                    autocorrect: false,
                    obscureText: true,
                    maxLength: 10,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (input.length < 6) {
                        return 'Senha muito curta';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      user.password = value;
                    },
                    onChanged: (value) {
                      passwordConfirm = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    enabled: !userManager.loading,
                    decoration:
                        const InputDecoration(hintText: 'Repita a Senha'),
                    autocorrect: false,
                    obscureText: true,
                    maxLength: 10,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (input != passwordConfirm) {
                        return 'Senhas não conferem';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                    onPressed: userManager.loading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              userManager.signUp(
                                  user: user,
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
