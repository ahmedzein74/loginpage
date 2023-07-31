import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  // final String email;
  
  const HomePage({super.key, 
  //  required this.email,
    });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = "";

  Future<void> getCachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? "--";
    setState(() {});
  }
  @override
   void initState() {
    super.initState();
    getCachedEmail();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WELCOM',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Text("Welcome \n$email"),
      ),
    );
  }
}
