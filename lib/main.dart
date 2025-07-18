import 'package:flutter/material.dart';
import './screenone.dart';

void main() {
  runApp(MaterialApp(home: LoginUI(), debugShowCheckedModeBanner: false));
}

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password')),
      );
    } else if (username != 'sangeeth' && password != '1234') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    } else if (username != 'sangeeth') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username is incorrect')),
      );
    } else if (password != '1234') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password is incorrect')),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Login Successful"),
          content: Text("Welcome, $username!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenOne()),
                );
              },
              child: Text("Continue"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCGL6eZhk3FQUWrSy-RdtxE2oj3uNcla81LQ&s',
              width: 150,
              height: 150,
              loadingBuilder: (
                BuildContext context,
                Widget child,
                ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 40),

            // Username Field
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),

            // Password Field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),

            Center(
              child: Container(
                height: 70,
                width: 250,
                child: ElevatedButton(
                  onPressed: login,
                  child: Text('login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(231, 43, 4, 239),
                    foregroundColor: const Color.fromARGB(255, 237, 231, 231),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
