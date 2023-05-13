import 'package:flutter/material.dart';

import 'info_container.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: (Column(
          children: [
            Expanded(
              child: Row(
                children: const [
                  InfoContainer(Color(0xFF1D1E33)),
                  InfoContainer(Color(0xFF1D1E33)),
                ],
              ),
            ),
            const InfoContainer(Color(0xFF1D1E33)),
            Expanded(
              child: Row(
                children: const [
                  InfoContainer(Color(0xFF1D1E33)),
                  InfoContainer(Color(0xFF1D1E33)),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}


