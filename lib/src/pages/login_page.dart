
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/src/cubit/authentication/authentication_cubit.dart';
import 'package:untitled1/src/widgets/app_textform_field.dart';

import '../constants/app_strings.dart';
import '../helpers/common_action.dart';
import '../theme/app_text_theme.dart';
import '../widgets/app_button.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.login,
            style: AppTextTheme.h6Style,
          ),
        ),
        body: SafeArea(
          child: Form(
            child: Column(
              children: [
                AppTextFormField(
                  labelText: 'Email',
                  controller: _emailController,
                ),
                AppTextFormField(
                  labelText: 'Password',
                  controller: _passwordController,
                  isPasswordField: true,
                ),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    if (state is AuthenticationSuccess) {
                      // Navigate to home page
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return HomePage();
                      }));
                    } else if (state is AuthenticationFailure) {
                      CommonAction.showToast("Invalid credentials");
                    }else{
                      // Do nothing for other states
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthenticationLoading) {
                      return const CircularProgressIndicator();
                    }
                    return AppButton(
                        title: AppStrings.login,
                        onTap: () {
                          context.read<AuthenticationCubit>().login(
                              _emailController.text, _passwordController.text);
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
