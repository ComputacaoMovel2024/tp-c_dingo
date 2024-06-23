import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../header.dart';

class AceleroGame extends StatelessWidget {
  const AceleroGame({super.key});

  void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }

  @override
  void initState()
  {
    //SystemChrome.setPreferredOrientations(const [DeviceOrientation.landscapeLeft,
    //DeviceOrientation.landscapeRight]);
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(),
      body: Center(
        child:
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/avatar.png")
              )
            ),
          )
      ),
    );
  }
}