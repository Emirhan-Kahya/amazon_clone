import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/common/widgets/custom_textfield_text.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService authService = AuthService();
  Auth _auth = Auth.signup;

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mVariables.greyBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                //seperate line
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 1,
                  color: Colors.black,
                ),
                ListTile(
                  tileColor:
                      _auth == Auth.signup ? mVariables.backgroundColor : null,
                  title: const Text(
                    'Create An Account?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: mVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: mVariables.backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFieldText(text: 'Name'),
                          SizedBox(height: 4),
                          CustomTextField(
                            hintText: 'Name',
                            text: 'Name',
                            controller: _nameController,
                          ),
                          SizedBox(height: 10),
                          CustomTextFieldText(text: 'Email'),
                          SizedBox(height: 4),
                          CustomTextField(
                            hintText: 'example@mail.com',
                            text: 'Email',
                            controller: _emailController,
                          ),
                          SizedBox(height: 10),
                          CustomTextFieldText(text: 'Password'),
                          SizedBox(height: 4),
                          CustomTextField(
                              hintText: '********',
                              text: 'Password',
                              controller: _passwordController),
                          SizedBox(height: 10),
                          CustomButton(
                            text: 'Sign Up',
                            press: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  tileColor:
                      _auth == Auth.signin ? mVariables.backgroundColor : null,
                  title: const Text(
                    'Have An Account Already?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: mVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: mVariables.backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFieldText(text: 'Email'),
                          SizedBox(height: 4),
                          CustomTextField(
                              hintText: 'example@mail.com',
                              controller: _emailController),
                          SizedBox(height: 10),
                          CustomTextFieldText(text: 'Password'),
                          SizedBox(height: 4),
                          CustomTextField(
                              hintText: '********',
                              controller: _passwordController),
                          SizedBox(height: 10),
                          CustomButton(text: 'Sign In', press: () {}),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
