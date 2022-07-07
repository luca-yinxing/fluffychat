import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:fluffychat/widgets/layouts/login_scaffold.dart';
import 'signup.dart';

class SignupPageView extends StatelessWidget {
  final SignupPageController controller;
  const SignupPageView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !controller.loading,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: Text(
          L10n.of(context)!.signUp,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                readOnly: controller.loading,
                autocorrect: false,
                onChanged: controller.onPasswordType,
                autofillHints:
                    controller.loading ? null : [AutofillHints.newPassword],
                controller: controller.passwordController,
                obscureText: !controller.showPassword,
                validator: controller.password1TextFieldValidator,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.vpn_key_outlined),
                  suffixIcon: IconButton(
                    tooltip: L10n.of(context)!.showPassword,
                    icon: Icon(
                      controller.showPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black,
                    ),
                    onPressed: controller.toggleShowPassword,
                  ),
                  errorStyle: const TextStyle(color: Colors.orange),
                  hintText: L10n.of(context)!.chooseAStrongPassword,
                  fillColor: Theme.of(context)
                      .colorScheme
                      .background
                      .withOpacity(0.75),
                ),
              ),
            ),
            if (controller.displaySecondPasswordField)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  readOnly: controller.loading,
                  autocorrect: false,
                  autofillHints:
                      controller.loading ? null : [AutofillHints.newPassword],
                  controller: controller.password2Controller,
                  obscureText: !controller.showPassword,
                  validator: controller.password2TextFieldValidator,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.repeat_outlined),
                    hintText: L10n.of(context)!.repeatPassword,
                    errorStyle: const TextStyle(color: Colors.orange),
                    fillColor: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.75),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                readOnly: controller.loading,
                autocorrect: false,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints:
                    controller.loading ? null : [AutofillHints.username],
                validator: controller.emailTextFieldValidator,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail_outlined),
                  hintText: L10n.of(context)!.enterAnEmailAddress,
                  errorText: controller.error,
                  fillColor: Theme.of(context)
                      .colorScheme
                      .background
                      .withOpacity(0.75),
                  errorStyle: TextStyle(
                    color: controller.emailController.text.isEmpty
                        ? Colors.orangeAccent
                        : Colors.orange,
                  ),
                ),
              ),
            ),
            Hero(
              tag: 'loginButton',
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: controller.loading ? () {} : controller.signup,
                  child: controller.loading
                      ? const LinearProgressIndicator()
                      : Text(L10n.of(context)!.signUp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
