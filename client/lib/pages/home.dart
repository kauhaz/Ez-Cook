import 'package:client/pages/homepage.dart';
import 'package:client/pages/profile.dart';
<<<<<<< HEAD
// import 'package:client/pages/ranking.dart';
=======
import 'package:client/pages/ranking.dart';
import 'package:client/pages/notification.dart';
>>>>>>> 9e2444c1355bc0a4071e8c91bd9b452b5a6677b5
import 'package:flutter/material.dart';
import './add_cook.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("หน้าหลัก");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      Homepage(),
      AddCook(),
<<<<<<< HEAD
      Center(
        child: Text(
          "Home Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
=======
      Rank(),
>>>>>>> 9e2444c1355bc0a4071e8c91bd9b452b5a6677b5
      Profile(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  // ignore: missing_return
  Widget getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: Color(0xFFF04D56),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 5,
              top: 5,
              bottom: 10,
            ),
            child: IconButton(
                iconSize: 30,
                icon: cusIcon,
                onPressed: () {
                  setState(() {
                    if (this.cusIcon.icon == Icons.search) {
                      this.cusIcon = Icon(Icons.cancel);
                      this.cusSearchBar = Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.white,
                          cursorHeight: 15,
                        ),
                      );
                    } else {
                      this.cusIcon = Icon(Icons.search);
                      this.cusSearchBar = Text("หน้าหลัก");
                    }
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 5,
              top: 5,
              bottom: 10,
            ),
            child: IconButton(
                iconSize: 30,
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Noti()),
                  );
                }),
          )
        ],
        title: cusSearchBar,
      );
    } else if (pageIndex == 1) {
      return AppBar(
        backgroundColor: Color(0xFFF04D56),
        title: Text("เพิ่มสูตรอาหาร"),
      );
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: Color(0xFFF04D56),
        title: Text("จัดอันดับ"),
      );
<<<<<<< HEAD
    
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: Color(0xFFF04D56),
        title: Text("Profile"),
=======
    }
     else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: Color(0xFFF04D56),
        title: Text("โปรไฟล์"),
>>>>>>> 9e2444c1355bc0a4071e8c91bd9b452b5a6677b5
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 20),
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
        ],
      );
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0 ? "assets/house+.png" : "assets/house.png",
      pageIndex == 1 ? "assets/add+.png" : "assets/add.png",
      pageIndex == 2 ? "assets/ranking+.png" : "assets/ranking.png",
      pageIndex == 3 ? "assets/user+.png" : "assets/user.png",
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Image.asset(
                  bottomItems[index],
                  height: 40,
                  width: 40,
                ),
              );
            })),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
