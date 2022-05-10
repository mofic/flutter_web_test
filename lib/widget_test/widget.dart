import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled1/BasePage.dart';

class WidgetPage extends BasePage {
  WidgetPage() : super(title: "widget");

  var check = false;

  @override
  Widget getBody() {
    return SingleChildScrollView(
        child: Column(
      children: const [
        Text("test"),
        Image(
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
        CB()
      ],
    ));
  }
}

class CB extends StatefulWidget {
  const CB({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CBState();
  }
}

class CBState extends State<CB> {
  var isCheck = false;

  var name = "";

  void _update(bool? value) {
    setState(() async {
      isCheck = !isCheck;
      File file = await _localFile();
      name = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [Checkbox(value: isCheck, onChanged: _update),
          Text(name)]);
  }

  Future<File> _localFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File("$dir/content.txt");
  }
}
