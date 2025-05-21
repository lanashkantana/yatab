import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test/controller/language_cubit/local_cubit.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/generated/l10n.dart'; // import your cubit path

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title:  Text(S.of(context).Choose_Language),
          content: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title:  Text(S.of(context).English),
                onTap: () {
                  context.read<LocaleCubit>().changeLocale(const Locale('en'));
                  Navigator.of(dialogContext).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title:  Text(S.of(context).Arabic),
                onTap: () {
                  context.read<LocaleCubit>().changeLocale(const Locale('ar'));
                  Navigator.of(dialogContext).pop();
                },
              ),
         
              ListTile(
                leading: const Icon(Icons.language),
                title:  Text(S.of(context).Italy),
                onTap: () {
                  context.read<LocaleCubit>().changeLocale(const Locale('it'));
                  Navigator.of(dialogContext).pop();
                },
              ),
          
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title:S.of(context).ChangeLanguage ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.translate),
          label:  Text(S.of(context).Select_Language),
          onPressed: () => _showLanguageDialog(context),
        ),
      ),
    );
  }
}
