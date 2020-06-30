import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() async {

  runApp(MaterialApp(
    home: Home(),
  ));

  //print("fala zeze");
  //WidgetsFlutterBinding.ensureInitialized();
  //runApp(App());

 /* FirebaseAuth auth = FirebaseAuth.instance;

  String email = "orlando.eduardo@gmail.com";
  String senha = "123456";

  //auth.signOut();
  auth.signInWithEmailAndPassword(
      email: email,
      password: senha
  ).then((value){
    print("Sucesso!! " + value.user.email +" "+ value.user.uid);
  }).catchError((error){
    print("erro " + error.toString());
    });

  FirebaseUser userAtual = await auth.currentUser();

  if(userAtual != null){
    print("Logado: " + userAtual.email);
  }else{
    print("Deslogado");
  }*/

  /*
  auth.createUserWithEmailAndPassword(
      email: email,
      password: senha
  ).then((firebaseUser){

    print("Sucesso!! " + firebaseUser.user.email + firebaseUser.user.uid);
  }).catchError(
      (error){
        print("erro " + error.toString());
      }
  );*/


  /*Firestore db = Firestore.instance;
  
  QuerySnapshot querySnapshot = await db.collection("users")
  //.where("nome", isEqualTo: "Jamilton")
  .where("nome", isGreaterThan: "a")
  .getDocuments();

  for(DocumentSnapshot item in querySnapshot.documents){
    var dados = item.data;
    print("Filtro nome: ${dados["nome"]} idade: ${dados["idade"]}");
  }*/

 /* db.collection("users").snapshots().listen(
      (event) {
        for(DocumentSnapshot item in event.documents){
          var  dados = item.data;
          print("dados users:" + dados.toString());
        }
    //print("dados:" + event.documents.toString());
      }
  );*/

 /* QuerySnapshot querySnapshot = await db.collection("users").getDocuments();

  //print("dados users:" + querySnapshot.documents.toString());

  for(DocumentSnapshot item in querySnapshot.documents){
    var  dados = item.data;
    print("dados users:" + dados.toString());
  }*/

 /* DocumentSnapshot snapshot = await db.collection("users").document("001").get();

  var dados = snapshot.data;
  print("Dados" + dados["nome"] + "Idade:" + dados["Idade"]);*/

 // db.collection("users").document("003").delete();

  /*db.collection("News").document("SCX0DJ02W7klzIqnzF9U")
  .setData({
    "title" : "Sampa tá quente alterado",
    "descrição" : "Fala zeze..."
  });*/

  /*DocumentReference ref = await db.collection("News")
  .add(
      {
        "title" : "Sampa tá quente",
        "descrição" : "Fala zeze..."
      }
  );

  print("Item:" + ref.documentID);*/

/*  db.collection("users")
  .document("002")
  .setData(
    {
      "nome" : "Jamilton Damasceno",
      "Idade" : "31"
    }
  );*/

/*  FirebaseDatabase.instance.reference().child("falazeze").set("bom dia cara");*/
}
/*
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(
      //  child: Text("fala zeze"),
      ),
    );
  }
}
*/

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File _imagem;
  String _status = "esperando upload";
  String _urlIMG;

  Future _recuperarIMG(bool daCam) async {
    File imagem;
    if(daCam){
      imagem = await ImagePicker.pickImage(source: ImageSource.camera);
    }else{
      imagem = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = imagem;
    });

  }

  Future _uploadIMG() async{

    //referencias
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference raiz = storage.ref();
    StorageReference arquivo = raiz.child("Fotos").child("foto1.jpg");

    //Fazer upload
    StorageUploadTask task = arquivo.putFile(_imagem);

    //Controle de progresso
    task.events.listen((StorageTaskEvent event) {

      if(event.type == StorageTaskEventType.progress){
        setState(() {
          _status = "Loading...";
        });
      }else if(event.type == StorageTaskEventType.success){
        setState(() {
          _status = "upload sucess";
        });
      }

    });

    //recuperar img
    task.onComplete.then((StorageTaskSnapshot snapshot){

      _recuperarUrl(snapshot);

    });
  }

  Future _recuperarUrl(StorageTaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    print("URL:" + url);
    setState(() {
        _urlIMG = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar imagem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(_status),
            RaisedButton(
                child: Text("Camera"),
                onPressed: (){
                  _recuperarIMG(true);
                }
            ),
            RaisedButton(
                child: Text("Galeria"),
                onPressed: (){
                  _recuperarIMG(false);
                }
            ),
            _imagem == null ? Container() : Image.file(_imagem),
            _imagem == null ? Container() : RaisedButton(
                child: Text("Upload"),
                onPressed: (){
                  _uploadIMG();
                }
            ),
            _urlIMG == null ? Container() : Image.network(_urlIMG)
          ],
        ),
      ),
    );
  }
}


