import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swagit/models/user.dart';

class FirebaseService{

  final firestoreInstance = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

 Future<List<MyUser>> getUsers() async{

   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').get();
   List<MyUser> allUser = List.generate(querySnapshot.docs.length, (i) {
     return MyUser(
         Name: querySnapshot.docs[i]['Name'],
         follower: querySnapshot.docs[i]['follower'],
         profile: querySnapshot.docs[i]['profile']
     );

   });
     return allUser;
  }


}