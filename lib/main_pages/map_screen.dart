import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  MapType _mapType = MapType.normal;
  Set<Marker> _markers = {};

  final LatLng _center = const LatLng(38.5289, -8.8926); // Coordenadas do IPS

  void _changeMapType() {
    setState(() {
      _mapType = _mapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _loadMarkers();
  }

  void _addMarker(LatLng position, String title, String description) {
    final markerId = MarkerId(position.toString());
    setState(() {
      _markers.add(
        Marker(
            markerId: markerId,
            position: position,
            infoWindow: InfoWindow(
              title: title,
              snippet: description,
            ),
            onTap: () => _showMarkerDialog(markerId, title, description)
            ),

      );
    });
    _saveMarkers();
  }

  Future<void> _showMarkerDialog(MarkerId markerId, String title, String description) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                _deleteMarker(markerId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteMarker(MarkerId markerId) {
    setState(() {
      _markers.removeWhere((marker) => marker.markerId == markerId);
    });
    _saveMarkers();
  }

  Future<void> _saveMarkers() async {
    final prefs = await SharedPreferences.getInstance();
    final String markerList = jsonEncode(_markers.map((marker) => {
      'position': {'lat': marker.position.latitude, 'lng': marker.position.longitude},
      'title': marker.infoWindow.title,
      'description': marker.infoWindow.snippet,
    }).toList());
    debugPrint('Saving markers: $markerList');
    await prefs.setString('markers', markerList);
  }
  
  Future<void> _loadMarkers() async {
    final prefs = await SharedPreferences.getInstance();
    final String? markerListString = prefs.getString('markers');
    debugPrint('Loading markers: $markerListString');
    if (markerListString != null) {
      final List<dynamic> markerList = jsonDecode(markerListString);
      setState(() {
        _markers = markerList.map((markerData) {
          final position = LatLng(markerData['position']['lat'], markerData['position']['lng']);
          return Marker(
            markerId: MarkerId(position.toString()),
            position: position,
            infoWindow: InfoWindow(
              title: markerData['title'],
              snippet: markerData['description'],
            ),
            onTap: () => _showMarkerDialog(MarkerId(position.toString()), markerData['title'], markerData['description']),
          );
        }).toSet();
      });
    }
  }


  Future<void> _showAddMarkerDialog(LatLng position) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Marker'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(hintText: 'Description'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please insert a title'),
                    ),
                  );
                } else {
                  _addMarker(position, titleController.text,
                      descriptionController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMarkerListDialog() async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'My Markers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _markers.length,
                itemBuilder: (BuildContext context, int index) {
                  final marker = _markers.elementAt(index);
                  return ListTile(
                    title: Text(marker.infoWindow.title ?? '', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(
                        '${marker.infoWindow.snippet ?? ''}\n(${marker.position.latitude}, ${marker.position.longitude})'),
                    onTap: () {
                      Navigator.pop(context);
                      mapController.animateCamera(
                        CameraUpdate.newLatLng(marker.position),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _requestPermission();

    super.initState();
  }

  Future<void> _requestPermission() async {
    await Permission.location.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 16.0,
            ),
            mapType: _mapType,
            trafficEnabled: true,
            myLocationEnabled: true,
            markers: _markers,
            onLongPress: (LatLng position) {
              _showAddMarkerDialog(position);
            },
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  child: FloatingActionButton(
                    onPressed: _changeMapType,
                    tooltip: 'Change Map Type',
                    child: Icon(Icons.map),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingActionButton(
              onPressed: _showMarkerListDialog,
              tooltip: 'Show Markers',
              child: Icon(Icons.list),
            ),
          )
        ],
      ),
    );
  }
}
