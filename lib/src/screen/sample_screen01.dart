import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Overview',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: EdgeInsets.all(20),
              children: [
                DashboardTile(
                  title: 'Total Sales',
                  value: '\$2000',
                  icon: Icons.attach_money,
                  color: Colors.green,
                ),
                DashboardTile(
                  title: 'New Users',
                  value: '10',
                  icon: Icons.person_add,
                  color: Colors.blue,
                ),
                DashboardTile(
                  title: 'Total Orders',
                  value: '30',
                  icon: Icons.shopping_cart,
                  color: Colors.purple,
                ),
                DashboardTile(
                  title: 'Completed Orders',
                  value: '20',
                  icon: Icons.done_all,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardTile({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
