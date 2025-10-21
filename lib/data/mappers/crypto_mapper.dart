import 'package:flutter_application_1/data/dtos/crypto_dto.dart';
import 'package:flutter_application_1/domain/entities/crypto.dart';

class Crypto_mapper {
  String id;
  String name;
  String symbol;
  double changePercent24hr;
  double priceUsd;
  double marketCapUsd;
  int rank;

  Crypto_mapper(
    this.id,
    this.name,
    this.symbol,
    this.changePercent24hr,
    this.priceUsd,
    this.marketCapUsd,
    this.rank,
  );

  static Crypto toDomain(CryptoDTO cryptoDTO) {
    return Crypto(
      cryptoDTO.id,
      cryptoDTO.name,
      cryptoDTO.symbol,
      double.parse(cryptoDTO.changePercent24hr),
      double.parse(cryptoDTO.priceUsd),
      double.parse(cryptoDTO.marketCapUsd),
      int.parse(cryptoDTO.rank),
    );
  }
}
