import 'package:flutter/material.dart';
import 'package:provider_example/page/widgets/languages_widget.dart';
import 'package:provider_example/page/widgets/profile_item_widget.dart';
import 'package:provider_example/page/widgets/theme_widget.dart';

import '../generated/l10n.dart';
import '../util/custom_bottom_sheet.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalization.of(context).settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileItemWidget(
              icon: const Icon(Icons.language),
              text: AppLocalization.of(context).language,
              isTop: true,
              onTap: () {
                customModalBottomSheet(
                  context: context,
                  builder: (_, __) => const LanguagesWidget(),
                );
              },
            ),
            ProfileItemWidget(
              icon: const Icon(Icons.theater_comedy),
              text: AppLocalization.of(context).theme,
              isBottom: true,
              onTap: () {
                customModalBottomSheet(
                  context: context,
                  builder: (_, __) => const ThemeWidget(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
