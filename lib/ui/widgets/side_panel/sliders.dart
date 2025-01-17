import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_finding/notifiers/diagonal_path_cost_state_notifier.dart';
import 'package:path_finding/notifiers/horizontal_and_vertical_path_cost_state_notifier.dart';
import 'package:path_finding/ui/colors.dart';
import 'package:path_finding/ui/common/text/unit_rounded_text.dart';

class DiagonalPathCostSlider extends ConsumerWidget {
  const DiagonalPathCostSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diagonalCost =
        ref.watch(diagonalPathCostStateNotifierProvider).roundToDouble();

    return Column(
      children: [
        UnitRoundedText(
          '$diagonalCost',
          centerText: true,
        ),
        Slider(
            min: 0,
            max: 60,
            activeColor: AppColors.sliderColor,
            value: diagonalCost,
            onChanged: (value) => ref
                .read(diagonalPathCostStateNotifierProvider.notifier)
                .setDiagonalCost(value)),
        const UnitRoundedText(
          'Diagonal path cost',
          centerText: true,
        )
      ],
    );
  }
}

class HorizontalAndVerticalPathCostSlider extends ConsumerWidget {
  const HorizontalAndVerticalPathCostSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final horizontalAndVerticalCost = ref
        .watch(horizontalAndVerticalPathCostStateNotifierProvider)
        .roundToDouble();

    return Column(
      children: [
        UnitRoundedText(
          '$horizontalAndVerticalCost',
          centerText: true,
        ),
        Slider(
            min: 0,
            max: 60,
            activeColor: AppColors.sliderColor,
            value: horizontalAndVerticalCost,
            onChanged: ref
                .read(
                    horizontalAndVerticalPathCostStateNotifierProvider.notifier)
                .setHorizontalPathCost),
        const UnitRoundedText(
          'Horizontal and Vertical path cost',
          centerText: true,
        )
      ],
    );
  }
}
