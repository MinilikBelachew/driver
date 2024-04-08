import "package:driver/splash/splash_screen.dart";
import "package:firebase_database/firebase_database.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:fluttertoast/fluttertoast.dart";

import "../global/global.dart";
import "forgot_password.dart";
import "login_screen.dart";

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  final _formkey = GlobalKey<FormState>();

  final carModelTextEditController = TextEditingController();
  final carNumberTextEditController = TextEditingController();
  final carColorTextEditController = TextEditingController();
  List<String> carTypes = ["car", "CNG", "BIKE"];
  String? selectedCarType;


_submit(){
  if(_formkey.currentState!.validate()) {
    Map driverCarInfoMap = {
      "car_model" : carModelTextEditController.text.trim(),
      "car_number" : carNumberTextEditController.text.trim(),
      "CAr_Color": carColorTextEditController.text.trim(),
    };
    DatabaseReference userRef=FirebaseDatabase.instance.ref().child("driver");
    userRef.child(currentUser!.uid).child('car_details').set(driverCarInfoMap);

    Fluttertoast.showToast(msg: 'Car Details has been saved .');
    Navigator.push(context, MaterialPageRoute(builder: (c) => SplashScreen()));
  }
}



  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Column(
              children: [
                Image.asset(darkTheme ? 'images/day.jpg' : 'images/night.png'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Add Car Details",
                  style: TextStyle(
                      color:
                          darkTheme ? Colors.lightBlueAccent : Colors.blueGrey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(60)
                                ],
                                decoration: InputDecoration(
                                  hintText: "Car model",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: darkTheme
                                      ? Colors.black45
                                      : Colors.grey.shade300,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none)),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color:
                                        darkTheme ? Colors.black : Colors.grey,
                                  ),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Name can't be empty";
                                  }
                                  if (text.length < 2) {
                                    return "please enter a valid name";
                                  }
                                  if (text.length > 50) {
                                    return "Name can't be more than 40 characters";
                                  }
                                  return null;
                                },
                                onChanged: (text) {
                                  setState(() {
                                    carModelTextEditController.text = text;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(60)
                                ],
                                decoration: InputDecoration(
                                  hintText: "Car Number",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: darkTheme
                                      ? Colors.black45
                                      : Colors.grey.shade300,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none)),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color:
                                        darkTheme ? Colors.black : Colors.grey,
                                  ),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Name can't be empty";
                                  }
                                  if (text.length < 2) {
                                    return "please enter a valid name";
                                  }
                                  if (text.length > 50) {
                                    return "Name can't be more than 40 characters";
                                  }
                                  return null;
                                },
                                onChanged: (text) {
                                  setState(() {
                                    carModelTextEditController.text = text;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(60)
                                ],
                                decoration: InputDecoration(
                                  hintText: "Car Color",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: darkTheme
                                      ? Colors.black45
                                      : Colors.grey.shade300,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none)),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color:
                                        darkTheme ? Colors.black : Colors.grey,
                                  ),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Name can't be empty";
                                  }
                                  if (text.length < 2) {
                                    return "please enter a valid name";
                                  }
                                  if (text.length > 50) {
                                    return "Name can't be more than 40 characters";
                                  }
                                  return null;
                                },
                                onChanged: (text) {
                                  setState(() {
                                    carModelTextEditController.text = text;
                                  });
                                },
                              ),
                      SizedBox(height: 20,),

                      DropdownButtonFormField(

                        decoration: InputDecoration(
                           hintText: 'Please choose car type',
                          prefixIcon: Icon(Icons.car_repair,color: darkTheme? Colors.white: Colors.black,),
                          filled: true,
                          fillColor: darkTheme? Colors.black45 : Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none
                            )
                          )
                        ),
                          items: carTypes.map((car) {
                            return DropdownMenuItem(
                                child: Text(car,style: TextStyle(color: Colors.grey),
                                ),
                              value: car,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCarType=newValue.toString();
                            });
                          }),

                              SizedBox(height: 20,),

                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: darkTheme
                                          ? Colors.black87
                                          : Colors.white,
                                      backgroundColor: darkTheme
                                          ? Colors.lightBlueAccent
                                          : Colors.lightBlueAccent.shade700,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      minimumSize:
                                          const Size(double.infinity, 50)),
                                  onPressed: () {
                                    setState(() {
                                        _submit();
                                    });
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (contex) =>
                                              const ForgotPasswordScreen()));
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: darkTheme
                                          ? Colors.blue
                                          : Colors.lightBlue),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Have An Account?",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (contex) =>
                                                  const LoginScreen()));
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: darkTheme
                                              ? Colors.lightBlue
                                              : Colors.lightBlue),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
