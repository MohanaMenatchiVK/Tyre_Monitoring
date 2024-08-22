import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TPMS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/in-cab-assistance': (context) => InCabAssistancePage(),
        '/maintenance': (context) => MaintenancePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TPMS Layout'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title "TPMS"
            Center(
              child: Text(
                'TPMS',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            // First Row with 3 Columns
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InfoCard(
                    title: 'Pressure',
                    value: 'XXX kPa',
                    icon: Icons.speed,
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: InfoCard(
                    title: 'GPS Tracking',
                    value: 'Active',
                    icon: Icons.gps_fixed,
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: InfoCard(
                    title: 'TKPS Measures',
                    value: 'XX%',
                    icon: Icons.bar_chart,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            // Two buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/in-cab-assistance');
                  },
                  icon: Icon(Icons.car_repair),
                  label: Text('In Cab Assistance'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/maintenance');
                  },
                  icon: Icon(Icons.build),
                  label: Text('Maintenance'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Colors.blueAccent),
            SizedBox(height: 12.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class InCabAssistancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In Cab Assistance'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tire Measures',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  TireMeasureCard(title: 'TKPH', value: 'Value 1'),
                  TireMeasureCard(title: 'Temperature', value: 'Value 2'),
                  TireMeasureCard(title: 'Pressure - Front Right', value: 'Value 3'),
                  TireMeasureCard(title: 'Pressure - Front Left', value: 'Value 4'),
                  TireMeasureCard(title: 'Pressure - Rear Right', value: 'Value 5'),
                  TireMeasureCard(title: 'Pressure - Rear Left', value: 'Value 6'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TireMeasureCard extends StatelessWidget {
  final String title;
  final String value;

  const TireMeasureCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MaintenancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maintenance'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            // Add action for Predict Analysis
          },
          icon: Icon(Icons.analytics),
          label: Text('Predict Analysis'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}