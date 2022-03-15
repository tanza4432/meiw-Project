import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/component/custom_app_bar.dart';
import 'package:hospitel/component/information.dart';
import 'package:hospitel/component/loading.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Position userLocation;
  GoogleMapController mapController;

  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  Future<void> getPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    if (permission == PermissionStatus.denied) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

    var geolocator = Geolocator();

    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        _getLocation();
        break;
      case GeolocationStatus.disabled:
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertMessage("แจ้งเตือน", "ตำแหน่งถูกปิดอยู่", null),
        // );
        Navigator.pop(context);
        break;
      case GeolocationStatus.restricted:
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertMessage("แจ้งเตือน", "การอนุญาติถูกจำกัด", null),
        // );
        Navigator.pop(context);
        break;
      case GeolocationStatus.unknown:
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertMessage("แจ้งเตือน", "ไม่พบตำแหน่ง", null),
        // );
        Navigator.pop(context);
        break;
      case GeolocationStatus.granted:
        _getLocation();
        break;
    }
  }

  Future<Position> _getLocation() async {
    try {
      userLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      userLocation = null;
    }
    return userLocation;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
                  'https://www.google.co.th/maps/search/${snapshot.data.latitude},+${snapshot.data.longitude}/@${snapshot.data.latitude},${snapshot.data.longitude},18z?hl=th',
            );
          } else {
            return Center(
              child: LoadingFoldingCube(),
            );
          }
        },
      ),
    );
  }
}
