import 'package:flutter/material.dart';

class NearbyVenue extends StatefulWidget {
  const NearbyVenue({Key? key}) : super(key: key);

  @override
  State<NearbyVenue> createState() => _NearbyVenueState();
}

class _NearbyVenueState extends State<NearbyVenue> {
  final List<Map<String, String>> venues = [
    {
      'title': 'Marble Bar',
      'address': '123 Main Street, New York',
      'status': 'Open - Closes at 1 AM',
    },
    {
      'title': 'Sky Lounge',
      'address': '456 Park Avenue, New York',
      'status': 'Closed - Opens at 1 AM',
    },
    {
      'title': 'Sunset Cafe',
      'address': '789 Broadway, New York',
      'status': 'Open - Closes at 1 AM',
    },
  ];

  @override
  int _currentindex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Nearby Venues'),
            SizedBox(width: 8),
            Icon(Icons.diamond_outlined, color: Colors.deepOrange),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
        ),
        centerTitle: true,
      ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: "Checked"),
          BottomNavigationBarItem(icon: Icon(Icons.diamond_sharp), label: "Diamond"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
          currentIndex: _currentindex,
          selectedItemColor: Colors.black, // Black for selected item
          unselectedItemColor: Colors.black, // Black for unselected items
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
        ),
      body: Column(
        children: [
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 8),
                _buildingElevatedButton('Restaurants', context),
                SizedBox(width: 8),
                _buildingElevatedButton('Bars', context),
                SizedBox(width: 8),
                _buildingElevatedButton('Cafe', context),
                SizedBox(width: 8),
                _buildingElevatedButton('Gym', context),
                SizedBox(width: 8),
                _buildingElevatedButton('Museum', context),
                SizedBox(width: 8),
              ],
            ),
          ),
          SizedBox(height: 10),

          // ListView for Venues
          Expanded(
            child: ListView.separated(
              itemCount: venues.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    venues[index]['title'] ?? 'No Title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(venues[index]['address'] ?? 'No Address'),
                      Row(
                        children: [
                          Text(
                            venues[index]['status'] ?? 'Status Unknown',
                            style: TextStyle(
                              color: (venues[index]['status'] == 'Open') ? Colors.green : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(venues[index]['closing'] ?? ''),
                        ],
                      ),
                      SizedBox(height: 5), // Space before button
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.navigation_outlined, color: Colors.white),
                        label: Text('Show on Map', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                      ),
                    ],
                  ),
                );

              },
            ),
          ),

        ],
      ),
    );
  }
}

Widget _buildingElevatedButton(String text, BuildContext context) {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
            return Colors.white;
          }
          return Colors.black;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
            return Colors.black;
          }
          return Colors.white;
        },
      ),
      side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 2)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
  );
}
