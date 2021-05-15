import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List item = [
      "ascasc.png",
      "ascasc.png",
      "ascasc.png",
      "ascasc.png",
      "ascasc.png",
      "ascasc.png",
      "ascasc.png",
      "ascasc.png",
    ];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(FoodK.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 2.5, right: 10, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFF04D56),
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 25, top: 10, bottom: 12),
                      child: Text(
                        FoodK[0],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Wrap(
              spacing: 2,
              runSpacing: 2,
              children: List.generate(item.length, (index) {
                return Container(
                  width: (size.width - 2) / 2,
                  height: (size.width - 2) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(image: AssetImage(item[index]))),
                );
              }))
        ],
      ),
    );
  }
}
