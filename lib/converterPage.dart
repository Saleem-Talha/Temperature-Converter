import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  late double input;
  late double output;
  late bool fOrC;
  Color myColor = const Color(0xFF2849E6);
  Color myColor2 = const Color(0xFF212936);

  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    fOrC = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saleem Talha's Temperature Converter",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: myColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: myColor2),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Choose Fahrenheit or Celsius",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "F",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Radio<bool>(
                          value: false,
                          groupValue: fOrC,
                          onChanged: (v) {
                            setState(() {
                              fOrC = v!;
                            });
                          }),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "C",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Radio<bool>(
                        value: true,
                        groupValue: fOrC,
                        onChanged: (v) {
                          setState(() {
                            fOrC = v!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (str) {
                try {
                  input = double.parse(str);
                } catch (e) {
                  input = 0.0;
                }
              },
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                labelText:
                    "Input Value in ${fOrC == false ? "Fahrenheit" : "Celsius"}",
                labelStyle: TextStyle(color: myColor),
                filled: true,
                fillColor: Colors.white,
                hintText: " ${fOrC == false ? "Fahrenheit" : "Celsius"}",
                hintStyle: TextStyle(color: myColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: myColor),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              textAlignVertical: TextAlignVertical.center,
              enableInteractiveSelection: true,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    fOrC == false
                        ? output = (input - 32) * (5 / 9)
                        : output = (input * 9 / 5) + 32;
                  });
                  AlertDialog dialog = AlertDialog(
                    content: fOrC == false
                        ? Text("$input F: $output C")
                        : Text("$input C: $output F"),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog;
                    },
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: myColor),
                child: const Text("Convert")),
          ],
        ),
      ),
    );
  }
}
