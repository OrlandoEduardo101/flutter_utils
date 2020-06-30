import 'package:flutter/material.dart';
import 'package:camera/camera.dart';



class Camera extends StatefulWidget {
  List<CameraDescription> cameras;
  Camera(this.cameras);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  CameraController _camController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      //inicializar a variavel controller setando a camera a ser utilizada e a resoluão
    _camController = CameraController(widget.cameras[0], ResolutionPreset.medium);
    _camController.initialize().then((_){   //teste se a camera foi montada
        if(!mounted){
          print("camera não inicializou!");
          return;
        }
        
        setState((){});

      });

  }

  @override
  void dispose() {
    _camController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    if(!_camController.value.isInitialized){  //teste se a camera está ativa

      return Container(

        color: Colors.white,

        child:Center(
          child: Text("Câmera falhou"), //retorno de erro
        ),

      );
    }

    return Center(
      child: AspectRatio(

      aspectRatio: _camController.value.aspectRatio,
      child: CameraPreview(_camController),         //retornando imagens da camera

      ),
    );
    
  
  }
}