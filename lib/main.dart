import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Bottome_Navigation/Navigation_Bar.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Home/Home_page.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Profile.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/community.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/favorite.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/features.dart';
import 'package:event_managment_app/presentation/views/Create_event/Uplaod_event.dart';
import 'package:event_managment_app/presentation/views/Create_event/create_event.dart';
import 'package:event_managment_app/presentation/views/Edit_details/ediit_details.dart';
import 'package:event_managment_app/presentation/views/Group_profile/group_profile.dart';
import 'package:event_managment_app/presentation/views/Login/create_account.dart';
import 'package:event_managment_app/presentation/views/Login/login.dart';
import 'package:event_managment_app/presentation/views/Provider/theme_provider.dart';
import 'package:event_managment_app/presentation/views/event/evets_page.dart';
import 'package:event_managment_app/presentation/views/iphone-16/notifition.dart';
import 'package:event_managment_app/presentation/views/splash_screen/splash_screen.dart';
import 'package:event_managment_app/presentation/views/walkthrough_pages/walkthrough_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=> ThemeProvider(),
      child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Dark Mode App',
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,

      // LIGHT THEME
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      ),

      // DARK THEME (Yahan changes ki hain)
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black, // Puri app ka background Black

        // 1. Sab Text ko White karne ke liye
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),

        // 2. Sab Icons ko White karne ke liye
        iconTheme: const IconThemeData(color: Colors.white),

        // 3. Card ya Container ka color set karne ke liye
        // (Dark mode mein containers ko halka dark rakha jata hai taake white text dikhe)
        cardColor: Colors.grey,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: Walkthrough1(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
