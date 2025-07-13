import 'package:con2g12/models/user_model.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  UserModel user;

  UserInfoPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.id),
            Text(user.name),
            Text(user.lastname),
            Text(user.age.toString()),
            Text(user.isPeruvian.toString()),
          ],
        ),
      ),
    );
  }
}
