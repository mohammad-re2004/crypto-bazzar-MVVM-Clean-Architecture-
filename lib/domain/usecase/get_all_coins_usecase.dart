import 'package:flutter_application_1/domain/entities/crypto.dart';
import 'package:flutter_application_1/domain/repositories/coin_list_repositorie.dart';

class AllCoinsListUseCase {
  final CoinListRepository repository;

  AllCoinsListUseCase(this.repository);

  Future<List<CryptoEntity>> call() async {
    return await repository.getCoinList();
  }
}
