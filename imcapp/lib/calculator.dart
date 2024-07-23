import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CalculatorApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double imcResult = 0;
  String imcRank = '';

  void calculateIMC() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      double bmi = weight * 10000 / (height * height);
      setState(() {
        imcResult = bmi;
        switch(bmi){
          case < 16:
            imcRank = 'Magreza Grave';
          case 16 || < 17:
            imcRank = 'Magreza Moderada';
          case 17 || < 18.5:
            imcRank = 'Magreza Leve';
          case 18.5 || < 25:
            imcRank = 'Saudável';
          case 25 || < 30:
            imcRank = 'Sobrepeso';
          case 30 || < 35:
            imcRank = 'Obesidade Grau I';
          case 35 || < 40:
            imcRank = 'Obesidade Grau II (Severa)';
          case >= 40:
            imcRank = 'Obesivade Grau III (Mórbida)';
          default:
            imcRank = 'Resultado não calculado!'; 
        }
      });
      print('$imcResult, $imcRank');
    } else {
      setState(() {
        imcResult = 0;
        imcRank = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../images/background_calculator.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: const Color.fromARGB(200, 244, 67, 54),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'IMC Calculator',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  )
                ],
              ),
            ),
            const Icon(Icons.person, color: Colors.white, size: 150,),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Resultado do IMC: ${imcResult.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              imcRank,
              style: const TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: calculateIMC,
              child: const Text(
                'Calcular IMC',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 200.0,)
          ],
        ),
      ),
    );
  }
}
