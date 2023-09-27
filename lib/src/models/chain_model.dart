

class ChainModel {
  ChainModel();

  String name = "";
  String symbol = "";
  String icon = "";

  List<SymbolModel> symbols = [];

  ChainModel.fromJson(dynamic jsonStr) {
      name = jsonStr["name"] ?? "";
      symbol = jsonStr["symbol"] ?? "";
      icon = jsonStr["icon"] ?? "";

      List symbolsres = jsonStr["symbolVOList"];
      symbols = symbolsres.map((e) => SymbolModel.fromJson(e)).toList();
  }
}



class SymbolModel {
  SymbolModel();

  String name = "";
  String symbol = "";
  String icon = "";
  String contractAddress = "";
  

  SymbolModel.fromJson(dynamic jsonStr) {
      name = jsonStr["name"] ?? "";
      symbol = jsonStr["symbol"] ?? "";
      icon = jsonStr["icon"] ?? "";
      contractAddress = jsonStr["contractAddress"] ?? "";
  }
  
}


class Web3Model {
  // 助记词
  String mnemonic = "";
  //私钥
  String privateKey = "";
  // 地址
  String address = "";
  // balance
  String balance = "";
  // name
  String name = "";
  // path
  String path = "";
  // index
  String index = "";

}