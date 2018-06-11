import 'package:flutter/material.dart';
import './toast.dart';

class CupertinoStyle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CupertinoState();
  }

}

class CupertinoState extends State<CupertinoStyle> {
  /*
    GlobalKey：整个应用程序中唯一的键
    ScaffoldState：Scaffold框架的状态
    解释：_scaffoldKey的值是Scaffold框架状态的唯一键
   */
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showBottomSheetCallback = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      // 禁用按钮
      _showBottomSheetCallback = null;
    });
    /*
      currentState：获取具有此全局键的树中的控件状态
      showBottomSheet：显示持久性的质感设计底部面板
      解释：联系上文，_scaffoldKey是Scaffold框架状态的唯一键，因此代码大意为，
           在Scaffold框架中显示持久性的质感设计底部面板
     */
    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {
      final ThemeData themeData = Theme.of(context);
      return new Container(
          decoration: new BoxDecoration(
              border: new Border(
                  top: new BorderSide(color: themeData.disabledColor))
          ),
          child: new Padding(
              padding: const EdgeInsets.all(32.0),
              child: new Text(
                  '这是一个持久性的底部面板，向下拖动即可将其关闭',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: themeData.accentColor,
                      fontSize: 24.0
                  )
              )
          )
      );
    })
    /*
      closed：当此对象控制的元素不再可见时完成
      whenComplete：注册将在此未来完成时调用的函数
      解释：联系上文，closed控制的元素是新构建的质感设计底部面板，因此代码大意为，
           注册底部面板不再可见时调用的函数
     */
        .closed.whenComplete(() {
      // mounted：bool值，这个State对象当前是否在树中
      if (mounted) {
        setState(() {
          // 重新启用按钮
          _showBottomSheetCallback = _showBottomSheet;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Cupertino ios风格'),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('lksldklkfj'),
            new RaisedButton(
              onPressed: () {
                showShort('点击事件');
              },
              child: new Text('按钮',

              ),
//              color: Colors.black,
//              textColor: Colors.green,
            ),
            new MaterialButton(

                onPressed: () {


                }
            )
          ],
        )

    );
  }
}