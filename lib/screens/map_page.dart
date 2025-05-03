import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  final List<Polygon> _plots = [];
  final List<LatLng> _currentPoints = [];

  void _addPoint(LatLng point) {
    setState(() {
      _currentPoints.add(point);
      if (_currentPoints.length == 4) {
        final label = "Plot ${_plots.length + 1}";
        _plots.add(
          Polygon(
            points: List.from(_currentPoints),
            borderColor: Colors.green,
            borderStrokeWidth: 2,
            color: Colors.green.withOpacity(0.4),
            label: label,
          ),
        );
        _currentPoints.clear();
      }
    });
  }

  void _clearPlots() {
    setState(() {
      _plots.clear();
      _currentPoints.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("My Plot Layout", style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: _clearPlots,
            tooltip: "Clear All Plots",
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Layout",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),
                
                SizedBox(height: 24),
                Text(
                  "You can create, edit, or remove individual plots. Tap on the map to create plots by selecting 4 corners.",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: LatLng(-27.4698, 153.0251), // Brisbane default center
                zoom: 16.0,
                onTap: (tapPosition, point) => _addPoint(point),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.farmapp',
                ),
                PolygonLayer(polygons: _plots),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Tap 4 points on the map to create a plot")),
                  );
                },
                icon: Icon(Icons.add_location_alt),
                label: Text("Add Plot"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
