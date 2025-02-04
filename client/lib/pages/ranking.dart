import 'dart:convert';
import 'package:client/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/model/food.dart';

class Rank extends StatefulWidget {
  @override
  _RankState createState() => _RankState();
}

class _RankState extends State<Rank> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Map<String, dynamic>> food = [];
  List<Map<String, dynamic>> users = [];
  getFood() async {
    try {
      var res = await http
          .get(Uri.parse("https://ezcooks.herokuapp.com/food/rankFood"));
      if (res.statusCode == 200) {
        var listFood =
            (jsonDecode(res.body)['food']).map((e) => Food.fromJson(e));
        var listUser =
            (jsonDecode(res.body)['user']).map((e) => User.fromJson(e));
        for (final listFood in listFood) {
          food.add({
            "nameFood": listFood.nameFood,
            "timeCook": listFood.timeCook,
            "categoryFood": listFood.categoryFood,
            "ingredient": listFood.ingredient,
            "linkYoutube": listFood.linkYoutube,
            "howCook": listFood.howCook,
            "imageFood": listFood.imageFood,
            "like": listFood.like.toString()
          });
        }
        for (final vv in listUser) {
          users.add({
            "imageProfile": vv.imageProfile,
            "username": vv.username,
          });
        }
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getFood();
    controller.addListener(() {
      double value = controller.offset / 119;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });

    super.initState();
  }

  getPostsData(index, food, user) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
          height: 80,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFFFE6E1),
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: Container(
                  width: 28,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFF04D56),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 30, bottom: 5),
                    child: Flexible(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  width: 80,
                  height: 100,
                  child:
                      Image.network(food['imageFood'], fit: BoxFit.fitHeight)),
              Container(
                width: 170,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 2),
                      child: Flexible(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(500),
                              child: Image.network(
                                user['imageProfile'],
                                height: 22,
                                width: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                user['username'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, top: 2),
                      child: Flexible(
                        child: Row(
                          children: [
                            Text(food['nameFood']),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, top: 2),
                      child: Flexible(
                        child: Row(
                          children: [
                            Text(
                              "ยอดกดหัวใจทั้งหมด ${food['like']} ครั้ง",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFFF04D56),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0, top: 8),
                              child: Flexible(
                                child: Text(
                                  "อาหารประเภท ${food['categoryFood']}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "เมนูยอดนิยม",
                    style: TextStyle(fontSize: 18, color: Color(0xFFF04D56)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    controller: controller,
                    itemCount: food.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return getPostsData(index, food[index], users[index]);
                    })),
          ],
        ),
      ),
    );
  }
}
