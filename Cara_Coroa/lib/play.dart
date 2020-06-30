
import 'package:flutter/material.dart';

class Play extends StatefulWidget {
  int num;
  Play({this.num});
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {

  List<Image> _moeda = [Image.asset('image/moeda_cara.png'), Image.asset('image/moeda_coroa.png')];

     
    

   void _voltar(){
      Navigator.pop(context);
    print("fala zeze");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      
      body: Container(
        child:Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             //Image(image: _moeda[1]),
             Padding(
              padding: EdgeInsets.fromLTRB(80, 80, 80, 10),
              child: Container(
              decoration: BoxDecoration(
                //shape: BoxShape.circle,
                //color: Colors.white,
                //border: Border.all()
              ),
                child: _moeda[widget.num],
            ),
             ),
            GestureDetector(
              child: Image.asset('image/botao_voltar.png'),
              onTap: _voltar,
            )
          ]
        )
      ),
    );
  }
}