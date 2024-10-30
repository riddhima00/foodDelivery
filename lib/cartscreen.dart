import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItemData> cartItems = [
    CartItemData(name: 'Pizza Calzone European', price: 64, quantity: 2),
    CartItemData(name: 'Margherita Pizza', price: 50, quantity: 1),
  ];

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      cartItems[index].quantity = newQuantity; // Update the quantity
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181C2E),
      appBar: AppBar(
        title: Text('Cart'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.black54,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'DONE',
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
          ),
        ],
        backgroundColor: Color(0xFF181C2E),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItem(
                  item: cartItems[index],
                  onRemove: () => removeItem(index),
                  onUpdateQuantity: (newQuantity) => updateQuantity(index, newQuantity), // Pass update function
                );
              },
            ),
          ),
          BottomSection(totalPrice: calculateTotalPrice()),
        ],
      ),
    );
  }
}

class CartItemData {
  final String name;
  final double price;
  int quantity;

  CartItemData({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartItem extends StatelessWidget {
  final CartItemData item;
  final VoidCallback onRemove;
  final Function(int) onUpdateQuantity;

  CartItem({
    required this.item,
    required this.onRemove,
    required this.onUpdateQuantity,
  });

  void increaseQuantity() {
    onUpdateQuantity(item.quantity + 1); // Increase quantity
  }

  void decreaseQuantity() {
    if (item.quantity > 1) {
      onUpdateQuantity(item.quantity - 1); // Decrease quantity
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/tasty_italian_pizza_1_982b93ea-d1f8-4626-9c84-1cdd5bbde93c_570x570_crop_top.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '14"',
                            style: TextStyle(color: Colors.white54, fontSize: 14),
                          ),
                          QuantitySelector(
                            quantity: item.quantity,
                            onIncrease: increaseQuantity,
                            onDecrease: decreaseQuantity,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: onRemove,
            ),
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  QuantitySelector({
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle_outline, color: Colors.white),
          onPressed: onDecrease,
        ),
        Text(
          '$quantity',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline, color: Colors.white),
          onPressed: onIncrease,
        ),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  final double totalPrice;

  BottomSection({required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DELIVERY ADDRESS',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'EDIT',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '2118 Thornridge Cir. Syracuse',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'TOTAL:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}', // Display total price
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Breakdown',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'PLACE ORDER',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
