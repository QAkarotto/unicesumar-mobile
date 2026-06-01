import 'package:flutter/material.dart';

class SliverDivider extends StatelessWidget {
  const SliverDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
      sliver: SliverToBoxAdapter(
        child: Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 1.0,
        ),
      ),
    );
  }
}
