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
                    child: IconButton(
                      splashRadius: 20.0,
                      onPressed: () {
                        print('Like icon pressed');
                      },
                      icon: Image.asset('res/icons/LikeIconWhite.png'),
                    ),
                  ),
                  Align( //Type string
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 16, top: 16),
                      child: Text(sight.type,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(color: white),
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
                color: Theme.of(context).secondaryHeaderColor,
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
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(sight.details,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.subtitle2
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
