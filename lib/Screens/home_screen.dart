import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nimbus/bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int code){
switch (code) {
  case >200 && <=300 :
  return Image.asset("assets/1.png");

  case >=300 && <400 :
  return Image.asset("assets/2.png");

 

  case >=500 && <600 :
  return Image.asset("assets/3.png");

  case >=600 && <700 :
  return Image.asset("assets/4.png");

  case >=700 && <800 :
  return Image.asset("assets/5.png");

  case == 800 :
  return Image.asset("assets/6.png");

  case > 800 && <= 804 :
  return Image.asset("assets/7.png");

  
  default:
  return Image.asset("assets/7.png");
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   systemOverlayStyle:
      //       const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Align(
              alignment: const AlignmentDirectional(3, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF673AB7)),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-4, -0.5),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF673AB7)),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, -2.0),
              child: Container(
                height: 300,
                width: 600,
                decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),
            BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
              builder: (context, state) {
if(state is WeatherBlocSuccess) {
return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                       state.weather.areaName.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Good Morning",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      getWeatherIcon(state.weather.weatherConditionCode!),
                     // Image.asset("assets/7.png"),
                       Center(
                        child: Text(
                          "${state.weather.temperature!.celsius!.round()}° C",
                          style: const TextStyle(
                              fontSize: 55,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Center(
                        child: Text(
                          state.weather.weatherMain!.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                     Center(
                        child: Text(
                          DateFormat('EEEE dd .').add_jm().format(state.weather.date!),
                        //  "Saturday 29 : 9.41am",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/11.png",
                                scale: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 const Text(
                                    "Sunrise",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                               const   SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                      DateFormat().add_jm().format(state.weather.sunrise!),
                                  //  "5.34am",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/12.png",
                                scale: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 const  Text(
                                    "Sunset",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                 const  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    DateFormat().add_jm().format(state.weather.sunset!),
                                    style:  const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/13.png",
                                scale: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                             Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 const  Text(
                                    "Temp Max",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                 const  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "${state.weather.tempMax!.celsius!.round()} °C",
                                    style:  const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/14.png",
                                scale: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                             Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                const  Text(
                                    "Temp Min",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                const  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                     "${state.weather.tempMin!.celsius!.round()} °C",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
}else {
  return Container();
}
                
              },
            )
          ]),
        ),
      ),
    );
  }
}
