import 'package:flutter/material.dart';
import 'package:lj_web3_tron_sdk/lj_web3_tron_sdk.dart';
import 'package:lj_web3_tron_sdk/src/models/chain_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '钱包创建'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // 钱包
  Web3Model token = Web3Model();

  // 代币
  ChainModel chain = ChainModel();

  @override
  void initState() {
    super.initState();
    token.mnemonic = Web3TronSDK.generateMnemonic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            iconView(),
            mnemonicView(),
            nameView(),
            pathView(),
            privateKeyView(),
            addressView(),
            Expanded(child: _coinView()),
            // const Spacer(),
            _botomView()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget _coinView(){
    if (chain.icon.isEmpty) return Container(); 
    return ListView.builder(itemBuilder: ((context, index) {
      return ListTile(
        leading: Image.asset(chain.symbols[index].icon, width: 30,height: 30,),
        title: Text(chain.symbols[index].name),
        subtitle: Text(chain.symbols[index].contractAddress),
        );
      
    }),
    itemCount: chain.symbols.length,);
  }

  Widget iconView(){
    if (chain.icon.isEmpty) return Container();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(width: 80,child: Text("logo:"),),
        Image.asset(chain.icon)
      ],),
    );
  }

  Widget privateKeyView(){
    if (token.privateKey.isEmpty) return Container();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(width: 80,child: Text("私钥:"),),
        Expanded(child: Text(token.privateKey, maxLines: 2,style: const TextStyle(fontWeight: FontWeight.w600),))
      ],),
    );
  }

  Widget pathView(){
    if (token.path.isEmpty) return Container();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(width: 80,child: Text("path:"),),
        Expanded(child: Text(token.path, maxLines: 2,style: const TextStyle(fontWeight: FontWeight.w600),))
      ],),
    );
  }

  Widget addressView(){
    if (token.address.isEmpty) return Container();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(width: 80,child: Text("地址:"),),
        Expanded(child: Text(token.address, maxLines: 2,style: const TextStyle(fontWeight: FontWeight.w600),))
      ],),
    );
  }

  Widget nameView(){
    if (token.name.isEmpty) return Container();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(width: 80,child: Text("名称:"),),
        Expanded(child: Text(token.name, maxLines: 2,style: const TextStyle(fontWeight: FontWeight.w600),))
      ],),
    );
  }

  Widget mnemonicView(){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(width: 80,child: Text("助记词:"),),
        Expanded(child: Text(token.mnemonic, maxLines: 2,style: const TextStyle(fontWeight: FontWeight.w600),))
      ],),
    );
  }

  Widget _botomView() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () async {
                token =
                    Web3TronSDK.getToken(token.mnemonic, type: ChainTypes.eth);
                chain = await Web3TronSDK.getChainModel(ChainTypes.eth);
                setState(() {});
              },
              child: Container(
                width: 100,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.purple.withAlpha(200),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "ETH",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          TextButton(
              onPressed: () async {
                token =
                    Web3TronSDK.getToken(token.mnemonic, type: ChainTypes.bsc);
                chain = await Web3TronSDK.getChainModel(ChainTypes.bsc);
                setState(() {});
              },
              child: Container(
                width: 100,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.purple.withAlpha(200),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "BSC",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          TextButton(
              onPressed: () async {
                token =
                    Web3TronSDK.getToken(token.mnemonic, type: ChainTypes.trx);
                chain = await Web3TronSDK.getChainModel(ChainTypes.trx);
                setState(() {});
              },
              child: Container(
                width: 100,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.purple.withAlpha(200),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "TRX",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
