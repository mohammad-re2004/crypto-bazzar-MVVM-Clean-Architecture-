part of 'bloc_bloc.dart';

@immutable
sealed class CoinListBlocState {}

final class CoinListBlocInitialState extends CoinListBlocState {}

final class CoinListLoadingState extends CoinListBlocState {}

final class CoinListSuccessState extends CoinListBlocState {
  final List<CryptoEntity> cryptoList;
  CoinListSuccessState(this.cryptoList);
}

final class CoinListFailedState extends CoinListBlocState {
  final String errorMessage;
  CoinListFailedState(this.errorMessage);
}

// final class CoinListSearchingState extends CoinListBlocState {
// bool isSearching;
//   CoinListSearchingState(this.isSearching);
// }
//dd
