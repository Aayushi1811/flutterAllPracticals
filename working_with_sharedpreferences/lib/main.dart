import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = '';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Application Form'),
        ),
        body: const ElevatedButtonExample(),
      ),
    );
  }
}

class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Text('Save Data', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 100.0, right: 100.0),
            child: TextField(
              maxLength: 100,
              controller: myController,
            ),
          ),
          Center(
            child: ElevatedButton(
              style: style,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('name', myController.text);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Navrachana University'),
                      content: Text('${myController.text} is Saved'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Save Value'),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: style,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final sname = prefs.getString('name') ?? 'None';
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Navrachana University'),
                      content: Text('$sname'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Retrieve Value'),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: style,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('name');
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Navrachana University'),
                      content: const Text('Value is Cleared'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Clear Value'),
            ),
          ),
        ],
      ),
    );
  }
}
