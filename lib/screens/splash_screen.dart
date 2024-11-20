import 'package:flutter/material.dart';
import 'package:flutter_assignment_5_new/screens/walkthrough_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3366FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WalkThroughScreen(),));
              }, icon: Icon(Icons.add,size: 40,
                color: Color(0xFF3366FF,),
              )),
            ),

            // FloatingActionButton(
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => WalkThroughScreen(),));
            //   },
            //   backgroundColor: Colors.white,
            //   child: Icon(
            //     Icons.add,
            //     color: Color(0xFF3366FF),
            //     size: 40,
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Quick Medical',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
