enum ChainTypes{
  eth,
  bsc,
  trx
}

class LjPath {

  String getPath(ChainTypes type, {int index = 0}){
    String pathStr = "";
    switch (type) {
      case ChainTypes.eth:
        pathStr = chainPath(index)["ETH"];
        break;
      case ChainTypes.trx:
        pathStr = chainPath(index)["TRX"];
        break;
      case ChainTypes.bsc:
        pathStr = chainPath(index)["ETH"];
        break;
      default:
    }
    return pathStr;
  }


  // 不同链对应的path
  Map chainPath(int index) {
    return {
      "TRX": "m/44'/195'/0'/0/$index",
      "ETH": "m/44'/60'/0'/0/$index",
    };
  }


  String imagePath(String symbol){
    return "packages/lj_web3_tron_sdk/assets/images/$symbol.png";
  }
  
}