// ignore_for_file: use_key_in_widget_constructors, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hostelhubaccra/features/home/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SimpleLoginScreen extends StatefulWidget {
  const SimpleLoginScreen({Key? key}) : super(key: key);

  @override
  State<SimpleLoginScreen> createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  late String email, password;
  String? emailError, passwordError;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';
    emailError = null;
    passwordError = null;
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> signIn() async {
    resetErrorText();

    if (!isValidEmail(email)) {
      setState(() {
        emailError = 'Invalid email format';
      });
      showErrorToast('Please enter a valid email address');
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigate to HomeScreen after successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } catch (e) {
      setState(() {
        if (e is FirebaseAuthException) {
          if (e.code == 'user-not-found') {
            emailError = 'No user found for that email.';
            showErrorToast('No user found for that email. Please check your email and try again.');
          } else if (e.code == 'wrong-password') {
            passwordError = 'Wrong password provided for that user.';
            showErrorToast('Wrong password provided. Please check your password and try again.');
          } else {
            // Handle other errors
            print('Error: $e');
            showErrorToast('An error occurred. Please try again later.');
          }
        }
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool isValidEmail(String email) {
    // Email validation regex pattern
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .12),
            const Text(
              'Welcome,',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              'Sign in to continue!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .12),
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: 'Email',
              errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              onSubmitted: (val) => signIn(),
              labelText: 'Password',
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle Forgot Password
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * .075,
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : FormButton(
                    text: 'Log In',
                    onPressed: signIn,
                  ),
            SizedBox(
              height: screenHeight * .15,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SimpleRegisterScreen()),
                );
              },
              child: RichText(
                text: const TextSpan(
                  text: "I'm a new user, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SimpleRegisterScreen extends StatefulWidget {
  final Function(String? email, String? password)? onSubmitted;

  const SimpleRegisterScreen({this.onSubmitted, Key? key}) : super(key: key);

  @override
  State<SimpleRegisterScreen> createState() => _SimpleRegisterScreenState();
}

class _SimpleRegisterScreenState extends State<SimpleRegisterScreen> {
  late String email, password, confirmPassword;
  String? emailError, passwordError;
  Function(String? email, String? password)? get onSubmitted => widget.onSubmitted;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';
    confirmPassword = '';
    emailError = null;
    passwordError = null;
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  bool validate() {
    resetErrorText();

    bool isValid = true;

    if (email.isEmpty) {
      setState(() {
        emailError = 'Email is required';
      });
      showErrorToast('Please enter your email');
      isValid = false;
    } else if (!isValidEmail(email)) {
      setState(() {
        emailError = 'Invalid email format';
      });
      showErrorToast('Please enter a valid email address');
      isValid = false;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = 'Password is required';
      });
      showErrorToast('Please enter a password');
      isValid = false;
    } else if (password.length < 6) {
      setState(() {
        passwordError = 'Password must be at least 6 characters long';
      });
      showErrorToast('Password must be at least 6 characters long');
      isValid = false;
    }

    if (confirmPassword.isEmpty) {
      setState(() {
        passwordError = 'Confirm Password is required';
      });
      showErrorToast('Please confirm your password');
      isValid = false;
    } else if (password != confirmPassword) {
      setState(() {
        passwordError = 'Passwords do not match';
      });
      showErrorToast('Passwords do not match. Please check and try again.');
      isValid = false;
    }

    return isValid;
  }

  bool isValidEmail(String email) {
    // Email validation regex pattern
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  void submit() async {
    if (validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        User? user = userCredential.user;
        print('User registered: ${user!.email}');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );

        setState(() {
          email = '';
          password = '';
          confirmPassword = '';
          emailError = null;
          passwordError = null;
        });
      } catch (error) {
        print('Error registering user: $error');
        if (error is FirebaseAuthException) {
          if (error.code == 'email-already-in-use') {
            showErrorToast('The email is already in use. Please use a different email.');
          } else {
            showErrorToast('An error occurred. Please try again later.');
          }
        }
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .12),
            const Text(
              'Create Account,',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              'Sign up to get started!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .12),
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: 'Email',
              errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              labelText: 'Password',
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
              onSubmitted: (value) => submit(),
              labelText: 'Confirm Password',
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: screenHeight * .075),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : FormButton(
                    text: 'Sign Up',
                    onPressed: submit,
                  ),
            SizedBox(height: screenHeight * .125),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: RichText(
                text: const TextSpan(
                  text: "I'm already a member, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  const FormButton({required this.text, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String? labelText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;
  const InputField({
    this.labelText,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.autoFocus = false,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}