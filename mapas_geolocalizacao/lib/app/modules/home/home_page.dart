import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  Completer<GoogleMapController> _controllerMaps = Completer();
  Set<Marker> _marcadores = {};

  _onMapCreated(GoogleMapController controller) {
    _controllerMaps.complete(controller);
  }

  _movimentarCamera() async {
    GoogleMapController gController = await _controllerMaps.future;
    gController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(-21, -45), zoom: 19, tilt: 30, bearing: 30)));
  }

  _carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};
    Marker marcadorShopping = Marker(
        markerId: MarkerId('Marcador-Shopping'), 
        position: LatLng(-23, -46),
        infoWindow: InfoWindow(
          title: 'Shopping'
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueMagenta
        ),
        onTap: () => debugPrint('Shopping')
        );
    
    Marker marcadorCartorio = Marker(
        markerId: MarkerId('Marcador-Cartorio'),
        position: LatLng(-23.5, -46.5),
        infoWindow: InfoWindow(
          title: 'Cartorio'
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure
        )
        );
    
    marcadoresLocal.add(marcadorShopping);
    marcadoresLocal.add(marcadorCartorio);
    setState(() {
      _marcadores = marcadoresLocal;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarMarcadores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(-23, -46),
            zoom: 15,
          ),
          onMapCreated: _onMapCreated,
          markers: _marcadores,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: _movimentarCamera,
        child: Icon(Icons.done),
      ),
    );
  }
}
