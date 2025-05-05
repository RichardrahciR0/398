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

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
  Widget _drawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
<<<<<<< HEAD
        Navigator.pop(context);
=======
        Navigator.pop(context); // Close drawer
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
        Navigator.pushNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green[700]),
              child: Center(
                child: Image.asset('assets/logo.png', height: 60),
              ),
            ),
<<<<<<< HEAD
            _drawerItem(context, "Dashboard", "/"),
=======
            _drawerItem(context, "Dashboard", "/"), // name + router page
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
            _drawerItem(context, "Account Settings", "/settings"),
            _drawerItem(context, "Layout Planning", "/map"),
            _drawerItem(context, "Task Manager", "/tasks"),
            _drawerItem(context, "Mapping", "/map"),
            _drawerItem(context, "Data Visualized", "/data"),
            _drawerItem(context, "Weather", "/weather"),
            _drawerItem(context, "Calendar", "/calendar"),
            _drawerItem(context, "Crop Database", "/database"),
          ],
        ),
      ),
<<<<<<< HEAD
=======
=======
  @override
  Widget build(BuildContext context) {
    return Scaffold(
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
      backgroundColor: const Color(0xFFF7F8F9),
      body: SafeArea(
        child: Column(
          children: [
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
            // Header
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, size: 28),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  const Row(
                    children: [
<<<<<<< HEAD
                      Text("Layout Planning", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(Icons.add, size: 28),
=======
                      Text(
                        "Layout Planning",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.add, size: 28),
=======
                  const Icon(Icons.notifications_none, size: 28),
                  Row(
                    children: [
                      const Text(
                        "Layout Planning",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 28)),
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 18,
                    child: Icon(Icons.person, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

            // My Area label
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
<<<<<<< HEAD
=======
<<<<<<< HEAD
                child: Text("My Area",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
=======
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                child: Text("My Area", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
<<<<<<< HEAD
=======

            // Map with zoom buttons
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 200,
                  width: double.infinity,
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
<<<<<<< HEAD
                      center: LatLng(-27.4698, 153.0251),
=======
<<<<<<< HEAD
                      center: LatLng(-27.4698, 153.0251),
=======
                      center: LatLng(-27.4698, 153.0251), // Brisbane
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                      zoom: 16.0,
                      onTap: (tapPosition, point) => _addPoint(point),
                    ),
                    children: [
                      TileLayer(
<<<<<<< HEAD
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
=======
<<<<<<< HEAD
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
=======
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                        userAgentPackageName: 'com.example.farmapp',
                      ),
                      PolygonLayer(polygons: _plots),
                    ],
                  ),
                ),
                Positioned(
                  right: 32,
                  top: 16,
                  child: Column(
                    children: const [
                      Icon(Icons.add_circle_outline, size: 28),
                      SizedBox(height: 8),
                      Icon(Icons.remove_circle_outline, size: 28),
                    ],
                  ),
                ),
              ],
            ),
<<<<<<< HEAD
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
=======
<<<<<<< HEAD
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
=======

            const SizedBox(height: 16),

            // Tools and crop details
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
<<<<<<< HEAD
                      const Text("My Tools", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
=======
<<<<<<< HEAD
                      const Text("My Tools",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
=======
                      const Text("My Tools", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.grid_on, size: 40),
                          Icon(Icons.circle_outlined, size: 40),
                          Icon(Icons.crop_square, size: 40),
                        ],
                      ),
                      const SizedBox(height: 24),
<<<<<<< HEAD
                      const Text("My Crops", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
=======
<<<<<<< HEAD
                      const Text("My Crops",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
=======

                      const Text("My Crops", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/crops/orange.png", height: 40),
                          Image.asset("assets/crops/wheat.png", height: 40),
                          Image.asset("assets/crops/leafy.png", height: 40),
                          Image.asset("assets/crops/tree.png", height: 40),
                          Image.asset("assets/crops/lettuce.png", height: 40),
                        ],
                      ),
                      const SizedBox(height: 16),
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                      const TextField(
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: "Spacing",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Planting Date",
                          border: const OutlineInputBorder(),
<<<<<<< HEAD
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              // TODO: Date picker logic
                            },
                          ),
=======
<<<<<<< HEAD
                          suffixIcon: Icon(Icons.calendar_today),
=======
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () {
                              // TODO: Add date picker logic
                            },
                          ),
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.route), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
        ],
      ),
<<<<<<< HEAD
=======
=======
>>>>>>> 74e4f9cfa76419cb338d36da284b982973dadc8e
>>>>>>> 8eb87bec0a1cc0baf9a9a3e078be6cbb127c28dd
    );
  }
}
