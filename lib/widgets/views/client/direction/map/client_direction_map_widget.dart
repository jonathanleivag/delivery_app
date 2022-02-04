import 'dart:async';

import 'package:delivery_app/providers/providers.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart';

class ClientDirectionMapWidget extends StatefulWidget {
  const ClientDirectionMapWidget({Key? key}) : super(key: key);

  @override
  State<ClientDirectionMapWidget> createState() =>
      _ClientDirectionMapWidgetState();
}

class _ClientDirectionMapWidgetState extends State<ClientDirectionMapWidget> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17,
  );
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  BitmapDescriptor? _markerIcon;

  Marker marker = const Marker(
    markerId: MarkerId('marker'),
    position: LatLng(0, 0),
  );

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    void _updateBitmap(BitmapDescriptor bitmap) {
      setState(() {
        _markerIcon = bitmap;
      });
    }

    Future<void> _createMarkerImageFromAsset(BuildContext context) async {
      if (_markerIcon == null) {
        BitmapDescriptor.fromAssetImage(
          createLocalImageConfiguration(context, size: const Size(48, 48)),
          'assets/img/my_location_5.png',
        ).then(_updateBitmap);
      }
    }

    _createMarkerImageFromAsset(context);

    void _setMarker(LatLng position) {
      setState(() {
        if (_markerIcon != null) {
          marker = Marker(
            markerId: const MarkerId("marker"),
            position: position,
            icon: _markerIcon!,
          );
        } else {
          marker = Marker(
            markerId: const MarkerId("marker"),
            position: position,
          );
        }
      });
    }

    Future<void> _setPlacemarks(double latitude, double longitude) async {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      final Placemark address = placemarks[0];
      _shoppProvider.placemarksCopy = {
        'address': address.thoroughfare ?? '',
        'street': address.subThoroughfare ?? '',
        'city': address.locality ?? '',
        'department': address.administrativeArea ?? '',
        'country': address.country ?? '',
        'direction':
            '${address.thoroughfare}, ${address.subThoroughfare} ${address.locality}, ${address.administrativeArea}, ${address.country}',
        'latitude': latitude,
        'longitude': longitude,
      };
    }

    Future<void> _onMapCreated(GoogleMapController controller) async {
      controller.setMapStyle(MapStyleUtil.mapStyle());
      try {
        final position = await _shoppProvider.getPosition();
        controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 17,
          ),
        ));
        _setMarker(LatLng(position.latitude, position.longitude));
        _setPlacemarks(position.latitude, position.longitude);
      } catch (e) {
        NotificationUtil.showSnackBar(e.toString(), success: false);
      }
      _controller.complete(controller);
    }

    void _onTap(LatLng argument) {
      _setMarker(argument);
      _setPlacemarks(argument.latitude, argument.longitude);
    }

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      markers: <Marker>{marker},
      onMapCreated: _onMapCreated,
      onTap: _onTap,
    );
  }
}
