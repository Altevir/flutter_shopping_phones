import 'package:flutter/material.dart';

class CustomIndicatorView extends StatelessWidget {
  const CustomIndicatorView({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isSelected ? 18 : 8,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff06142B) : const Color(0xff06142B).withOpacity(0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
