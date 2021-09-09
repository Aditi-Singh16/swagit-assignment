import 'package:flutter/material.dart';
import 'package:swagit/models/user.dart';


class Search extends StatefulWidget {
  final List<MyUser> allUsers;
  Search(this.allUsers);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController controller = new TextEditingController();
  bool isSearch = false;
  List<MyUser> searchResult = [];

  void _searchResult(String text){
    List<MyUser> searchUsers = [];
    if(text.length>0){
      setState(() {
        isSearch = !isSearch;
      });
      for(int i =0 ; i < widget.allUsers.length; i++){
        if(widget.allUsers[i].Name.contains(new RegExp(text, caseSensitive: false))){
          searchUsers.add(widget.allUsers[i]);
        }
      }
      setState(() {
        searchResult = searchUsers ;
      });
      //print(searchResult[0].Name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4dbfc),
      appBar: AppBar(
        title: Text('Search Users'),
        backgroundColor: Color(0xffFF9678F3),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search users...'
                ),
                  controller: controller,
                  onChanged: (value) => _searchResult(value)
              ),
            ),
            isSearch?
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    searchResult[index].Name,
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
                          image: NetworkImage(searchResult[index].profile)),
                    ),
                  ),
                  subtitle: Text(
                      '${searchResult[index].follower} Followers'
                  ),
                );
              },
            )
            :
          Container()
          ],
        ),
      ),
    );
  }
}
