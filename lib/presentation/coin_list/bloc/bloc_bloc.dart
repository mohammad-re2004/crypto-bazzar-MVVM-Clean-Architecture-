import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/entities/crypto.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class CoinListBloc extends Bloc<BlocEvent, CoinListBlocState> {
  CoinListBloc() : super(CoinListBlocInitialState()) {
    on<LoadInitialCoinListEvent>((event, emit) async {
      // TODO: implement event handler

      emit(CoinListLoadingState());

      var response = await Dio().get(
          'https://rest.coincap.io/v3/assets?apiKey=beb83fa911b6fcb30216f4735dcf470348639e72e02bc053737a52c420b61fe8');
      List<Crypto> cryptoList = response.data['data']
          .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
          .toList();

      if (response.statusCode == 200) {
        emit(CoinListSuccessState(cryptoList));
      } else {
        emit(CoinListFailedState('field to fetch data'));
      }
    });

    on<RefreshCoinDataEvent>((event, emit) async {
      // TODO: implement event handler

      emit(CoinListLoadingState());

      var response = await Dio().get(
          'https://rest.coincap.io/v3/assets?apiKey=beb83fa911b6fcb30216f4735dcf470348639e72e02bc053737a52c420b61fe8');
      List<Crypto> cryptoList = response.data['data']
          .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
          .toList();

      if (response.statusCode == 200) {
        emit(CoinListSuccessState(cryptoList));
      } else {
        emit(CoinListFailedState('field to fetch data'));
      }
    });

    on<SearchCoinDataEvent>((event, emit) async {
      // TODO: implement event handler

      emit(CoinListLoadingState());

      List<Crypto> cryptoResultList = [];
      //   if (event.query.isEmpty) {
      //     emit(CoinListSearchingState(false));
      // }

      var response = await Dio().get(
          'https://rest.coincap.io/v3/assets?apiKey=beb83fa911b6fcb30216f4735dcf470348639e72e02bc053737a52c420b61fe8');
      List<Crypto> cryptoList = response.data['data']
          .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
          .toList();

      cryptoResultList = cryptoList.where((element) {
        return element.name.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      if (response.statusCode == 200) {
        emit(CoinListSuccessState(cryptoResultList));
      } else {
        emit(CoinListFailedState('field to fetch data'));
      }
    });

////////
    // Future<void> filterLits(String enteredKeyboard) async {
    //   List<Crypto> cryptoResualtList = [];
    //   // if (enteredKeyboard.isEmpty) {
    //   //   var result = await getData();
    //   //   setState(() {
    //   //     cryptoList = result;
    //   //   });
    //   return;
    // }
    // cryptoResualtList = cryptoList!.where((element) {
    //   return element.name.toLowerCase().contains(enteredKeyboard.toLowerCase());
    // }).toList();

    // setState(() {
    //   cryptoList = cryptoResualtList;
    // });
    //}
  }
}
