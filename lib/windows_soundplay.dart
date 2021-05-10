library windows_soundplay;

import 'dart:core';
import 'dart:io';

import 'package:win32/win32.dart';

Future<String> windows_soundplay({String route = '',String fileName = ''}) async{
  String _thisRoute = r'\data\flutter_assets\assets\';//win打包后的基于项目总目录的默认资源路径
  if(route != ''){
    _thisRoute = route;
  }
  Directory dir=new Directory.fromUri(Uri(path: ""));//这里是去获取本项目打包后 在系统中的首路径
  String tt = '';
  await dir.absolute.resolveSymbolicLinks().then((value){
    tt= value;
  });

  try{
    //采用拼接成为绝对路径的方式避免WIN32 API无法读取文件
    final result = PlaySound(TEXT(tt.toString() + _thisRoute + fileName), NULL, SND_FILENAME |  SND_ASYNC);
    if (result != TRUE) {
      print('Sound playback failed.');
      return 'Sound playback failed.';
    }else{
      return 'Sound playback success.';
    }
  }catch(e){
    return 'Sound playback failed.';
  }
}