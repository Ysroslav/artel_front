import 'package:flutter/material.dart';
import 'package:web_artel/pages/components/app_bar.dart';
import 'package:web_artel/pages/components/body.dart';
import 'package:web_artel/pages/components/footer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    const Spacer(),
                    const Body(),
                    const Spacer(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Footer()
                        ]
                    )
                  ]
              )
          ),
        ),
      ),
    );
  }

}
