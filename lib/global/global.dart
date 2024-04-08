import 'dart:async';

import 'package:driver/models/driver_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:driver/models/direction_detail_info.dart';
import 'package:geolocator/geolocator.dart';

import '../models/user_models.dart';

FirebaseAuth firebaseAuth=FirebaseAuth.instance;
User? currentUser;
UserModel? userModelCurrentInfo;

Position? driverCurrentPosition;
String apiKey="AIzaSyDvDTif2c7C7KrltE0s4JvQ0RmEw0DG5ZU";
DriverData onlineDriverData= DriverData();
String? driverVehicleType ="";

StreamSubscription<Position>? streamSubscriptionPosition;
StreamSubscription<Position>? streamSubscriptionDriverLivePosition;


