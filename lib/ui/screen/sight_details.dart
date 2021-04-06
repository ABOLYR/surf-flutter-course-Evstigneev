import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/sight_image_preloader.dart';
import 'package:places/ui/res/colors.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;

  SightDetails(this.sight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 360,
                child: Image.network(this.sight.url,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: sightImagePreloader,
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
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
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(mocks[0].name,
                  style: TextStyle(
                    color: darkPurple,
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
                        color: darkPurple,
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
                          color: grey,
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
                        color: darkPurple,
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
                        color: green,
                          onPressed: () { },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 18,
                                color: white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('построить маршрут',
                                  style: TextStyle(
                                    color: white,
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
                    color: grey,
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
                              color: white,
                              onPressed: () { },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 19,
                                    margin: EdgeInsets.only(right: 9),
                                    color: grey,
                                  ),
                                  Text('Запланировать',
                                    style: TextStyle(
                                      color: grey,
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
                              color: white,
                              onPressed: () { },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 18,
                                    margin: EdgeInsets.only(right: 9),
                                    color: darkPurple,
                                  ),
                                  Text('В Избранное',
                                    style: TextStyle(
                                      color: darkPurple,
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
