import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class AppWidgetAnimator extends StatelessWidget {
  final Widget? widget;
  final WidgetTransitionEffects? widgetTransitionEffects, outgoingEffects;
  final WidgetRestingEffects? widgetRestingEffects;

  const AppWidgetAnimator({
    super.key,
    this.widget,
    this.widgetTransitionEffects,
    this.outgoingEffects,
    this.widgetRestingEffects,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
      incomingEffect: widgetTransitionEffects,
      atRestEffect: widgetRestingEffects,
      outgoingEffect: outgoingEffects,
      child: widget,
    );
  }
}
