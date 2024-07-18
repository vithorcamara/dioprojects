import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CounterApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;

  void enterSala() {
    setState(() {
      if (counter < 20) {
        counter++;
      }
    });
  }

  void leaveSala() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  String getStatusSala() {
    if (counter == 0) {
      return 'Empty Classroom';
    } else if (counter == 20) {
      return 'Full Classroom';
    } else {
      return 'Occupied Classroom';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../images/background_counter.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    getStatusSala(),
                    style: TextStyle(
                      fontSize: 36,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.black,
                    ),
                  ),
                  Text(
                    getStatusSala(),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: counter == 20 ? Colors.red : Colors.green,
                    ),
                  ),
                ]
              ),
              const SizedBox(height: 20),
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'Contagem: $counter',
                    style: TextStyle(
                      fontSize: 24,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.black,
                    ),
                  ),
                  Text(
                    'Contagem: $counter',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: leaveSala,
                    child: const Icon(Icons.reply),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: enterSala,
                    child: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
