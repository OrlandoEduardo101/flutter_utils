import 'package:flutter/material.dart';

class Empresa extends StatefulWidget {
  @override
  _EmpresaState createState() => _EmpresaState();
}

class _EmpresaState extends State<Empresa> {

    String ipsum = ('Mussum Ipsum, cacilds vidis litro abertis. Praesent malesuada urna nisi, quis volutpat erat hendrerit non. Nam vulputate dapibus. Mais vale um bebadis conhecidiss, que um alcoolatra anonimis. Quem manda na minha terra sou euzis! Suco de cevadiss deixa as pessoas mais interessantis. Interagi no mé, cursus quis, vehicula ac nisi. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis. Cevadis im ampola pa arma uma pindureta. Per aumento de cachacis, eu reclamis. Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent. Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent.Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent.Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent.Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent. Mussum Ipsum, cacilds vidis litro abertis. Praesent malesuada urna nisi, quis volutpat erat hendrerit non. Nam vulputate dapibus. Mais vale um bebadis conhecidiss, que um alcoolatra anonimis. Quem manda na minha terra sou euzis! Suco de cevadiss deixa as pessoas mais interessantis. Interagi no mé, cursus quis, vehicula ac nisi. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis. Cevadis im ampola pa arma uma pindureta. Per aumento de cachacis, eu reclamis. Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent. Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent.Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent.Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent.Casamentiss faiz malandris se pirulitá. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Viva Forevis aptent taciti sociosqu ad litora torquent.');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text("Empresa"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView( 
       child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('image/detalhe_empresa.png'),
                Text("Sobre a empresa",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ), 
                ]
              ),
              Text(ipsum,
              textAlign: TextAlign.justify,
              style: TextStyle(
                
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}