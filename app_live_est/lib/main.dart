import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'login.dart';

//classe principal de todo o app, algumas definições gerais são feitas aqui

List<CameraDescription> cameras; //lista de cameras

Future<Null> main() async {

  WidgetsFlutterBinding.ensureInitialized();  
  cameras = await availableCameras(); //recebendo lista de cameras disponiveis
  runApp(MaterialApp(
  debugShowCheckedModeBanner: false, //desativando banner de debug
  home: Login(cameras), //intanciando o login e passando a lista de cameras

));}



