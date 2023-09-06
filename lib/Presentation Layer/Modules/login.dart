
import 'package:flutter/material.dart';
import 'package:flutter_application/Business%20Logic%20Layer/Characters/bloc/characters_bloc.dart';
import 'package:flutter_application/Helpers/Route/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userID = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState>  formstate=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocListener<CharactersBloc,CharactersState>(
        listener: (context, state) {
          if(state is CharactersLoaded){
            Navigator.pushNamed(context,layoutScreen);
          }
        },
        child:Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/background.jpg"),
                          fit: BoxFit.fill)),
                  child:Form(
                    key: formstate,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            validator: (String? value){
                              if(value!.isEmpty){
                                return 'please enter userID';
                              }else{
                                return null;
                              }
                            },
                            controller: userID,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              userID.text = value;
                            },
                            onFieldSubmitted: (value) {
                              userID.text = value;
                            },
                            style: TextStyle(color: Colors.black, fontSize: 13),
                            decoration: InputDecoration(
                              hintText: "Enter Your ID",
                              hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.white, width: 1)),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          TextFormField(
                            validator: (String? value){
                              if(value!.isEmpty){
                                return 'please enter password';
                              }else{
                                return null;
                              }
                            },
                            controller: password,
                            obscureText: true,
                            onChanged: (value) {
                              password.text = value;
                            },
                            onFieldSubmitted: (value) {
                              password.text = value;
                            },
                            style: TextStyle(color: Colors.black, fontSize: 13),
                            decoration: InputDecoration(
                              hintText: "Enter Your Password",
                              hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          ElevatedButton(onPressed: () {
                          if(formstate.currentState!.validate()){
                            BlocProvider.of<CharactersBloc>(context).add(LoginEvent());
                          }else{
                            showDialog(context: context, builder:(context){
                              return AlertDialog(title: Text('Please sure from data'),);
                            });
                          }
                          }, child: Text("Login"))
                        ],
                      ),
                    ),
                  ),
                ),
      )
    );
  }
}
