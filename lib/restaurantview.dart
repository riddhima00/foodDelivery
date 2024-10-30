import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RestaurantView extends StatefulWidget {
  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  List<bool> isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 321,
              width: 375,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage('assets/images/burgerhouse.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 24,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Center(
                          child: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.star_border_outlined, color: Colors.orange),
                SizedBox(width: 4),
                Text("4.7", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 16),
                Icon(Icons.delivery_dining_outlined, color: Colors.orange),
                SizedBox(width: 4),
                Text("Free"),
                SizedBox(width: 16),
                Icon(Icons.access_time_outlined, color: Colors.orange),
                SizedBox(width: 4),
                Text("20 min"),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Burger House",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dopibus posuere velit aliquet.",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                CategoryChip(
                  label: "Burger",
                  isSelected: isSelected[0],
                  onSelected: (selected) {
                    setState(() {
                      isSelected[0] = selected;
                    });
                  },
                ),
                CategoryChip(
                  label: "Sandwich",
                  isSelected: isSelected[1],
                  onSelected: (selected) {
                    setState(() {
                      isSelected[1] = selected;
                    });
                  },
                ),
                CategoryChip(
                  label: "Pizza",
                  isSelected: isSelected[2],
                  onSelected: (selected) {
                    setState(() {
                      isSelected[2] = selected;
                    });
                  },
                ),
                CategoryChip(
                  label: "Pasta",
                  isSelected: isSelected[3],
                  onSelected: (selected) {
                    setState(() {
                      isSelected[3] = selected;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FoodItemCard(
                    name: index % 2 == 0 ? "Burger Ferguson" : "Rockin' Burgers",
                    price: "\$40",
                    image: 'assets/images/burger.jpg', // Replace with correct path
                    restaurant: index % 2 == 0 ? "Spicy Restaurant" : "CafeCafachino",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: Colors.orange,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Circular shape
        side: BorderSide.none,
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String restaurant;

  FoodItemCard({
    required this.name,
    required this.price,
    required this.image,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  restaurant,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.add_circle, color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
