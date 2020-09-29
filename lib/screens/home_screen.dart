
import 'package:mindcom/models/diagnostic_tests.dart';
import 'package:mindcom/screens/about_screen.dart';
import 'package:mindcom/screens/product_screen.dart';
import 'package:mindcom/screens/users_screen.dart';
import 'package:mindcom/widgets/main_drawer.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<DiagnosticTests> futureSearch;
  bool isSearching = false;
  TextEditingController searchContoller = TextEditingController();
  // List<DiagnosticTests> diagonsticsTestModel;
  // String query = "";

  // Future<List<DiagnosticTests>> searchUser(String diagnosticTests) {
  //   FirebaseFirestore.instance
  //       .collection("products")
  //       .where("test", arrayContains: "test_code")
  //       .orderBy("createdAt")
  //       .get()
  //       .then((snapshot) {
  //     return snapshot.docs;
  //   });
  //   return null;
  // }
  TextEditingController _testDec = TextEditingController();

  TextEditingController _testCode = TextEditingController();
  DiagnosticTests diagonisctcs = DiagnosticTests();

 

  Widget buildActions(
      BuildContext context, IconData icon, String title, String routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 10,
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              childAspectRatio: 2 / 1,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                buildActions(
                  context,
                  Icons.local_hospital,
                  'Products',
                  ProductScreen.routeName,
                ),
                buildActions(
                  context,
                  Icons.supervised_user_circle,
                  'Users',
                  UsersScreen.routeName,
                ),
                buildActions(
                  context,
                  Icons.person,
                  'About Us',
                  AboutScreen.routeName,
                )
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  // void searchMethod(String text) {
  //   DatabaseReference searchRef =
  //       FirebaseDatabase.instance.reference().child("Data");
  //   searchRef.once().then((DataSnapshot snapshot) {
  //     dataList.clear();
  //     var keys = snapshot.value.keys;
  //     var values = snapshot.value;
  //     for(var key in keys){
  //       Data data = Data()
  //     }
  //   });
  // }
}
