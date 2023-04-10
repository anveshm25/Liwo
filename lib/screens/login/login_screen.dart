import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liwo_mobile/config/routes/app_route_constants.dart';
import 'package:liwo_mobile/screens/login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginController loginState;

  @override
  void initState() {
    super.initState();
    loginState = context.read<LoginController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: loginState.loginInputModel.emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: loginState.loginInputModel.passwordConroller,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  loginState.login(callback: (bool success) {
                    if (success) {
                      context.pushReplacementNamed(
                          AppRouteConstants.productListingRouteName);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50.0),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextButton(
                    onPressed: () => GoRouter.of(context)
                        .pushNamed(AppRouteConstants.signUp),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    loginState.loginInputModel.dispose();
  }
}
