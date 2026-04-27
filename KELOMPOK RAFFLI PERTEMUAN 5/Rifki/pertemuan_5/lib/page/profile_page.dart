import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1504805572947-34fad45aed93',
              ),
            ),
            SizedBox(height: 20),
            Text("Jhon Doe", style: TextStyle(fontSize: 24)),
            Text("Jakarta, Indonesia"),
            Text("Flutter Software Engineer"),
          ],
        ),
      ),
    );
  }
}
