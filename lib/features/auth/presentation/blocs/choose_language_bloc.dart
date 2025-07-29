import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/packages/formz.dart';

part 'choose_language_event.dart';

part 'choose_language_state.dart';

class ChooseLanguageBloc extends Bloc<ChooseLanguageEvent, ChooseLanguageState> {
  ChooseLanguageBloc() : super(const ChooseLanguageState()) {}
}
