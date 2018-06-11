import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;//负责网络请求，从服务端获取数据
import 'dart:convert';//将服务端返回的字符串转换成 JSON 对象


/**
 * 需要注意的是：Dart 应用是单线程的，但是 Dart 支持代码运行在其它线程上，
 * 同时也支持使用 async/await 模式让代码异步执行，而不会阻塞 UI 线程
 */
class HttpNetDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HttpNetState();
  }

}

class HttpNetState extends State<HttpNetDemo>{
  //Dart 语言中，如果属性/方法名是以_开头，则表示这个属性/方法是类私有的。
  List _widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    if (_widgets.length == 0) {
      return true;
    }

    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: getBody());
  }

  ListView getListView() => new ListView.builder(

      itemCount: _widgets.length,
      itemBuilder: (BuildContext context, int position) {
        //为item添加分割线
        if(position.isOdd) return new Divider();

        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row ${_widgets[i]["title"]}"));
  }

  /**
   * loadData() 后面加上 async 关键字，用于告诉 Dart 这是一个异步方法，
   * 同时在 http.get 前使用 await 关键字，来阻塞后面的代码执行
   */
  loadData() async {

    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    //如果我们希望在状态改变时，触发界面重新渲染，则需要调用 setState() 方法来设置我们的属性值。
    setState(() {
      _widgets = JSON.decode(response.body);
    });
  }
}