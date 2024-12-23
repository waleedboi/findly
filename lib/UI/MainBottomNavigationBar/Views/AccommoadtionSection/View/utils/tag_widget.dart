import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TagWidget({
    Key? key,
    required this.label,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade300 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey.shade400,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isSelected)
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.check_circle,
                size: 16,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}