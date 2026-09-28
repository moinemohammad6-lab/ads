import 'package:flutter/material.dart';
import 'package:flutter_application_2/colors.dart';
import 'package:flutter_application_2/ui/shared_widgets/app_buton.dart';
import 'package:flutter_application_2/ui/shared_widgets/app_text_field.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
   late TextEditingController  _nameController;
  late GlobalKey<FormState> _formkey;
         late TextEditingController _emailController;
    late TextEditingController _passwordController;
      late TextEditingController _validatPasswordController;



   void initState(){
    _formkey=GlobalKey<FormState>();
     _nameController = TextEditingController();
      _emailController = TextEditingController();
          _passwordController = TextEditingController();
              _validatPasswordController = TextEditingController();




    super.initState();
   }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double w(double val) => width * (val / 390);
    double h(double val) => height * (val / 844);

    return Directionality(
      textDirection: TextDirection.rtl ,
      child: Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(18),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  
                  Image.asset('assets/images/logo.png',
                width: w(86),
                height: h(86),),

                   SizedBox(height: h(19),),                 
                 Text(
                      'أنشاء حساب',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: h(5)),
                    Text(
                      'أدخل المعلومات المطلوبة أدناه',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                SizedBox(height: h(51)),
                  AppTextField(hintText: 'الاسم الكامل', controller: _nameController,
                  prefixIcon: Icon(Icons.person),),
                                       SizedBox(height: h(31)),
                  AppTextField(hintText: 'البريد الالكتروني', controller:  _emailController,
                  prefixIcon: Icon(Icons.email_outlined),
                  ),
                                       SizedBox(height: h(31)),
                AppTextField(hintText: 'كلمة المرور', controller: _passwordController,
                prefixIcon:Icon(Icons.lock_open_outlined) ,
                suffixIcon: Icon(Icons.remove_red_eye),),
                                       SizedBox(height: h(31)),
                AppTextField(hintText: 'تاكيد كلمة المرور ', controller: _validatPasswordController,
                prefixIcon: Icon(Icons.lock_open_outlined),
                ),
                                       SizedBox(height: h(31)),
                                
                AppButon(text: 'انشاء حساب ', onPressed: () {},
                      backgroundColor: AppColors.primaryColor,

                height:  h(40),   ) ,      
                                       SizedBox(height: h(40)),
                  
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('بالمتابعة انت توافق على '),
                    Text('الشروط و الاحكام ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text('و'),
                        Text('سياسية الخصوصية ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        
                  ],

                 )


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