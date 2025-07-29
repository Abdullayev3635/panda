part of 'choose_language_bloc.dart';

class ChooseLanguageState extends Equatable {
  final SubmissionStatus status;

  const ChooseLanguageState({this.status = SubmissionStatus.initial});

  ChooseLanguageState copyWith({SubmissionStatus? status}) =>
      ChooseLanguageState(status: status ?? this.status);

  @override
  List<Object?> get props => [status];
}
