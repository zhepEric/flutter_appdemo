import 'package:flutter/material.dart';

class AddRemoveView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return AddRemvoewState();
  }

}

//显示动画
class AddRemvoewState extends State<AddRemoveView> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('animation'),
      ),
      body: new Center(
          child: new Container(
              child: new FadeTransition(
                  opacity: curve,
                  child: new FlutterLogo(
                    size: 100.0,
                  )))),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Fade',
        child: new Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}
//class AddRemovewState extends State<AddRemoveView>{
//// Default value for toggle
//  bool toggle = true;
//  void _toggle() {
//    setState(() {
//      toggle = !toggle;
//    });
//  }
//
//  _getToggleChild() {
//    if (toggle) {
//      return new Text('Toggle One');
//    } else {
//      return new MaterialButton(onPressed: () {}, child: new Text('Toggle Two'));
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Sample App"),
//      ),
//      body: new Center(
//        child: _getToggleChild(),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _toggle,
//        tooltip: 'Update Text',
//        child: new Icon(Icons.update),
//      ),
//    );
//  }
//
//}

