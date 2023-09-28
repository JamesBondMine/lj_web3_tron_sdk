import 'package:wallet/wallet.dart' as wallet;

class TronService {


  static String addressFromMnemonic(String mnemonic, String path) {
    final seed = wallet.mnemonicToSeed(mnemonic.split(" "), passphrase: "");
    final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
    final root = master.forPath(path);
    final privateKey = wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
    final publicKey = wallet.tron.createPublicKey(privateKey);
    final address = wallet.tron.createAddress(publicKey);
    return address;
  }
  

}