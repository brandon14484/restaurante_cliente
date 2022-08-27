import 'package:flutter/material.dart';
import '../../../../theme/my_colors.dart';

/// Linea divisora de contenido.
/// Se parece mucho a un tag `<hr/>` de HTML.
class UiDividerFormWidget extends StatelessWidget {
  const UiDividerFormWidget({Key? key}) : super(key: key);

  @override
  build(BuildContext context){
    return const Divider(
      height: 2,
      thickness: 2,
      indent: 20,
      endIndent: 20,
      color: MyColors.lightGreyFocused,
    );
  }
}
