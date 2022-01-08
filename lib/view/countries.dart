import 'package:covid_19/services/utilities/states_service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CoutriesListScreen extends StatefulWidget {
  const CoutriesListScreen({Key? key}) : super(key: key);

  @override
  _CoutriesListScreenState createState() => _CoutriesListScreenState();
}

class _CoutriesListScreenState extends State<CoutriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices services = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "Search With Country Name",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: services.fetchCounriesRecords(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshopt) {
                    if (!snapshopt.hasData) {
                      return ListView.builder(
                          itemCount: snapshopt.data?.length,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      subtitle: Container(
                                          height: 10,
                                          width: 89,
                                          color: Colors.white),
                                      title: Container(
                                          height: 10,
                                          width: 89,
                                          color: Colors.white),
                                      leading: Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.white),
                                    )
                                  ],
                                ));
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshopt.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshopt.data![index]['country'];

                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  ListTile(
                                    subtitle: Text(snapshopt.data![index]
                                            ['cases']
                                        .toString()),
                                    title:
                                        Text(snapshopt.data![index]['country']),
                                    leading: Image.network(
                                      snapshopt.data![index]['countryInfo']
                                          ['flag'],
                                      height: 50,
                                      width: 50,
                                    ),
                                  )
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              print("name value is => $name");
                              print("serach text => ${searchController.text}");
                              print(snapshopt.data![index]['cases'].toString());
                              print(
                                  snapshopt.data![index]['country'].toString());
                              return Column(
                                children: [
                                  ListTile(
                                    subtitle: Text(snapshopt.data![index]
                                            ['cases']
                                        .toString()),
                                    title:
                                        Text(snapshopt.data![index]['country']),
                                    leading: Image.network(
                                      snapshopt.data![index]['countryInfo']
                                          ['flag'],
                                      height: 50,
                                      width: 50,
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }))
        ],
      )),
    );
  }
}
