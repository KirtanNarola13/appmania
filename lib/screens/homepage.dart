import 'package:app_mania/utils/globle.dart';
import 'package:flutter/material.dart';

class AppMania extends StatefulWidget {
  const AppMania({super.key});

  @override
  State<AppMania> createState() => _AppManiaState();
}

class _AppManiaState extends State<AppMania> {
  int? dropDownValue;
  bool indecree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              color: Colors.black,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Surat City',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed('fav_page');
              });
            },
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Colors.black,
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
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
        ),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Find The ",
                    style: TextStyle(fontSize: 35),
                  ),
                  Text(
                    "Best",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "Food ",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Around you",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    width: 180,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: DropdownButton(
                      value: dropDownValue,
                      hint: const Text("Select Category..."),
                      items: allFoods.map((e) {
                        return DropdownMenuItem(
                          value: allFoods.indexOf(e),
                          child: Text(e['category']),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          dropDownValue = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Visibility(
                    visible: (dropDownValue != null) ? true : false,
                    child: ActionChip(
                      label: const Row(
                        children: [
                          Icon(
                            Icons.clear,
                            size: 15,
                          ),
                          Text("clear"),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          dropDownValue = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              const Row(
                children: [
                  Text(
                    "Find",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "5km",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: allFoods.map((e) {
                  return SizedBox(
                    height: 380,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                height: 40,
                                child: Text(
                                  "${e['category']}",
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ...e['categoryFood'].map(
                                      (e) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Navigator.of(context).pushNamed(
                                                'detail_page',
                                                arguments: e,
                                              );
                                            });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              left: 4,
                                              right: 25,
                                              bottom: 50,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF4F4F4),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(25),
                                              ),
                                            ),
                                            width: 190,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 10,
                                                      right: 10,
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          e['faveProduct'] =
                                                              !e['faveProduct'];
                                                        });
                                                        (e['faveProduct'] ==
                                                                true)
                                                            ? favFoods.add(e)
                                                            : favFoods
                                                                .remove(e);
                                                      },
                                                      icon: (e['faveProduct'] ==
                                                              false)
                                                          ? const Icon(
                                                              Icons
                                                                  .favorite_outline_rounded,
                                                              color:
                                                                  Colors.amber,
                                                            )
                                                          : const Icon(
                                                              Icons.favorite,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(
                                                        () {
                                                          e['added'] =
                                                              !e['added'];
                                                          indecree = !indecree;
                                                        },
                                                      );
                                                      (indecree != true)
                                                          ? e['quantity'] =
                                                              e['quantity'] + 1
                                                          : e['quantity'] =
                                                              e['quantity'] - 1;
                                                      (e['added'] != false)
                                                          ? cartFoods.add(e)
                                                          : cartFoods.remove(e);
                                                    },
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 50,
                                                        width: 50,
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20),
                                                          ),
                                                          color: Colors.amber,
                                                        ),
                                                        child: (e['added'] ==
                                                                false)
                                                            ? const Icon(
                                                                Icons.add,
                                                                color: Color(
                                                                    0xFFF4F4F4),
                                                              )
                                                            : const Icon(
                                                                Icons.remove,
                                                                color: Color(
                                                                    0xFFF4F4F4),
                                                              )),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 15,
                                                                ),
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xFFF4F4F4),
                                                                  radius: 59,
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                          "${e['img']}"),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  bottom: 10,
                                                                ),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "${e['name']}",
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Text(
                                                                          "${e['time']}",
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            const Icon(
                                                                              Icons.star_border,
                                                                              color: Colors.amber,
                                                                            ),
                                                                            Text("${e['rating']}")
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      "₹ ${e['price']}",
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
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
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
