import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grow_with_stickers/ui/screens/home/widgets/categories.dart';
import 'package:grow_with_stickers/ui/screens/home/widgets/list_books.dart';
import 'package:grow_with_stickers/ui/screens/home/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: OrientationBuilder(
        builder: (context, orientation) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ]);
            return Stack(
              children: [
                Center(child: Container(height: double.infinity, child: Image.asset('assets/images/home.png', fit: BoxFit.fill))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TopBar(onTap: ()=> ''),
                    ListBooks(),
                    Categories(),
                  ],
                ),
              ],
            );
        }
      ),
    );
  }
}
