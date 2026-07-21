import 'package:flutter/material.dart';
import 'login_screen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:EdgeInsets.all(24),
          child: Form(
            key: _signupFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

           TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration( 
              labelText: 'FirstName',
              prefixIcon: Icon(Icons.person_2_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (value){
              if(value == null || value.isEmpty) {
                return 'Enter first Name';
              }
              return null;
            }
           ),
           SizedBox(height: 16),

           TextFormField(
            controller: _lastNameController,
            decoration: InputDecoration( 
              labelText: 'lastName',
              prefixIcon: Icon(Icons.person_2_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (value){
              if(value == null || value.isEmpty) {
                return 'Enter last Name';
           
              }
            },
           ),
           
            SizedBox(height: 16),

            TextFormField(
            controller: _emailController,
            decoration: InputDecoration( 
              labelText: 'email',
              prefixIcon: Icon(Icons.person_2_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (value){
              if(value == null || value.isEmpty) {
                return 'Enter email';
              }
               if(!value.contains('@')) {
                 return 'Enter a valid email';
               }
               return null;
               
            },
           ),

           SizedBox(height: 16),
            TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                      setState(() {
                      _hidePassword = !_hidePassword;
                     });
                      },
                    icon: Icon(_hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined))
                   ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Enter your password';
                    }
                    return null;
                  },
                  obscureText: _hidePassword,
                ),

                SizedBox(height: 16),

            TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration( 
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _hideConfirmPassword = !_hideConfirmPassword;
                        });
                      },
                        icon: Icon(_hideConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined))
                   ),
            
                  validator: (value){
                    if(value == null || value.isEmpty) {
                      return 'Confirm Password';
           
                   }
                   return null;
                  },
                  obscureText: _hideConfirmPassword,

            ),
            SizedBox(height: 16),

            
                ElevatedButton(
                  onPressed: (){
                    if(_signupFormKey.currentState!.validate()){
                      //Perform login & navigate to home screen
                    }
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),

                  child: Text("Signup",
                  style:TextStyle(color: Colors.white)),

                
               
                ),
                SizedBox(height: 16),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),

                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                       child: Text("Login"))
                  ],
  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose(){
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}


    

   
