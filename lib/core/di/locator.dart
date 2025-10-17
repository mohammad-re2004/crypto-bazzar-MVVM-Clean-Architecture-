import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/dio_clinet.dart';
import 'package:flutter_application_1/data/datasource/coin_datasource.dart';
import 'package:flutter_application_1/data/datasource/coin_remote_datasource.dart';
import 'package:flutter_application_1/data/repositories/coin_repositorie.dart';
import 'package:flutter_application_1/domain/repositories/coin_list_repositorie.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> setupLocator() async {
  //network
  locator.registerSingleton<Dio>(DioClinet.instance);
  //data sources

  locator.registerFactory<CoinDataSource>(
      () => CoinRemoteDataSource(locator<Dio>()));

  //repositories

  locator.registerFactory<CoinListRepository>(
      () => CoinRemoteRepository(locator<CoinDataSource>()));
}
