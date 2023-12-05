import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';

class LoginScreem extends StatelessWidget {
  LoginScreem({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Entrar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: emailController,
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
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  maxLength: 10,
                  validator: (input) =>
                      input!.isValidPassword() ? null : 'Senha inválido',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                    ),
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
