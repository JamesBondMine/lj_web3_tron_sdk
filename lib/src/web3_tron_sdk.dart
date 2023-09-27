import 'package:lj_web3_tron_sdk/src/models/chain_model.dart';
import 'package:lj_web3_tron_sdk/src/path.dart';
import 'package:web3dart/web3dart.dart';
import './token_service.dart';
import 'package:flutter/material.dart';

class Web3TronSDK {
  // 获取助记词
  static String generateMnemonic() {
    return TokenService.generateMnemonic();
  }

  // 助记词转私钥Private Key
  static String getPrivateKey(String mnemonic, {String path = "", ChainTypes type = ChainTypes.eth}) {
    return TokenService.getPrivateKey(mnemonic, path: path, type: type).privateKey;
  }

  // 仅支持EVM
  static Future<EthereumAddress> getPublicAddress(String privateKey) {
    return TokenService.getPublicAddress(privateKey);
  }

  // 仅支持EVM
  static Future<String> getStrAddress(String privateKey) async {
    return TokenService.getStrAddress(privateKey);
  }

  // 仅支持TRON
  static String getPTronrivateKey(String mnemonic, {String path = ""}) {
    return TokenService.getPTronrivateKey(mnemonic, path: path);
  }

  // 获取Token
  static Web3Model getToken(String mnemonic, {ChainTypes type = ChainTypes.eth}) {
    Web3Model pkyModel = TokenService.getPrivateKey(mnemonic,type: type);
    String address = TokenService.getStrAddress(pkyModel.privateKey);
    return pkyModel..address = address;
  }

  // 获取链
  static Future<ChainModel> getChainModel(ChainTypes type) async {
    return TokenService.getChainModel(type);
  }

  static Widget chainView() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.green,
      child: Image.asset("packages/lj_web3_tron_sdk/assets/images/BNB.png"),
    );
  }
}
