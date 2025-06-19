import 'package:flutter/material.dart';

class MyQr extends StatefulWidget {
  const MyQr({super.key});

  @override
  State<MyQr> createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: const [
        Text("Connect with Your Partner"),
        
      ]),
    );
  }
}
