import 'package:flutter/material.dart';

class ShimmerTile extends StatelessWidget {
  const ShimmerTile({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final base = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.05);
    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: base,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
