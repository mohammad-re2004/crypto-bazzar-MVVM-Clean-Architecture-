import 'package:flutter_application_1/data/datasource/coin_datasource.dart';
import 'package:flutter_application_1/domain/entities/crypto.dart';
import 'package:flutter_application_1/domain/repositories/coin_list_repositorie.dart';

class CoinRemoteRepository extends CoinListRepository {
  CoinDataSource coinDataSource;
  CoinRemoteRepository(this.coinDataSource);
  @override
  Future<List<CryptoEntity>> getCoinList() {
    return coinDataSource.getCoinList();
  }
  
  @override
  Future<List<CryptoEntity>> searchCoinList(String query) {
   return coinDataSource.searchCoinList(query);
  }
}
