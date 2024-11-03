import 'package:flutter/material.dart';

class RingButtonGroup extends StatefulWidget {
  @override
  _RingButtonGroupState createState() => _RingButtonGroupState();
}

class _RingButtonGroupState extends State<RingButtonGroup> {
  int _selectedIndex = 0;

  // Lista de opciones para el grupo de botones
  final List<String> options = ['1', '2', '3', '4'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(options.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _selectedIndex == index
                    ? Colors.blue // Color de selección
                    : Colors.grey,
                width: 3, // Ancho del anillo
              ),
            ),
            child: Center(
              child: Text(
                options[index],
                style: TextStyle(
                  fontSize: 18,
                  color: _selectedIndex == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
