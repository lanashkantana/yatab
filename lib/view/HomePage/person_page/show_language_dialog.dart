import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/controller/language_cubit/local_cubit.dart';
import 'package:test/generated/l10n.dart';

void showLanguageDialog(BuildContext context) {
  AwesomeDialog(
    
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.bottomSlide,
    title: S.of(context).Choose_Language,
    body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
    
          leading: const Icon(Icons.language),
          title: Text(S.of(context).English),
          onTap: () {
            context.read<LocaleCubit>().changeLocale(const Locale('en'));
            Navigator.of(context).pop(); // close dialog
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(S.of(context).Arabic),
          onTap: () {
            context.read<LocaleCubit>().changeLocale(const Locale('ar'));
            Navigator.of(context).pop(); // close dialog
          },
        ),
      
         ListTile(
          leading: const Icon(Icons.language),
          title: Text(S.of(context).Italy),
          onTap: () {
            context.read<LocaleCubit>().changeLocale(const Locale('it'));
            Navigator.of(context).pop(); // close dialog
          },
        ),
        
            
             
      ],
    ),
    btnOk: null,
    btnCancel: null,
  ).show();
}
