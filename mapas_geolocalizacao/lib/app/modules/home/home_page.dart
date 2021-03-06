import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
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
  Set<Polygon> _polygons = {};
  Set<Polyline> _polylines = {};
  CameraPosition cameraPosition = CameraPosition(
        target: LatLng(-23.46, -46.56),
        zoom: 15,
      );

  _onMapCreated(GoogleMapController controller) {
    _controllerMaps.complete(controller);
  }

  _movimentarCamera() async {
    GoogleMapController gController = await _controllerMaps.future;
    gController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  _carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};
    Marker marcadorShopping = Marker(
        markerId: MarkerId('Marcador-Shopping'),
        position: LatLng(-23, -46),
        infoWindow: InfoWindow(title: 'Shopping'),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        onTap: () => debugPrint('Shopping'));

    Marker marcadorCartorio = Marker(
        markerId: MarkerId('Marcador-Cartorio'),
        position: LatLng(-23.5, -46.5),
        infoWindow: InfoWindow(title: 'Cartorio'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));

    marcadoresLocal.add(marcadorShopping);
    marcadoresLocal.add(marcadorCartorio);
    setState(() {
      _marcadores = marcadoresLocal;
    });

    Set<Polygon> listaPolygons = {};
    Polygon polygon = Polygon(
      polygonId: PolygonId('polygon1'),
      fillColor: Colors.green,
      strokeColor: Colors.red,
      strokeWidth: 10,
      consumeTapEvents: true,
      zIndex: 0,
      points: [
        LatLng(-23.46, -46.56),
        LatLng(-23.56, -46.56),
        LatLng(-23.66, -46.66),
      ],
      onTap: () => debugPrint('fala zeze'),
    );
    listaPolygons.add(polygon);
    Polygon polygon2 = Polygon(
      polygonId: PolygonId('polygon1'),
      fillColor: Colors.green,
      strokeColor: Colors.red,
      strokeWidth: 10,
      consumeTapEvents: true,
      zIndex: 1,
      points: [
        LatLng(-15.46, -46.56),
        LatLng(-28.56, -46.56),
        LatLng(-35.66, -46.66),
      ],
      onTap: () => debugPrint('fala zeze'),
    );
    listaPolygons.add(polygon2);
    setState(() {
      _polygons = listaPolygons;
    });

    Set<Polyline> listaPolylines = {};
    Polyline polilyne = Polyline(
        polylineId: PolylineId('polyline'),
        color: Colors.amber,
        width: 20,
        points: [
          LatLng(-23.46, -46.56),
          LatLng(-23.56, -46.56),
          LatLng(-23.66, -46.66),
        ]);
    listaPolylines.add(polilyne);
    setState(() {
      _polylines = listaPolylines;
    });
  }

  _recuperarLocalizacaoAtual() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print('LOCALIZAÇÂO:' + position.toString());

    setState(() {
      cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15,
      );
      _movimentarCamera();
    });
  }

  _adicionarListener(){
   // var locator = Geolocator();
    Geolocator.getPositionStream(
      distanceFilter: 10,
      desiredAccuracy: LocationAccuracy.high,
      forceAndroidLocationManager: true,

    ).listen((event) {
      print('LOCALIZAÇÂO:' + event.toString());
      setState(() {
        cameraPosition = CameraPosition(
          target: LatLng(event.latitude, event.longitude),
          zoom: 15,
        );
        _movimentarCamera();
      });
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _carregarMarcadores();
    //_recuperarLocalizacaoAtual();
    _adicionarListener();
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
          initialCameraPosition: cameraPosition,
          onMapCreated: _onMapCreated,
          markers: _marcadores,
          polygons: _polygons,
          polylines: _polylines,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
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
