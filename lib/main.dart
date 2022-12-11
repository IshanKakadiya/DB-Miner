// ignore_for_file: camel_case_types, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:animal_biograpy_app/model/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helper/image_api_helper.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    theme: ThemeData.dark(),
    routes: {
      "/": (context) => const Home_Page(),
    },
  ));
}

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  late Future<List<AnimalAndImages>?>? getAllData;
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  int i = 0;

  @override
  void initState() {
    super.initState();
    // getApi();
    getAllData = ImageAPIHelper.imageAPIHelper.getImage(name: "cheetah");
    animalValue = animal[0];
  }

  // getAPi() async {}

  List<String> animal = [
    "Cheetah",
    "Lion",
    "Frog",
    "Crocodile",
    "Alligator",
    "Monitor lizard",
    "Salamander",
    "Toad",
    "Newt",
    "Iguana",
    "Snake",
    "Green dragon lizard",
  ];

  late String animalValue = "";
  bool openWindo = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animal Biograpy"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            setState(() {
              openWindo = !openWindo;
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  searchController.clear();

                  return AlertDialog(
                    title: const Text(
                      "Search Animal Name",
                      textAlign: TextAlign.center,
                    ),
                    content: Form(
                      key: searchKey,
                      child: TextFormField(
                        controller: searchController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Frist Search Any Animal Name, Like : Lion";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          labelText: "Search",
                          hintText: "Search Here",
                        ),
                      ),
                    ),
                    actions: [
                      OutlinedButton(
                        child: const Text("Cancle"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        child: const Text("Search"),
                        onPressed: () async {
                          String nameAnimal = searchController.text;

                          if (searchKey.currentState!.validate()) {
                            getAllData = ImageAPIHelper.imageAPIHelper
                                .getImage(name: nameAnimal);

                            getAllData!.whenComplete(
                              () => setState(
                                () {
                                  Navigator.of(context).pop();
                                  int i = 0;
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder(
        future: getAllData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ERROR : ${snapshot.error}");
          } else if (snapshot.hasData) {
            List<AnimalAndImages>? data = snapshot.data;

            totalData({required String title, required String value}) {
              return Container(
                width: _width * 0.43,
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              children: [
                // (openWindo)
                //     ? Container(
                //         width: _width,
                //         alignment: Alignment.center,
                //         child: DropdownButton<String>(
                //           value: animalValue,
                //           hint: const Text("Please Select Aniaml . . "),
                //           icon: const Icon(Icons.keyboard_arrow_down),
                //           items: animal.map((String items) {
                //             return DropdownMenuItem(
                //               value: items,
                //               child: Text(items),
                //             );
                //           }).toList(),
                //           onChanged: (val) {
                //             setState(() {
                //               animalValue = val!;

                //               getAllData = ImageAPIHelper.imageAPIHelper
                //                   .getImage(name: animalValue);

                //               getAllData!.whenComplete(
                //                 () => setState(
                //                   () {
                //                     openWindo = false;

                //                     int i = 0;
                //                   },
                //                 ),
                //               );
                //             });
                //           },
                //         ),
                //       )
                //     : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        setState(() {
                          if (0 == i) {
                            i = data!.length - 1;
                          } else {
                            i--;
                          }
                        });
                      },
                    ),
                    Text(
                      "${i + 1} / ${data!.length}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        setState(() {
                          if (i < data.length - 1) {
                            i++;
                          } else {
                            i = 0;
                          }
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  height: _height * 0.25,
                  width: _width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(data[0].image),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  data[i].name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalData(title: "Category", value: data[i].order),
                    totalData(title: "Family", value: data[i].family),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalData(title: "Common Name", value: data[i].common_name),
                    totalData(title: "Skin Type", value: data[i].skin_type),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalData(title: "Color", value: data[i].color),
                    totalData(title: "Top Speed", value: data[i].top_speed),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalData(title: "Height", value: data[i].height),
                    totalData(title: "Weight", value: data[i].weight),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalData(title: "Locations", value: data[i].locations),
                    totalData(
                        title: "Name Of Young", value: data[i].name_of_young),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalData(title: "Habitat", value: data[i].habitat),
                    totalData(
                        title: "Feature",
                        value: data[i].most_distinctive_feature),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalData(
                        title: "Biggest Threat", value: data[i].biggest_threat),
                    totalData(
                        title: "Population",
                        value: data[i].estimated_population_size),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    totalData(
                        title: "Group Behavior", value: data[i].group_behavior),
                    totalData(
                        title: "Age Sexual Maturity",
                        value: data[i].age_of_sexual_maturity),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
