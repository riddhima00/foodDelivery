import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/restaurantview.dart';
import 'package:fooddelivery/cartscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> dishes = [
    {'name': 'Pizza', 'image': 'assets/images/tasty_italian_pizza_1_982b93ea-d1f8-4626-9c84-1cdd5bbde93c_570x570_crop_top.png', 'price': '\$70'},
    {'name': 'Burger', 'image': 'assets/images/OIP (2).jpeg', 'price': '\$50'},
    {'name': 'Sushi', 'image': 'assets/images/OIP (1).jpeg', 'price': '\$90'},
    {'name': 'Pasta', 'image': 'assets/images/one-pot-pasta-chorizo-pasta-square.jpeg', 'price': '\$60'},
    {'name': 'Salad', 'image': 'assets/images/Summer-Salad-With-Corn-Strawberries-Avocado-Walder-Wellness-2-683x1024.jpg', 'price': '\$30'},
  ];

  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Rose Garden Restaurant',
      'image': 'assets/images/Rose.jpg',
      'rating': 4.7,
      'delivery': 'Free',
      'deliveryTime': '20 min',
      'cuisine': 'Burger - Chicken - Rice - Wings',
    },
    {
      'name': 'Burger House',
      'image': 'assets/images/burgerhouse.jpg',
      'rating': 4.5,
      'delivery': 'Free',
      'deliveryTime': '25 min',
      'cuisine': 'Burger - Fries',
    },
    {
      'name': 'Sushi Palace',
      'image': 'assets/images/Shushi.jpeg',
      'rating': 4.8,
      'delivery': 'Free',
      'deliveryTime': '30 min',
      'cuisine': 'Sushi - Japanese',
    },
    {
      'name': 'Pasta Palace',
      'image': 'assets/images/pasta.jpeg',
      'rating': 4.7,
      'delivery': 'Free',
      'deliveryTime': '15 min',
      'cuisine': 'Pasta - Italian',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DELIVER TO', style: TextStyle(color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold),),
            Row(
              children: [
                Text('Halal Lab office', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),),
                Icon(Icons.arrow_drop_down)
              ],
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen() ));
          }, icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
        DrawerHeader(
        decoration: BoxDecoration(
        color: Colors.orange,
        ),
        child: Column(
          children: [

          ],
        ),
      ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home_outlined,),
              trailing: Icon(Icons.arrow_right),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Personal Info'),
              leading: Icon(Icons.person_2_outlined, color: Colors.orange,),
              trailing: Icon(Icons.arrow_right),
              onTap: (){
                Navigator.pop(context);

              },
            ),
      ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hey Halal,",
                    style: TextStyle(fontSize: 18,),
                  ),
                  Text("Good Afternoon!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  hintText: "Search dishes, restaurants",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('See All', style: TextStyle(fontSize: 14, color: Colors.black)),
                        Icon(Icons.arrow_forward_ios_outlined, size: 12, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dishes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.only(right: 16.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(8),
                        height: 150,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                dishes[index]['image']!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              dishes[index]['name']!,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Starting ${dishes[index]['price']}',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Open Restaurants", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('See All', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                        Icon(Icons.arrow_forward_ios_outlined, size: 12, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantView()),);
                    },
                    child: RestaurantCard(
                      name: restaurants[index]['name']!,
                      image: restaurants[index]['image']!,
                      rating: restaurants[index]['rating'].toString(),
                      delivery: restaurants[index]['delivery']!,
                      deliveryTime: restaurants[index]['deliveryTime']!,
                      cuisine: restaurants[index]['cuisine']!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String image;
  final String rating;
  final String delivery;
  final String deliveryTime;
  final String cuisine;

  RestaurantCard({
    required this.name,
    required this.image,
    required this.rating,
    required this.delivery,
    required this.deliveryTime,
    required this.cuisine,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(cuisine,style: TextStyle(color: Colors.grey[700]),),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star_border_outlined, color: Colors.orange),
                Text(rating),
                SizedBox(width: 16),
                Icon(Icons.delivery_dining_outlined, color: Colors.orange),
                Text(delivery),
                SizedBox(width: 16),
                Icon(Icons.access_time_outlined, color: Colors.orange),
                Text(deliveryTime),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
