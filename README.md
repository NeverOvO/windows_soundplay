# windows_soundplay

基于WIN32实现的WIndows本地声音播放组建

     win32: ^2.0.5

# 代码的简单解析记录

1: win打包后的基于项目总目录的默认资源路径

    String _thisRoute = r'\data\flutter_assets\assets\';

2:这里是去获取本项目打包后 在系统中的首路径

    Directory dir=new Directory.fromUri(Uri(path: ""));
    String tt = '';
    await dir.absolute.resolveSymbolicLinks().then((value){
      tt= value;
    });
    
3:进行播放，采用拼接成为绝对路径的方式避免WIN32 API无法读取文件

    try{
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
    
4:  这里2个参数可改 ：SND_FILENAME |  SND_ASYNC 
  
  SND_ASYNC ： 非阻塞式播放音频
  SND_FILENAME ： 视为文件名播放
  
  

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
