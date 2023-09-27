import 'dart:convert';

import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:lj_web3_tron_sdk/lj_web3_tron_sdk.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lj_web3_tron_sdk/src/models/chain_model.dart';

class TokenService {

  // 获取助记词
  static String generateMnemonic() {
    String randomMnemonic = bip39.generateMnemonic();
    return randomMnemonic;
  }

  // 助记词转私钥Private Key
  static Web3Model getPrivateKey(String mnemonic, {String path = "", ChainTypes type = ChainTypes.eth}) {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);
    String pathStr = path.isNotEmpty ? path : LjPath().getPath(type);
    final child1 = root.derivePath(pathStr);
    String privateKey = bytesToHex(child1.privateKey!.toList());

    String tokenName = "";
    switch (type) {
      case ChainTypes.eth:
        tokenName = "ETH-0";
        break;
      case ChainTypes.bsc:
        tokenName = "BSC-0";
        break;
      case ChainTypes.trx:
        tokenName = "TRX-0";
        break;
      default:
    }
    return Web3Model()
      ..mnemonic = mnemonic
      ..privateKey = privateKey
      ..index = "0"
      ..name = tokenName
      ..path = pathStr;
  }
  // 仅支持EVM
  static Future<EthereumAddress> getPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    return private.address;
  }

  // 仅支持EVM
  static String getStrAddress(String privateKey) {
    try {
      final private = EthPrivateKey.fromHex(privateKey);
      EthereumAddress eaddress = private.address;
      return eaddress.hexEip55;
    } catch (e) {
      return "";
    }
  }// 是不是升级iOS17了

  // 仅支持TRON
  static String getPTronrivateKey(String mnemonic, {String path = ""}) {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);
    final child1 = root.derivePath(path.isNotEmpty ? path : LjPath().getPath(ChainTypes.trx));
    String privateKey = bytesToHex(child1.privateKey!.toList());
    return privateKey;
  }


  static Future<String> loadJsonFromAssets(String assetsPath) async {
    return await rootBundle.loadString(assetsPath);
  }


  // 获取链
  static Future<ChainModel> getChainModel(ChainTypes type) async {
    // 网络等原因未获取到主链币数据
    String jsonData = await TokenService.loadJsonFromAssets('packages/lj_web3_tron_sdk/assets/json/config.json');
    List dlist = jsonDecode(jsonData);
    ChainModel chain;
    Map res;
    switch (type) {
      case ChainTypes.eth:
        res = dlist.firstWhere((element) => element["name"] == "ETH",orElse: () => null,);
        res["icon"] = LjPath().imagePath("ETH");
        break;
      case ChainTypes.bsc:
        res = dlist.firstWhere ((element) => element["name"] == "BSC",orElse: () => null,);
        res["icon"] = LjPath().imagePath("BSC");
        break;
      case ChainTypes.trx:
        res = dlist.firstWhere((element) => element["name"] == "TRX",orElse: () => null,);
        res["icon"] = LjPath().imagePath("TRX");
        break;
      default:
        res = dlist.firstWhere((element) => element["name"] == "ETH",orElse: () => null,);
        res["icon"] = LjPath().imagePath("ETH");
    }
    chain = ChainModel.fromJson(res);
    for (var element in chain.symbols) {
      element.icon=LjPath().imagePath(element.symbol);
    }
    return chain;
  }


}