

import 'package:flutter/material.dart';

class ClassName {
  String str = "";
  int age = 0;
  Map value = {};
  List list = [];

  // adds(){
  //   list.add("1");
  // }
  
}



class DataBase<T> {
  logSatrt(List<T> v){
    ClassName model = v.first as ClassName;
    print("${model.str} 今年 ${model.age}岁了");
  }
  
}


class OperateClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OperateClassState();
  }

}

class OperateClassState extends State<OperateClass> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        TextButton(onPressed: (){

          var data = DataBase<ClassName>();

          ClassName nameModel = ClassName();
          nameModel.str = "tom";
          nameModel.age = 12;
          nameModel.value = {"like": "drink"};
          data.logSatrt([nameModel]);

          

        }, child: Text("click"))
      ],),
    );
  }
  
}