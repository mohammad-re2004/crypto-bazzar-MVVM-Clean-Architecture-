import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/dio_clinet.dart';
import 'package:flutter_application_1/data/datasource/coin_datasource.dart';
import 'package:flutter_application_1/domain/entities/crypto.dart';

class CoinRemoteDataSource extends CoinDataSource {
  Dio dioClinet;
  CoinRemoteDataSource(this.dioClinet);

  @override
  Future<List<Crypto>> getCoinList() async {
    // TODO: implement getCoinList
    var response = await dioClinet.get(
        'https://rest.coincap.io/v3/assets?apiKey=beb83fa911b6fcb30216f4735dcf470348639e72e02bc053737a52c420b61fe8');
    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();
    return cryptoList;
  }
}
