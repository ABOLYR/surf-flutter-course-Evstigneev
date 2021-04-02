import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/style/Colors.dart';

class SightDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlacesColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 361,
            height: 360,
            color: Colors.blue,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: 32,
                height: 32,
                margin: EdgeInsets.only(top: 36, left: 16,),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 10,
                    ),
                    onPressed: () { },
                  ),
                ),
              )
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(mocks[0].name,
                  style: TextStyle(
                    color: Color(0xff3B3E5B),
                    height: 28.8 / 24,
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Text('Архитектурная доминанта',
                      style: TextStyle(
                        color: Color(0xff3B3E5B),
                        height: 18 / 14,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text('Закрыто до 9:00',
                        style: TextStyle(
                          color: Color(0xff7C7E92),
                          height: 18 / 14,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(mocks[0].details,
                      style: TextStyle(
                        color: Color(0xff3B3E5B),
                        height: 18 / 14,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 48,
                      child: RaisedButton(
                        color: Color(0xff4CAF50),
                          onPressed: () { },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 18,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('построить маршрут',
                                  style: TextStyle(
                                    color: Colors.white,
                                    height: 18 / 14,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Divider(
                    height: 0.8,
                    color: Color(0x907c7e92),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                              elevation: 0,
                              color: PlacesColors.backgroundColor,
                              onPressed: () { },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 19,
                                    margin: EdgeInsets.only(right: 9),
                                    color: Color(0x907c7e92),
                                  ),
                                  Text('Запланировать',
                                    style: TextStyle(
                                      color: Color(0x907c7e92),
                                      height: 18 / 14,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                              elevation: 0,
                              color: PlacesColors.backgroundColor,
                              onPressed: () { },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 18,
                                    margin: EdgeInsets.only(right: 9),
                                    color: Color(0xff3B3E5B),
                                  ),
                                  Text('В Избранное',
                                    style: TextStyle(
                                      color: Color(0xff3B3E5B),
                                      height: 18 / 14,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
