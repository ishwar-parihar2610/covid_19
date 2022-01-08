import 'package:covid_19/model/world_state.dart';
import 'package:covid_19/services/utilities/states_service.dart';
import 'package:covid_19/view/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldScreenState extends StatefulWidget {
  const WorldScreenState({Key? key}) : super(key: key);

  @override
  _WorldScreenStateState createState() => _WorldScreenStateState();
}

class _WorldScreenStateState extends State<WorldScreenState>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 5))
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final colorList = <Color>[
    Color(0XFF4285f4),
    Color(0XFF1aa260),
    const Color(0XFFde5246)
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    //statesServices.fetchCounriesRecords();

    return Scaffold(
        floatingActionButton: FloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: statesServices.fetchWorldStatesRecords(),
                      builder: (context, AsyncSnapshot<WorldState> snapshot) {
                        if (!snapshot.hasData) {
                          return Expanded(
                              flex: 1,
                              child: SpinKitFadingCircle(
                                color: Colors.white,
                                size: 50.0,
                                controller: _controller,
                              ));
                        } else {
                          return Column(
                            children: [
                              PieChart(
                                legendOptions: LegendOptions(
                                    legendPosition: LegendPosition.left),
                                chartRadius:
                                    MediaQuery.of(context).size.width / 3.2,
                                dataMap: {
                                  "Today case": double.parse(
                                      snapshot.data!.todayCases.toString()),
                                  "Recovered": double.parse(
                                      snapshot.data!.recovered.toString()),
                                  "Deaths": double.parse(
                                      snapshot.data!.deaths.toString())
                                },
                                chartValuesOptions: ChartValuesOptions(
                                    showChartValuesInPercentage: true),
                                chartType: ChartType.disc,
                                animationDuration: Duration(seconds: 5),
                                colorList: colorList,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  ReusableRow(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Recovered',
                                    value: snapshot.data!.recovered.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Active',
                                    value: snapshot.data!.active.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Critical',
                                    value: snapshot.data!.critical.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Today Deaths',
                                    value:
                                        snapshot.data!.todayDeaths.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered
                                        .toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Today Cases',
                                    value: snapshot.data!.todayCases.toString(),
                                  )
                                ],
                              ),
                            ],
                          );
                        }
                      })
                ]))));
  }

  Widget FloatingActionButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CoutriesListScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xff1aa260), borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text("Track Countires",
              style: GoogleFonts.roboto(
                  fontSize: 15, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String? title;
  String? value;

  ReusableRow({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title!),
              SizedBox(
                height: 1,
              ),
              Text(value!),
            ],
          ),
          SizedBox(height: 5),
          Divider()
        ],
      ),
    );
  }
}
