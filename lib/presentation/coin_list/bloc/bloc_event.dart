part of 'bloc_bloc.dart';

@immutable
sealed class BlocEvent {}

 class LoadInitialCoinListEvent extends BlocEvent {}

 class RefreshCoinDataEvent extends BlocEvent {}


 class SearchCoinDataEvent extends BlocEvent {
  final String query;

  SearchCoinDataEvent(this.query);
}
