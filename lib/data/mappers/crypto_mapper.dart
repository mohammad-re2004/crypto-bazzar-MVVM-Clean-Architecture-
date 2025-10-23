import 'package:flutter_application_1/data/dtos/crypto_dto.dart';
import 'package:flutter_application_1/domain/entities/crypto.dart';

class Crypto_mapper {
  static CryptoEntity toDomain(CryptoDTO cryptoDTO) {
    return CryptoEntity(
      cryptoDTO.id,
      cryptoDTO.name,
      cryptoDTO.symbol,
      double.parse(cryptoDTO.changePercent24hr),
      double.parse(cryptoDTO.priceUsd),
      double.parse(cryptoDTO.marketCapUsd),
      int.parse(cryptoDTO.rank),
    );
  }

  static List<CryptoEntity> toDomainList(List<CryptoDTO> cryptoDTOList) {
    return cryptoDTOList.map((cryptoDTO) => toDomain(cryptoDTO)).toList();
  }
}
