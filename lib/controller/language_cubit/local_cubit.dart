import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'local_state.dart';


class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en'));

  void changeLocale(Locale locale) {
    emit(locale);
  }
}
