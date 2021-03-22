import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_get_it_bloc_http/features/presentation/pages/calendar_page.dart';
import 'package:flutter_test_get_it_bloc_http/features/presentation/pages/google_map_page.dart';
import 'package:flutter_test_get_it_bloc_http/features/presentation/pages/vendor_page.dart';
import 'package:flutter_test_get_it_bloc_http/injection_container.dart';
import 'package:geolocator/geolocator.dart';

import 'features/presentation/bloc/province/province_bloc.dart';

void main() {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Position position;
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-.8, -0.8),
            end: Alignment(1.8, -0.5),
            stops: [0.12, 0.93, 0.93],
            colors: [
              Color(0xFF242424),
              Color(0xFF484848),
              Color(0xFF484848),
            ],
          ),
        ),
        child: Center(
          child: BlocProvider(
            create: (context) => ProvinceBloc(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    // gradient: RadialGradient(
                    //   radius: .8,
                    //   colors: [
                    //     Color(0xFF484848),
                    //     Color(0xFF242424).withOpacity(.5),
                    //   ],
                    // ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(-1, -1),
                        // spreadRadius: 1,
                        // blurRadius: 2,
                      ),
                      BoxShadow(
                        offset: Offset(1, 1),
                        color: Colors.white.withOpacity(.2),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print('calendar');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // gradient: RadialGradient(
                        //   radius: 1.1,
                        //   colors: [
                        //     Color(0xFF484848),
                        //     Color(0xFF242424),
                        //   ],
                        // ),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-1, -1),
                            // spreadRadius: 1,
                            // blurRadius: 2,
                          ),
                          BoxShadow(
                            offset: Offset(1, 1),
                            color: Colors.white.withOpacity(.2),
                          ),
                        ],
                      ),
                      child: Text(
                        'Button',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<ProvinceBloc, ProvinceState>(
                  builder: (context, state) {
                    if (state is ProvinceLoading) {
                      return CircularProgressIndicator();
                    } else if (state is ProvinceLoaded) {
                      return Column(
                        children: [
                          ...List.generate(state.listProvince.length,
                              (index) => Text(state.listProvince[index].text))
                        ],
                      );
                    } else {
                      return Text(
                        '_counter',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => VendorPage(
                position: position,
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
