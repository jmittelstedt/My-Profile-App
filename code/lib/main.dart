import 'package:flutter/material.dart';

import 'hobbies.dart';
import 'pictures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 58, 129, 183),
        ),
      ),
      home: const MyHomePage(title: 'My Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Screen', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24))),
    const Center(
      child: Text('Settings Screen', style: TextStyle(fontSize: 24)),
    ),
  ];

  final List<String> _titles = ['Home', 'Profile', 'Settings'];

  void _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index; // Update index to trigger UI rebuild
    });
    Navigator.pop(
      context,
    ); // Automatically closes the drawer menu after tapping
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final Size screen = MediaQuery.of(context).size;
    final double rowHeight = (screen.height - 20) / 6;
    final double colWidth = screen.width / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(_titles[_selectedIndex]),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Navigation Menu',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('My Hobbies'),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HobbiesPage()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.collections),
              title: const Text('Favorite Pics'),
              selected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PicturesPage()),
                );
              },
            ),
          ],
        ),
      ),

      // Your existing profile page stays here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 2),

            SizedBox(
              height: rowHeight + 10,
              child: const Icon(
                Icons.account_circle,
                size: 100.0,
                color: Colors.blue,
              ),
            ),

            SizedBox(
              height: rowHeight + 10,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Jason Mittelstedt',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Flutter Beginner & App Creator',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
              child: Row(
                children: [
                  SizedBox(
                    width: colWidth,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, color: Colors.red, size: 20.0),
                        SizedBox(width: 5.0),
                        Text(
                          'Atlanta, GA, USA',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: colWidth,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email, color: Colors.blue, size: 20.0),
                        SizedBox(width: 5.0),
                        Text(
                          'jm00662@my.westga.edu',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: rowHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HobbiesPage(),
                        ),
                      );
                    },
                    child: const Text('My hobbies'),
                  ),

                  const SizedBox(height: 8.0),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PicturesPage(),
                        ),
                      );
                    },
                    child: const Text('My favorite pics'),
                  ),
                ],
              ),
            ),

            Container(height: rowHeight),
          ],
        ),
      ),
    );
  }
}
