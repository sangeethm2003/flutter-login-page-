import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuma4_mk0Bl-wHf6nA35f9UnScGPxHEIbtvA&s',
              width: 400,
              height: 400,
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
           
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
            
              child: Text('Exit ➡️'),
              style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(116, 176, 178, 179),
                    foregroundColor: const Color.fromARGB(255, 6, 5, 5),
                  ),
                  
            ),
          ],
        ),
      ),
    );
  }
}
