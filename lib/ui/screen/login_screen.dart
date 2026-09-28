import 'package:flutter/material.dart';
import 'package:flutter_application_2/colors.dart';
import 'package:flutter_application_2/ui/shared_widgets/app_buton.dart';
import 'package:flutter_application_2/ui/shared_widgets/app_text_field.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late RegExp _emailReq;
  bool isloading = false;
  //String? _emailError;
  //String? _passwordError;
  late GlobalKey<FormState> _formkey;
  bool showPassword=false;
  void initState() {
    _formkey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailReq = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(18),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(width: 60,),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 86,
                      height: 86,
                    ),

                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    SizedBox(height: 11),

                     Text(
                      'ادخل بريدك الالكتروني',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),

                    

                    SizedBox(height: 51),

                    AppTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      // errorText: _emailError ,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Email is Required';
                        }
                        if (value != null && !_emailReq.hasMatch(value)) {
                          return 'Email not valid';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 31),

                    AppTextField(
                      hintText: 'passward',
                      controller: _passwordController,
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Password is Required';
                        }
                        return null;
                      },
                      // errorText: _passwordError,
                    ),

                    SizedBox(height: 18),

                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'نسيت كلمة المرور',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),

                    SizedBox(height: 18),
                    if (!isloading) 
                    AppButon(

                      text: ' تسجيل الدخول',
                      onPressed: () {
                          if (_formkey.currentState != null &&
                              !_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Check Your Entry')),
                            );
                          } else {
                            //? isloading => send request to server
                            setState(() {
                              isloading = true;
                            });

                            Future.delayed(Duration(seconds: 5)).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('USer not exisit')),
                              );
                              setState(() {
                                isloading = false;
                              });
                            });
                          }
                        },
      backgroundColor: AppColors.primaryColor,
                    )
                    else
                    CircularProgressIndicator(),
                    SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Container(color: Colors.grey, height: 1, )),
                        Text('أو المتابعة مع'),
                        Expanded(child: Container(color: Colors.grey, height: 1, )),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              
                              height: 45,
                          
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                spacing: 10,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Apple'),
                                  Image.asset('assets/images/apple.png',
                                  width: 20, height: 20,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 18),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              
                              height: 45,
                          
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                          
                              child: Row(
                                spacing: 10,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Google'),
                                  Image.asset('assets/images/google.png', width: 20, height: 20,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ليس لديك حساب ؟ '),
                        Text(
                          'إنشاء حساب',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
