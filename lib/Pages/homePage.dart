import 'package:colorpicker/Pages/colorSelectPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> favColor = [Colors.red, Colors.pink, Colors.purple, Colors.green, Colors.blueAccent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              for (var i = 0; i < 5; i++)
                FlatButton(
                  onPressed: () {
                    print('get in select color page');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ColorSelectPage(myColor: favColor[i])));
                  },
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 100,
                    color: favColor[i],
                  ),
                ),
              TextButton(
                onPressed: () => print('get in to select color page'),
                child: Text(
                  'START OVER',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
