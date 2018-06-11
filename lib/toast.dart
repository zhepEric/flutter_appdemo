import 'package:flutter/services.dart';
// 下划线开头的变量只在当前package中可见。
const _toast = const MethodChannel('com.zhep.flutterapp2/toast');

const int _LENGTH_SHORT = 0;

const int _LENGTH_LONG = 1;

void show(String text, int duration) async {
  try {
    await _toast.invokeMethod("show", {'text': text, 'duration': duration});
  } on Exception catch (e) {
    print(e);
  } on Error catch (e) {
    print(e);
  }
}

void showShort(String text) {
  show(text, _LENGTH_SHORT);
}

void showLong(String text) {
  show(text, _LENGTH_LONG);
}

