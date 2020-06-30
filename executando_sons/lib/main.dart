import 'package:executandosons/res.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'res.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  bool primeiraExec = true;
  double volume = 0.5;

  _executar() async {
    audioPlayer.setVolume(volume);
    if(primeiraExec){
      audioPlayer = await audioCache.play("${Res.musica}");
      primeiraExec = false;
    }else{
      audioPlayer.resume();
    }

    /*
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-11.mp3";
    int result = await audioPlayer.play(url);
    if(result == 1){
      print("Sucess");
    }else{
      print("Error");
    }*/
  }

  _pausar() async {

    int result = await audioPlayer.pause();

  }

  _parar() async {
    int result = await audioPlayer.stop();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Executando sons"),),
      body: Column(
        children: <Widget>[
          Slider(
              value: volume, 
              min: 0,
              max: 1,
              divisions: 100,
              onChanged: (novoVol){
                setState(() {
                  volume = novoVol;
                });
                audioPlayer.setVolume(novoVol);
              }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8),
              child: GestureDetector(
                child: Image.asset(Res.executar),
                onTap: (){
                  _executar();
                },
              ),
              ),
              Padding(padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset(Res.pausar),
                  onTap: (){
                    _pausar();
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset(Res.parar),
                  onTap: (){
                    _parar();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
