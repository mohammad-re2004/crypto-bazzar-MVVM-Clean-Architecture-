import 'package:flutter_application_1/domain/entities/crypto.dart';

abstract class CoinDataSource {
  Future<List<Crypto>> getCoinList();
}
