import 'package:flutter/material.dart';
import 'package:flutter_basic_navigation/Screens/bottom_navigation/home/home_screen.dart';
import 'package:flutter_basic_navigation/Screens/bottom_navigation/acccount/account_screen.dart';
import 'package:flutter_basic_navigation/Screens/bottom_navigation/notification/notification_screen.dart';
import 'package:flutter_basic_navigation/Screens/bottom_navigation/report/report_screen.dart';
import 'package:flutter_basic_navigation/Screens/bottom_navigation/setting/setting_screen.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //initial state
  @override
  void initState() {
    _title = "DashBoard";
    super.initState();
  }

  // สร้างตัวแปร List เก็บรายการหน้าที่ต้องการเปลี่ยน ใน bottom nav
  int _currentIndex = 0;
  String _title;

  final List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreen(),
    AccountScreen(),
  ];

  //สร้าง Model เปลี่ยนหน้า
  void onTab(int index) {
    print(index); //จะเปลี่ยนทุกครั้งที่กด
    //if(e){
    // e.preventDefault()
    //}
    //เหมือน submit() ของ react ที่ ()=fc
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = "หน้าหลัก";
          break;

        case 1:
          _title = "รายงาน";
          break;

        case 2:
          _title = "แจ้งเตือน";
          break;

        case 3:
          _title = "ตั้งค่า";
          break;

        case 4:
          _title = "ฉัน";
          break;
      }
    });
  }

  int bt() {
    return _currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_title"),
      ),
      drawer: SafeArea(
          child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                onTap: () {
                  print("GestureDetector");
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn3.iconfinder.com/data/icons/business-1-42/100/Untitled-2-14-512.png"),
                  backgroundColor: Colors.white,
                ),
              ),
              otherAccountsPictures: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: new CircleBorder(),
                    onTap: () {
                      print("Material");
                    },
                    splashColor: Colors.blue,
                    child: new Icon(
                      Icons.settings,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
              accountName: Text("Chaiyaphat supharak"),
              accountEmail: Text("Chaiyaphat@gmail.com"),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.wallpaperscraft.com/image/car_glaciers_scifi_137640_1920x1080.jpg"),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("เกี่ยวกับเรา"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.data_usage),
              title: Text("ข้อมูลการใช้งาน"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/term');
              },
            ),
            ListTile(
              leading: Icon(Icons.text_rotation_angleup),
              title: Text("ติดต่องาน"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text("ออกจากระบบ"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            Divider(
              color: Colors.grey[200],
            ),
            ListTile(
              leading: Icon(Icons.cancel),
              title: Text("Close"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTab,
        currentIndex: bt(),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "หน้าหลัก"),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), label: "รายงาน"),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new), label: "แจ้งเตือน"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_outlined), label: "ตั้งค่า"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "ฉัน"),
        ],
      ),
      body: Center(
        child: _children[_currentIndex],
      ),
    );
  }
}
