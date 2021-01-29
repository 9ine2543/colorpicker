import 'package:flutter/material.dart';

class ColorSelectPage extends StatefulWidget {
  final Color myColor;

  const ColorSelectPage({Key key, this.myColor}) : super(key: key);
  @override
  _ColorSelectPageState createState() => _ColorSelectPageState();
}

class _ColorSelectPageState extends State<ColorSelectPage> {
  int r, g, b;
  TextEditingController rCon, gCon, bCon;
  @override
  void initState() {
    super.initState();
    r = (widget.myColor.value & 0x00ff0000) >> 16;
    g = (widget.myColor.value & 0x0000ff00) >> 8;
    b = widget.myColor.value & 0x000000ff;
    rCon = TextEditingController(text: r.toString());
    gCon = TextEditingController(text: g.toString());
    bCon = TextEditingController(text: b.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(r, g, b, 1.0),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Spacer(flex: 2),
              _buildShowColor(),
              Spacer(),
              Slider(
                value: r.toDouble(),
                min: 0,
                max: 255,
                activeColor: Colors.red,
                inactiveColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    r = value.toInt();
                    rCon.text = r.toString();
                  });
                },
              ),
              Slider(
                value: g.toDouble(),
                min: 0,
                max: 255,
                activeColor: Colors.green,
                inactiveColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    g = value.toInt();
                    gCon.text = g.toString();
                  });
                },
              ),
              Slider(
                value: b.toDouble(),
                min: 0,
                max: 255,
                activeColor: Colors.blue,
                inactiveColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    b = value.toInt();
                    bCon.text = b.toString();
                  });
                },
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShowColor() {
    return Container(
      width: 320,
      height: 440,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5.0),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300,
            height: 300,
            color: Color.fromRGBO(r, g, b, 1.0),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '#' + r.toRadixString(16).padRight(2, '0') + g.toRadixString(16).padRight(2, '0') + b.toRadixString(16).padRight(2, '0'),
                    style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: rCon,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black, fontSize: 24),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: gCon,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black, fontSize: 24),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: bCon,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: Text(
                          'R',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: Text(
                          'G',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: Text(
                          'B',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey, fontSize: 18),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
