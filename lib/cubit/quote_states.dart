import 'package:quotz/models/quote_model.dart';

abstract class QuoteState {}

class InitialState extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final Contents quote;

  QuoteLoaded(this.quote);
}

class ErrorLoading extends QuoteState {}
