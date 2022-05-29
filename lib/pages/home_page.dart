import 'package:flutter/material.dart';
import 'package:web_artel/pages/components/body.dart';
import 'package:web_artel/pages/components/footer.dart';
import 'components/app_bar.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

}