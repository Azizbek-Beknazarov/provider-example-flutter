
import 'dart:ui';

import 'package:flutter/material.dart';

typedef WidgetScrollBuilder = Widget Function(
  BuildContext context,
  ScrollController? controller,
);

Future<T?> customModalBottomSheet<T>({
  required BuildContext context,
  required WidgetScrollBuilder builder,
  bool isDismissible = true,
  bool enableDrag = true,
  double blurValue = 3,
  bool isScrollControlled = false,
}) async {
  return showModalBottomSheet(
    context: context,
    elevation: 0,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      minHeight: MediaQuery.of(context).size.height * 0.2,
    ),
    builder: (_) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Material(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  child: isScrollControlled
                      ? DraggableScrollableSheet(
                          initialChildSize: 1,
                          minChildSize: 0.5,
                          expand: false,
                          snap: true,
                          builder: (context, controller) {
                            return builder(context, controller);
                          },
                        )
                      : builder(context, null),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

// Future<T?> cupertinoSheet<T>({
//   required BuildContext context,
//   required Widget title,
//   required List<Widget> children,
// }) async {
//   final size = MediaQuery.of(context).size;
//   if (Platform.isIOS) {
//     return await showCupertinoModalPopup(
//       context: context,
//       builder: (ctx) {
//         return CupertinoActionSheet(
//           title: title,
//           actions: List.generate(
//             children.length,
//             (index) => CupertinoActionSheetAction(
//               onPressed: () {},
//               child: children[index],
//             ),
//           ),
//           cancelButton: CupertinoActionSheetAction(
//             child: Text(AppTranslations.of(context).cancel),
//             onPressed: () {
//               Navigator.of(context, rootNavigator: true).pop();
//             },
//           ),
//         );
//       },
//     );
//   } else {
//     return await showModalBottomSheet(
//       context: context,
//       builder: (ctx) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             title,
//             ...children,
//           ],
//         );
//       },
//     );
//   }
// }
