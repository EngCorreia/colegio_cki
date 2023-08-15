import 'dart:developer';

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/usecases/location/read_delivery/direction_model/directions_model.dart';
import '../../../domain/usecases/location/read_delivery/direction_repository/direction_repository.dart';

class CkiLocation extends StatefulWidget {
  const CkiLocation({Key? key}) : super(key: key);

  @override
  State<CkiLocation> createState() => _CkiLocationState();
}

class _CkiLocationState extends State<CkiLocation> {
  Marker? _origin;
  Marker? _destination;
  Directions? _info;
  LatLng sourceLocation = LatLng(-8.916712,13.1991728);
  LatLng redLocation = LatLng(-8.916712,13.1991728);
  GoogleMapController? controllerMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Localização",style: TextStyle(fontSize: 16,fontFamily: SettingsCki.segoeEui),),
        actions: [

          _origin != null ? TextButton(onPressed: ()=> controllerMap?.animateCamera(
              CameraUpdate.newCameraPosition(
                  CameraPosition(target: _origin!.position,zoom: 14.5,
                      tilt: 50.0)
              )
          ),
              child: Text("Origem",style: TextStyle(
                  fontSize: 16,
                  fontFamily: SettingsCki.segoeEui
              ))):Container(),

          _destination != null ? TextButton(onPressed: ()=> controllerMap?.animateCamera(
              CameraUpdate.newCameraPosition(
                  CameraPosition(target: _destination!.position,zoom: 14.5,
                      tilt: 50.0)
              )
          ),
              child: Text("Destino",style: TextStyle(
                fontSize: 16,
                fontFamily: SettingsCki.segoeEui
              ),)):Container()
        ],
      ),

      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Observer(
            builder: (_) => FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: ()=> controllerMap?.animateCamera(
                  _info != null? CameraUpdate.newLatLngBounds(_info!.bounds,100.0):
                  CameraUpdate.newCameraPosition(CameraPosition(
                      target: LatLng(sourceLocation.latitude, redLocation.longitude),
                      zoom: 11.5))
              ),
              child: const Icon(Icons.location_on_outlined),

            ),
          ),
        ),
      ),
      body:  Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: CameraPosition(
                target: LatLng(sourceLocation.latitude, redLocation.longitude),
                zoom: 11.5),
            onMapCreated: (mapController){
              controllerMap = mapController;
            },

            polylines: {
              if(_info != null) Polyline(
                polylineId: PolylineId("overview_polyline"),
                points: _info!.polylinePoints.map((e) =>
                    LatLng(e.latitude, e.longitude)).toList(),
                color: Colors.purpleAccent,
                width: 4,
              ),
            },
            markers: {
              if(_origin != null) _origin!,
              if(_destination != null) _destination!,

            },
            onLongPress: _addMarker,
          ),

          Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0
                ),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const[
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0
                      )
                    ]
                ),
                child: Text("${_info?.totalDistance??"vazio"} ${_info?.totalDuration?? "vazio"}"),
              )),
        ],
      ),
    );
  }

  void _addMarker(LatLng pos) async {

    if(_origin == null || (_origin != null && _destination != null)){
      setState(() {
        log("************ origin $_origin");
        _origin = Marker(
            markerId: const MarkerId("origin1"),
            infoWindow: const InfoWindow(title: "Origem"),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            position: pos
        );
        _destination = null;
        _info = null;

      });

    }else{
      setState(() {
        log("************ origin $_destination");
        _destination = Marker(
            markerId: const MarkerId("destination"),
            infoWindow: const InfoWindow(title: "destination"),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos
        );
      });

      final directions = await DirectionRepository().getDirections(origin: _origin!.position, destinations: pos);
      setState(() {
        _info = directions;
      });
    }
  }
}
