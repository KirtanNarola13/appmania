import 'package:app_mania/utils/globle.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          "${data['name']}",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed('cart_page');
              });
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              height: MediaQuery.of(context).size.height / 1.6,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                    ),
                    width: 140,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            data['quantity'] = data['quantity'] - 1;
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                        Text(
                          "${data['quantity']}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            data['quantity'] = data['quantity'] + 1;
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data['name']}",
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${data['description']}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text(
                          "⭐️ ${data['rating']}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: Text(
                          "🔥 ${data['kcal']}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          "⏰ ${data['detailTime']}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed('cart_page');
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          data['added'] = !data['added'];
                        });
                        (data['added'] != false)
                            ? cartFoods.add(data)
                            : cartFoods.remove(data);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 250,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: (data['added'] == true)
                            ? Text(
                                "Remove From Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              )
                            : Text(
                                "Add To Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0, -1.5),
              child: CircleAvatar(
                radius: 220,
                backgroundColor: Colors.transparent,
                child: Container(
                  height: 201,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("${data['img']}"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.amber,
                        blurRadius: 70,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
