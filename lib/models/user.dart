class MyUser{
  final String? id;
  final String Name;
  final String follower;
  final String profile;


  MyUser({
    required this.Name,
    required this.follower,
    required this.profile,
    this.id,
  });

  Map<String,dynamic> toMap() {
    return {
      'id': id,
      'Name': Name,
      'follower': follower,
      'profile': profile
    };
  }
}