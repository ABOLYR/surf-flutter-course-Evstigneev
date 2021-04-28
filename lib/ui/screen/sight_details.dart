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
      backgroundColor: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
                    ),
                    width: 32,
                    height: 32,
                    margin: EdgeInsets.only(top: 36, left: 16,),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 10,
                          color: Theme.of(context).primaryIconTheme.color,
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
                  style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  children: [
                    Text('Архитектурная доминанта',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text('Закрыто до 9:00',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(mocks[0].details,
                      style: Theme.of(context).textTheme.bodyText1,
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
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(color: white),
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
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      return Theme.of(context).primaryColor;
                                    },
                                  ),
                              ),
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
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: grey),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return Theme.of(context).primaryColor;
                                  },
                                ),
                              ),
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
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: darkPurple),
                                  ),
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
