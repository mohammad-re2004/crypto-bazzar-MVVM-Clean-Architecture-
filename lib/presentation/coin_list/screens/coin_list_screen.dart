import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/constants.dart';
import 'package:flutter_application_1/core/di/locator.dart';
import 'package:flutter_application_1/domain/entities/crypto.dart';
import 'package:flutter_application_1/domain/repositories/coin_list_repositorie.dart';
import 'package:flutter_application_1/domain/usecase/get_all_coins_usecase.dart';
import 'package:flutter_application_1/domain/usecase/searchCoin_List_usecase.dart';
import 'package:flutter_application_1/presentation/coin_list/bloc/bloc_bloc.dart';
import 'package:flutter_application_1/presentation/coin_list/widgets/coin_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoinListScreen extends StatefulWidget {
  CoinListScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CoinListScreenState createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
  bool isSearchLoadingVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = CoinListBloc(locator<AllCoinsListUseCase>(),locator<SearchCoinListUseCase>());
        bloc.add(LoadInitialCoinListEvent());
        return bloc;
      },
      child: BlocConsumer<CoinListBloc, CoinListBlocState>(
        listener: (context, state) {
          if (state is CoinListFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<CoinListBloc, CoinListBlocState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: blackColor,
                appBar: AppBar(
                  title: Text(
                    "کیریپتو بازار",
                    style: TextStyle(fontFamily: "mr"),
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                ),
                body: SafeArea(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          onChanged: (value) {
                            context
                                .read<CoinListBloc>()
                                .add(SearchCoinDataEvent(value));
                          },
                          decoration: InputDecoration(
                            hintText: "اسم رمزارز سرچ کن",
                            hintStyle: TextStyle(
                              fontFamily: "mr",
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: greenColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        backgroundColor: greenColor,
                        color: blackColor,
                        onRefresh: () async {
                          context
                              .read<CoinListBloc>()
                              .add(RefreshCoinDataEvent());
                        },
                        child: _bulidByState(state),
                      ),
                    ),
                  ]),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _bulidByState(CoinListBlocState state) {
    switch (state) {
      case CoinListBlocInitialState():
        return Center(
          child: Text(
            "Welcome to the Crypto Market",
            style: TextStyle(
              fontFamily: "mr",
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        );
      case CoinListLoadingState():
        return SpinKitWave(
          color: Colors.white,
          size: 40.0,
        );
      case CoinListSuccessState():
        return _bulidSusscssListWidget(cryptoList: (state).cryptoList);
      case CoinListFailedState():
        return Center(
          child: Text((state).errorMessage),
        );
    }
  }
}

class _bulidSusscssListWidget extends StatelessWidget {
  const _bulidSusscssListWidget({
    required this.cryptoList,
  });

  final List<CryptoEntity>? cryptoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cryptoList!.length,
      itemBuilder: (context, index) {
        return coinListItem(cryptoList![index]);
      },
    );
  }
}
