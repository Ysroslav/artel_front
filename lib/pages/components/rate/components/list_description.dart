import 'package:flutter/cupertino.dart';

import 'description.dart';

class ListDescription extends StatelessWidget{
  final double height;
  final List<String> desc;

  const ListDescription({
    Key? key,
    required this.height,
    required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List.generate(desc.length,
            (index) => DescriptionRate(description: desc[index]));
    return Container(
      height: height,
      child: SingleChildScrollView(
        child : Column(
            children: widgets
        )
      ),
    );
  }

}