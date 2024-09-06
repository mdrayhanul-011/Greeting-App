import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Bag',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Bag',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pulloverQuantity = 1;
  int tShirtQuantity = 1;
  int sportDressQuantity = 1;

  void updateTotalAmount() {
    setState(() {
      final total = (pulloverQuantity * 51) + (tShirtQuantity * 30) + (sportDressQuantity * 43);
      totalAmount = total;
    });
  }

  int totalAmount = 124;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Bag', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Pullover
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/pullover.jpeg',
                scale: 1,), // Replace with your asset
                SizedBox(width: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pullover', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Color: Black, Size: L'),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (pulloverQuantity > 1) {
                              setState(() {
                                pulloverQuantity--;
                                updateTotalAmount();
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle, size: 30,),
                        ),
                        Text('$pulloverQuantity'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              pulloverQuantity++;
                              updateTotalAmount();
                            });
                          },
                          icon: const Icon(Icons.add_circle, size: 30,),
                        ),
                        SizedBox(width: 20,),
                        Text('\$${pulloverQuantity * 51}',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // T-Shirt
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Image.asset('assets/images/t-shirt.png',
                scale: 4,), // Replace with your asset
                SizedBox(width: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('T-Shirt', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Color: Gray, Size: L'),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (tShirtQuantity > 1) {
                              setState(() {
                                tShirtQuantity--;
                                updateTotalAmount();
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle, size: 30,),
                        ),
                        Text('$tShirtQuantity'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              tShirtQuantity++;
                              updateTotalAmount();
                            });
                          },
                          icon: const Icon(Icons.add_circle, size: 30,),
                        ),
                        SizedBox(width: 20,),
                        Text('\$${tShirtQuantity * 30}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            //Sport Dress
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/sports.png',
                scale: 1.45,), // Replace with your asset
                SizedBox(width: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sport Dress', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Color: Black, Size: M'),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (sportDressQuantity > 1) {
                              setState(() {
                                sportDressQuantity--;
                                updateTotalAmount();
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle, size: 30,),
                        ),
                        Text('$sportDressQuantity'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              sportDressQuantity++;
                              updateTotalAmount();
                            });
                          },
                          icon: const Icon(Icons.add_circle, size: 30,),
                        ),
                        SizedBox(width: 20,),
                        Text('\$${sportDressQuantity * 43}',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Total Amount
            SizedBox(height: 30,),
            Text('Total amount:                                       \$$totalAmount',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // Check Out Button
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Checkout successful!')),
                );
              },
              child: const Text('CHECK OUT', style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
      ),
    );
  }
}