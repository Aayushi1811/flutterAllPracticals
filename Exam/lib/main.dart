import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Product Adding Form';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
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

class _ElevatedButtonExampleState extends State<ElevatedButtonExample> {
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  void _addProduct() {
    final String name = myController.text;
    final String description = myController1.text;
    final String priceString = myController2.text;

    if (name.isEmpty) {
      _showDialog('Product name cannot be empty.');
      return;
    }

    if (description.length < 1 || description.length > 10) {
      _showDialog('Description must be between 1 and 10 characters.');
      return;
    }

    final double? price = double.tryParse(priceString);
    if (price == null || price <= 0) {
      _showDialog('Price must be a positive number.');
      return;
    }

    _showDialog('New Product Added: $name\nDescription: $description\nPrice: \${price.toStringAsFixed(2)}');
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Product List'),
          content: Text(message),
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
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text('Add new product name', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: TextField(
              maxLength: 20,
              controller: myController,
            ),
          ),
          Center(
            child: Text('Add new product description', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: TextField(
              maxLength: 100,
              controller: myController1,
            ),
          ),
          Center(
            child: Text('Add new product price', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: TextField(
              maxLength: 10,
              controller: myController2,
              keyboardType: TextInputType.number,
            ),
          ),
          Center(
            child: ElevatedButton(
              style: style,
              onPressed: _addProduct,
              child: const Text('ADD'),
            ),
          ),
        ],
      ),
    );
  }
}
