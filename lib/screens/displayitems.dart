import 'package:api_get/const.dart';
import 'package:api_get/models/api_models.dart';
import 'package:flutter/material.dart';

class Displayitems extends StatelessWidget {
  final Product diplayitems;
  const Displayitems({super.key, required this.diplayitems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            imagebaseurl + diplayitems.thumb,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          diplayitems.stockStatus,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          diplayitems.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text("Quantity: ${diplayitems.quantity}"),
                        Text(
                          diplayitems.price,
                          style: const TextStyle(color: Colors.blue),
                        ),
                        Text(" Rating :${diplayitems.rating.toString()}/5")
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  color: Colors.blueAccent,
                  height: 50,
                  child: Center(
                    child: Text("ORDER NOW"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
