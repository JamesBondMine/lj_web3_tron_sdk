# example

lj_web3_tron_sdk support ETH、BSC、TRX chains

## Getting Started

```dart
lj_web3_tron_sdk: ^1.0.1
```

## Usage

引入方式

```dart
import 'package:lj_web3_tron_sdk/lj_web3_tron_sdk.dart';
import 'package:lj_web3_tron_sdk/src/models/chain_model.dart';
```


web3_dapp_browser 具体实现


声明

```dart
// 钱包
  Web3Model token = Web3Model();

  // 代币
  ChainModel chain = ChainModel();

```


创建助记词

```dart

Web3TronSDK.generateMnemonic();

```

创建区块链钱包

```dart

Web3TronSDK.getToken(token.mnemonic, type: ChainTypes.eth);

```


获取对应链的对象

```dart

await Web3TronSDK.getChainModel(ChainTypes.eth);

```



## Additional information

初始效果


<table>
<tr>
<td valign="center"><img src="https://github.com/JamesBondMine/lj_web3_tron_sdk/blob/main/lib/assets/preview/1.png?raw=true"> 
</td>
<td></td>
</tr>
</table>

创建效果

<table>
<tr>
<td valign="center"><img src="https://github.com/JamesBondMine/lj_web3_tron_sdk/blob/main/lib/assets/preview/2.png?raw=true"> 
</td>
<td valign="center"><img src="https://github.com/JamesBondMine/lj_web3_tron_sdk/blob/main/lib/assets/preview/3.png?raw=true"> 
</td>
</tr>
<tr>
<td valign="center"><img src="https://github.com/JamesBondMine/lj_web3_tron_sdk/blob/main/lib/assets/preview/4.png?raw=true"> 
</td>
</tr>
</table>



