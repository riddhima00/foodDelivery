import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: CircleAvatar(
            radius: 2,
            backgroundColor: Colors.grey[300],
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new_rounded,)),
          ),
          title: Text('My Orders', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          bottom: TabBar(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: "Ongoing"),
              Tab(text: "History"),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(
            children: [
              OngoingOrderScreen(),
              OrderHistoryScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class OngoingOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        OrderCard(
          imageUrl: 'assets/images/pizzahut.jpg',
          title: 'Pizza Hut',
          price: '\$35.25',
          orderId: '#162432',
          itemCount: '03 Items',
          cardColor: Colors.white,
          buttons: [
            OrderButton(label: 'Track Order', backgroundColor: Colors.orange,borderColor: Colors.transparent, textColor: Colors.white),
            OrderButton(label: 'Cancel', backgroundColor: Colors.white,borderColor: Colors.orange, textColor: Colors.orange),
          ],
        ),
        OrderCard(
          imageUrl: 'assets/images/McDonalds.webp',
          title: 'McDonald',
          price: '\$40.15',
          orderId: '#242432',
          itemCount: '02 Items',
          cardColor: Colors.white,
          buttons: [
            OrderButton(label: 'Track Order', backgroundColor: Colors.orange,borderColor: Colors.transparent, textColor: Colors.white),
            OrderButton(label: 'Cancel', backgroundColor: Colors.white,borderColor: Colors.orange, textColor: Colors.orange),
          ],
        ),
      ],
    );
  }
}

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        OrderCard(
          imageUrl: 'assets/images/pizzahut.jpg',
          title: 'Pizza Hut',
          price: '\$35.25',
          orderId: '#162432',
          itemCount: '03 Items',
          cardColor: Colors.white,
          buttons: [
            OrderButton(label: 'Rate', backgroundColor: Colors.white,borderColor: Colors.orange, textColor: Colors.orange),
            OrderButton(label: 'Re-Order', backgroundColor: Colors.orange,borderColor: Colors.transparent, textColor: Colors.white),
          ],
        ),
        OrderCard(
          imageUrl: 'assets/images/starbucks.jpeg',
          title: 'Starbucks',
          price: '\$10.20',
          orderId: '#240112',
          itemCount: '01 Item',
          cardColor: Colors.white,
          buttons: [
            OrderButton(label: 'Rate', backgroundColor: Colors.white, borderColor: Colors.orange, textColor: Colors.orange),
            OrderButton(label: 'Re-Order', backgroundColor: Colors.orange,borderColor: Colors.transparent, textColor: Colors.white),
          ],
        ),
      ],
    );
  }
}

class OrderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String orderId;
  final String itemCount;
  final List<OrderButton> buttons;
  final Color cardColor;

  OrderCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.orderId,
    required this.itemCount,
    required this.buttons,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(imageUrl, height: 80, width: 80),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(price, style: TextStyle(color: Colors.grey[600])),
                      Text(itemCount, style: TextStyle(color: Colors.grey[600])),
                      Text(orderId, style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: buttons,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  OrderButton({required this.label, required this.backgroundColor, required this.textColor, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor, // Background color of the button
        foregroundColor: textColor, // Text color
        side: BorderSide(color: borderColor, width: 2), // Border color and width
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Text(label, style: TextStyle(color: textColor)),
    );
  }
}