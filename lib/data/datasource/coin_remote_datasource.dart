import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/datasource/coin_datasource.dart';
import 'package:flutter_application_1/data/dtos/crypto_dto.dart';
import 'package:flutter_application_1/data/mappers/crypto_mapper.dart';
import 'package:flutter_application_1/domain/entities/crypto.dart';

class CoinRemoteDataSource extends CoinDataSource {
  final Dio dioClinet;
  CoinRemoteDataSource({required this.dioClinet});

  @override
  Future<List<CryptoEntity>> getCoinList() async {
    // TODO: implement getCoinList
    try {
      var response = await dioClinet.get(
          'https://rest.coincap.io/v3/assets?apiKey=beb83fa911b6fcb30216f4735dcf470348639e72e02bc053737a52c420b61fe8');
      List<CryptoDTO> cryptoDtoList = response.data['data']
          .map<CryptoDTO>(
              (jsonMapObject) => CryptoDTO.fromMapJson(jsonMapObject))
          .toList();
      return Crypto_mapper.toDomainList(cryptoDtoList);
    } catch (DioError) {
      throw Exception('Failed to load coins list');
    }
  }

  @override
  Future<List<CryptoEntity>> searchCoinList(String query) async {
    try {
      var response = await dioClinet.get(
          'https://rest.coincap.io/v3/assets?search=$query&apiKey=beb83fa911b6fcb30216f4735dcf470348639e72e02bc053737a52c420b61fe8');
      List<CryptoDTO> cryptoDtoList = response.data['data']
          .map<CryptoDTO>(
              (jsonMapObject) => CryptoDTO.fromMapJson(jsonMapObject))
          .toList();
      List<CryptoDTO> filteredList = cryptoDtoList
          .where((crypto) =>
              crypto.name.toLowerCase().contains(query.toLowerCase()) ||
              crypto.symbol.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return Crypto_mapper.toDomainList(filteredList);
    } catch (DioError) {
      throw Exception('Failed to load coins list');
    }
  }
}
