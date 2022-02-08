import 'package:flutter/material.dart';

class AppLitTile extends StatelessWidget {
  const AppLitTile({
    Key? key,
    required this.title,
    required this.onTap,
    this.enableTrailingIcon = false,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final bool enableTrailingIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(fontSize: 14),
      ),
      trailing: enableTrailingIcon ? const Icon(Icons.arrow_forward_ios_rounded, size: 16) : null,
    );
  }
}
