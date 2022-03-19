import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    required this.label,
    required this.onPressed,
    required this.color,
    required this.nameController,
    Key? key,
  }) : super(key: key);

  final TextEditingController nameController;
  final VoidCallback onPressed;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: SizedBox(
              child: ElevatedButton(
                child: Text(label),
                style: ElevatedButton.styleFrom(
                  primary: color,
                  shape: const StadiumBorder(),
                  minimumSize: const Size(80, 40),
                ),
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
