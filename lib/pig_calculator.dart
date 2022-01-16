import 'package:flutter/material.dart';
import 'package:midterm_620710648/main.dart';

void main() {
  runApp(const MyApp());
}

class pig_calculator extends StatelessWidget {
  final _lengthController = TextEditingController();
  final _girthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'PIG WEIGHT',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                  const Text(
                    'CALCULATOR',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/images/pig.png',
                height: 150,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('LENGTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _lengthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter length',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 15.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('GIRTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _girthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter girth',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    var L = _lengthController.text;
                    var G = _girthController.text;
                    double? length = double.tryParse(L);
                    double? girth = double.tryParse(G);

                    if (length == null || girth == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("ERROR"),
                            content: const Text("Invalid input"),
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
                    } else {
                      double w = (girth / 100) * (girth / 100) *
                          (length / 100) * 69.3;
                      double p = w * 112.50;
                      double Toler_w_max = (0.03 * w) + w;
                      double Toler_p_max = (0.03 * p) + p;
                      double Tolre_w_min = w - (0.03 * w);
                      double Toler_p_min = p - (0.03 * p);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('RESULT'),
                            content: Text('Weight: ${Tolre_w_min
                                .round()} - ${Toler_w_max
                                .round()} kg\nPrice: ${Toler_p_min
                                .round()} - ${Toler_p_max
                                .round()} Baht'),
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
                  },child: Text('CALCULATE',style: TextStyle(fontSize: 25),)),
            ),
          ],
        ),
      ),
    );
  }
}
