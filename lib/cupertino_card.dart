import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'coronadata.dart';
import 'country_info.dart';
class CupertinoCard extends StatelessWidget {
  CupertinoCard({Key key, this.record}) : super(key: key);
  final Record record;
  @override
  Widget build(BuildContext context) {
    String state = record.countriesAndTerritories.toString().split(".")[1].replaceAll("_", " ");
    return SafeArea(
        child: CupertinoButton(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/COVID.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text(
                state,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CountryInfo(record: this.record)),
            );
          },
        ),
      );
  }
}