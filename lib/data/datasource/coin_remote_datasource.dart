import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/datasource/coin_datasource.dart';
import 'package:flutter_application_1/data/dtos/crypto_dto.dart';
import 'package:flutter_application_1/data/mappers/crypto_mapper.dart';
import 'package:flutter_application_1/domain/entities/crypto.dart';

class CoinRemoteDataSource extends CoinDataSource {
  Dio dioClinet;
  CoinRemoteDataSource(this.dioClinet);

  @override
  Future<List<Crypto>> getCoinList() async {
    // TODO: implement getCoinList
    var response = await dioClinet.get(
        'https://rest.coincap.io/v3/assets?apiKey=beb83fa911b6fcb30216f4735dcf470348639e72e02bc053737a52c420b61fe8');
    List<CryptoDTO> cryptoList = response.data['data']
        .map<CryptoDTO>((jsonMapObject) => CryptoDTO.fromMapJson(jsonMapObject))
        .toList();

    return cryptoList.map((toElement) => Crypto_mapper.toDomain(toElement)).toList();    
  
  }
}
