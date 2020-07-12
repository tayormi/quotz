import 'package:dio/dio.dart';
import 'package:quotz/models/quote_model.dart';

class QuoteRepository {
  final Dio client;

  QuoteRepository(this.client);
  Future<Contents> getQuotes() async {
    try {
      final url = "https://quotes.rest/qod?language=en";

      final response = await client.get(url);
      QuoteModel quoteModel = QuoteModel.fromJson(response.data);
      return quoteModel.contents;
    } catch (e) {
      throw e;
    }
  }
}
