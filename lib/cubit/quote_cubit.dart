import 'package:cubit/cubit.dart';
import 'package:quotz/cubit/quote_states.dart';
import 'package:quotz/repository/quote_repository.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final QuoteRepository quoteRepository;
  QuoteCubit({this.quoteRepository}) : super(InitialState()) {
    getQuotes();
  }

  Future<void> getQuotes() async {
    try {
      emit(QuoteLoading());
      final quote = await quoteRepository.getQuotes();
      emit(QuoteLoaded(quote));
    } catch (e) {
      emit(ErrorLoading());
    }
  }
}
