import 'package:flutter/material.dart';

import 'package:httpjson/model.dart';
import '../api_service.dart';
import '../index.dart';



class homepage extends State<baseApp>{

  late List<Countries>? countryModel = [];

  @override
  void initState() {
     super.initState();
     _getUsers();


  }

  void _getUsers() async{
    countryModel = (await ApiService().getUsers()) ;
    Future.delayed(const Duration(seconds: 30)).then((value) =>setState(() {}));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Country List App"),
      ),
      backgroundColor: Colors.grey,


      body: countryModel == null || countryModel!.isEmpty
            ? const Center(
              child: CircularProgressIndicator(),

      )
          :ListView.builder(
          itemCount: countryModel!.length,
          itemBuilder: (context, index){
            return Card(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(countryModel![index].name!.official.toString()),
                      Text(countryModel![index].capital.toString()),
                    ],
                  )
                ],
              ),
            );
          }

      )




      // body: Container(
      //   alignment: Alignment.topLeft,
      //   margin: const EdgeInsets.only(left: 5.0, top: 5.0),
      //   child: Column(
      //     children: <Widget>[
      //       Image.asset(
      //
      //         'assets/images/ex_logo.png',
      //         width: 100.0,      //         height: 150.0,
      //       ),
      //
      //     ],
      //   ),
      //
      // )



    );
  }

}

