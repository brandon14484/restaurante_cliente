import 'package:flutter/material.dart';

class RoundedElevatedContainerWidget extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const RoundedElevatedContainerWidget({
    Key? key,
    this.child,
    this.width = double.infinity,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: const [
          BoxShadow(
            blurRadius: 7,
            color: Color(0x2E000000),
            offset: Offset(0, 4),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}