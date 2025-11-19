import 'package:flutter/material.dart';
import 'package:nectar_app/api/auth_services.dart';
import 'package:nectar_app/screen/signup_screen.dart';
import 'package:nectar_app/model/user_model.dart';
import 'package:nectar_app/screen/welcome_screen.dart';
import 'package:get_storage/get_storage.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthServices _authServices = AuthServices();

  bool _isLoading = false;
  bool _obscurePassword = true;

  Future<void> _signin() async {
    setState(() {
      _isLoading = true;
    });

    //I am creating user model from text field
    final user = UserModel(
      name: '',
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    final success = await _authServices.signin(user);

    setState(() {
      _isLoading = false;
    });
    //I am storing sign in data
    if (success) {
      final box = GetStorage();
      await box.write('isLoggedIn', true);
      await box.write('userEmail', user.email);
    }

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signin Sucessfull')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signin Failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sign_in_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Image(image: AssetImage('assets/images/ic_carrot.png')),
            ),

            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loging',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF181725),
                      fontFamily: 'Gilroy',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enter your emails and password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF7C7C7C),
                      fontFamily: 'Gilroy',
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF7C7C7C),
                      fontFamily: 'Gilroy',
                    ),
                  ),

                  Form(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Email',
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF7C7C7C),
                      fontFamily: 'Gilroy',
                    ),
                  ),

                  Form(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF181725),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Center(
                    child: ElevatedButton(
                      onPressed: _signin,
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(354, 67),
                        backgroundColor: Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(354, 67),
                        backgroundColor: Color(0xFF5383EC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                      ),

                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/ic_google.png'),
                          ),
                          const Padding(
                            padding: EdgeInsetsGeometry.only(right: 40),
                          ),
                          Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Gilroy',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF181725),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          ' Signup',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF53B175),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
