import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/components/sight_image_preloader.dart';
import 'package:places/ui/res/colors.dart';

class SightCard extends StatelessWidget { //Sight card like on SightListScreen
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Container(
        width: 328,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Stack(
                children: [
                  Container(
                    height: 96,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)
                      ),
                      child: Image.network(this.sight.url,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: sightImagePreloader,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container( //TODO Icon heart
                        margin: EdgeInsets.only(right: 18, top: 19),
                        color: white,
                        width: 20,
                        height: 18,
                      )
                  ),
                  Align( //Type string
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 16, top: 16),
                      child: Text(sight.type,
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
                  ),
                ],
              ),
            Container(
              width: 328,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                color: whiteSmoke,
              ),
              height: 92,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Text(sight.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: darkPurple,
                        height: 20 / 16,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(sight.details,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
