import 'package:api_get/const.dart';
import 'package:api_get/models/api_models.dart';
import 'package:api_get/service/api_get.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Product> items = [];

  getproduct() {
    ApiGetProduct().then((value) {
      setState(() {
        items = value!;
      });
    });
  }

  @override
  void initState() {
    getproduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COLLECTIONS"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final apiItems = items[index];

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.circular(8)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 110,
                              width: 100,
                              color: Colors.white,
                              child: Image.network(
                                imagebaseurl + apiItems.thumb,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            apiItems.stockStatus,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, top: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            apiItems.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Quantity: ${apiItems.quantity}"),
                          Text(
                            apiItems.price,
                            style: const TextStyle(color: Colors.blue),
                          ),
                          Text(" Rating :${apiItems.rating.toString()}/5")
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            );
          }),
    );
  }
}
