import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3, // Updated length to 3 for the new Toast tab
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar Example'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list), text: "List"),
                Tab(icon: Icon(Icons.grid_on), text: "Grid"),
                Tab(
                    icon: Icon(Icons.notifications),
                    text: "Toast"), // New Toast tab
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildListView(),
              buildGridView(),
              buildToastButton(), // New Toast tab content
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: UserAccountsDrawerHeader(
                    accountName: Text("Alina"),
                    accountEmail: Text("alina.sufiyeva@kimep.kz"),
                    currentAccountPicture: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.yellow),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("About Me"),
                  leading: Icon(Icons.account_box),
                ),
                ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget buildListView() {
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      return ListTile(
        leading: const Icon(Icons.album),
        title: Text('Item ${index + 1}'),
      );
    },
  );
}


Widget buildGridView() {
  return GridView.builder(
    padding: const EdgeInsets.all(8.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    ),
    itemCount: 6,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(
                "https://as2.ftcdn.net/jpg/09/10/93/65/1000_F_910936564_QYSuokwKpGfd5U84U3JdlpwBj2dG1Pek.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );
}

Widget buildDrawer() {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: UserAccountsDrawerHeader(
            accountName: Text("Alina"),
            accountEmail: Text("alina.sufiyeva@kimep.kz"),
            currentAccountPicture: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle, color: Colors.yellow),
            ),
          ),
        ),
        const ListTile(
          title: Text("About me"),
          leading: Icon(Icons.settings),
        ),
        const ListTile(
          title: Text("Settings"),
          leading: Icon(Icons.settings),
        ),
        const ListTile(
          title: Text("Home"),
          leading: Icon(Icons.settings),
        ),
        const ListTile(
          title: Text("Logout"),
          leading: Icon(Icons.settings),
        ),
      ],
    ),
  );
}

Widget buildToastButton() {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        Fluttertoast.showToast(
          msg: "Hello, Flutter!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      child: Text("Show Toast"),
    ),
  );
}
