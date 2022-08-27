import 'package:flutter/material.dart';
import '../container-image-blurred/ui_container_image_blurred_widget.dart';

/// [Scaffold] con fondo de imagen de la municipalidad, y al centro el logo de
/// la municipalidad y un contenedor con color `surface` definido
/// en [ColorScheme].
///
/// Para ver capturas de ejemplo, ver carpeta `readme`.
class UiScaffoldImgWithCenteredContainerWidget extends StatelessWidget {
  final Widget child;

  const UiScaffoldImgWithCenteredContainerWidget({
    super.key,
    required this.child,
  });

  @override
  build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: UiContainerImageBlurredWidget(
        // Imagen de fondo de pantalla
        imageLocation: 'assets/images/restaurant-background.jpg',
        withOpacity: true,
        blurRadius: 5.0,
        child: SizedBox.expand(
          child: Align(
            alignment: Alignment.topCenter,
            child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 600,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildLogo(),
                        _buildWhiteContainer(context: context, child: child),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/icon_duoc.png',
            width: 200,
            height: 50,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteContainer({
    required BuildContext context,
    required Widget child,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x2E000000),
              offset: Offset(0, 4),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
