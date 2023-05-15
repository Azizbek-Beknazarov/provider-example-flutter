import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/generated/l10n.dart';

import '../../providers/language_provider.dart';

class LanguagesWidget extends StatelessWidget {
  const LanguagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerLanguage = Provider.of<LanguageProvider>(context);

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Text(
              AppLocalization.of(context).language,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              LanguageItemWidget(
                isChecked: providerLanguage.language == const Locale("ru"),
                text: "Русский",
                flagName: 'ru',
                onTap: () {
                  providerLanguage.language = const Locale('ru');
                },
              ),
              const Divider(),
              LanguageItemWidget(
                isChecked: providerLanguage.language == const Locale("uz"),
                text: "O'zbek",
                flagName: 'uz',
                onTap: () {
                  providerLanguage.language = const Locale('uz');
                },
              ),
              const Divider(),
              LanguageItemWidget(
                isChecked: providerLanguage.language == const Locale("en"),
                text: "English",
                flagName: 'en',
                onTap: () {
                  providerLanguage.language = const Locale('en');
                },
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class LanguageItemWidget extends StatelessWidget {
  final String? flagName;
  final String text;
  final Function()? onTap;
  final bool isChecked;

  const LanguageItemWidget({
    Key? key,
    required this.text,
    this.onTap,
    this.isChecked = false,
    this.flagName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      onTap: onTap,
      leading: ClipOval(
        child: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.blue,
          child: Image.asset(
            'assets/png/$flagName.png',
            height: 40,
            width: 40,
            fit: BoxFit.fill,
          ),
        ),
      ),
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
