import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String environment = '';
  String packageName = '';

  void _incrementCounter() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (packageInfo.packageName.contains('.dev')) {
      environment = 'Running in development environment';
      packageName = packageInfo.packageName;
    }
    if (packageInfo.packageName.contains('.stag')) {
      environment = 'Running in staging environment';
      packageName = packageInfo.packageName;
    } else {
      environment = 'Running in production environment';
      packageName = packageInfo.packageName;
    }
    setState(() {});
  }

  @override
  void initState() {
    _incrementCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(environment),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(packageName),
          ],
        ),
      ),
    );
  }
}
