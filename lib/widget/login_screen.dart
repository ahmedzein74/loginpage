import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, 
  required String title
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController=TextEditingController();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
       
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
const Text("LOGIN DESIGN",style: TextStyle(color: Colors.blueGrey,fontSize: 30,fontWeight: FontWeight.bold)),
            const  SizedBox(
                height: 30,
              ),
              
            
               
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  validator: (value) {
                    if (value!.isNotEmpty && value.contains("@")) {
                      return null;
                    } else {
                      return "Email Not Corect";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                controller: passwordController,
                 keyboardType: TextInputType.visiblePassword,
                 obscureText: visible,
                    // onFieldSubmitted: (String value){
                    //   print(value);
                    // },
                    // onChanged: (String value){
                    //   print(value);
                    // },
                   
                  decoration: InputDecoration(labelText: "password",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.visibility_off,),
                   suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          visible = !visible;
                        });
                      },
                          icon: visible
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off)),),
                  
                  validator: (value) {
                    if (value!.length < 8) {
                      return "password Not Corect";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30,),
             

             Container(
                width: 300,
                height: 50,
                color: Colors.blue,
                
                child:MaterialButton(onPressed:()async {
                 
                  if (_formKey.currentState!.validate()) {
                       final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('email', emailController.text);
 

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage(
                                // email: emailController.text, 
                              )),
                    );
                  } 
                },child: const Text('Login') ) 
              ),

          
            ],
          ),
        ),
      ),
    );
  }
  

}

