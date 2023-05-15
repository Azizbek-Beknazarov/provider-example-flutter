import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/theme_provider.dart';

import '../../generated/l10n.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerTheme = Provider.of<ThemeProvider>(context);

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Text(
              AppLocalization.of(context).chooseTheme,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ThemeItemWidget(
                text: "Light",
                onTap: () {
                  providerTheme.setCustomTheme = Brightness.light;
                },
              ),
              const Divider(),
              ThemeItemWidget(
                text: "Dark",
                onTap: () {
                  providerTheme.setCustomTheme = Brightness.dark;
                },
              ),
              const Divider(),
              ThemeItemWidget(
                text: "System",
                onTap: () {
                  providerTheme.setCustomTheme =
                      SchedulerBinding.instance.window.platformBrightness;
                },
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class ThemeItemWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool isChecked;

  const ThemeItemWidget({
    Key? key,
    required this.text,
    this.onTap,
    this.isChecked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      onTap: onTap,
      title: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      trailing: Visibility(
        visible: isChecked,
        child: const Icon(
          Icons.check,
          size: 24,
          color: Colors.blue,
        ),
      ),
    );
  }
}
