import './scaffold_tabbar.dart';
import './bottomtab.dart';
import './cupertinostyle.dart';
import './addremoveview.dart';
import './paintview.dart';
import './intenttest.dart';
import './httpnettest.dart';
import './cameratest.dart';
import './sharedpreference.dart';
import './filereadwrite.dart';


final PageList = [
  {
    'name':'ScaffoldTabbar',
    'widget': new ScaffoldTabbar()
  },
  {
    'name':'BottomNavigationBar',
    'widget': new BottomNavigationBarDemo()
  },
  {
    'name':'Display Image Demo',
    'widget': new CupertinoStyle()
  },
  {
    'name':'AddRemoveView',
    'widget': new AddRemoveView()
  },
  {
    'name':'Paint',
    'widget': new PaintDemo()
  },
  {
    'name':'IntentTest',
    'widget': new IntentTest()
  },
  {
    'name':'HttpNetTest',
    'widget': new HttpNetDemo()
  },
  {
    'name':'CameraDemo',
    'widget': new CameraExampleHome()
  },

  {
    'name':'SPDemo',
    'widget': new SPDemo()
  },
  {
    'name':'FileDemo',
    'widget': new FileDemo()
  },
];