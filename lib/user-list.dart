import 'package:flutter/material.dart';
import 'package:swagit/make-responsive.dart';
import 'package:swagit/models/user.dart';
import 'package:swagit/search.dart';
import 'package:swagit/services/firebase-service.dart';


class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {

  FirebaseService _firebaseService = FirebaseService();
  List<MyUser> allUsers = [];
  TextEditingController controller = new TextEditingController();
  bool isSearch = false;


  void getAllUsers()async{
    List<MyUser> result = await _firebaseService.getUsers();
    setState(() {
      allUsers = result;
    });
  }

  @override
  initState(){
    super.initState();
    getAllUsers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xffe4dbfc)
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
              children: [
                SizedBox(height: 100),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(35.0, 20.0, 20.0, 20.0),
                        child: Text(
                          'Accounts',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 70.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search(allUsers)),
                        );
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.black38,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffebe9fd),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: allUsers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          allUsers[index].Name,
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Color(0xffE90F0F11)
                          ),
                        ),
                        leading: Container(
                          margin: EdgeInsets.all(0.0),
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(allUsers[index].profile)),
                          ),
                        ),
                        subtitle: Text(
                            '${allUsers[index].follower} Followers'
                        ),
                      );
                    },
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
