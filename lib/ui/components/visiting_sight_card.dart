import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/components/sight_image_preloader.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/style.dart';

class VisitingSightCard extends StatelessWidget { //Visiting sight card template
  final Sight sight;
  final String closedTime;
  final String scheduledDate;
  final bool visited;

  VisitingSightCard(this.sight, this.closedTime, this.scheduledDate, {this.visited = false});

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
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, right: 22),
                    child: Container(
                      width: 75,
                      height: 20,
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 23),
                              child: (visited)
                                  ? Icon(
                                      Icons.share,
                                    )
                                  : Icon(
                                      CupertinoIcons.calendar,
                                    )
                          ),
                          Icon(
                              Icons.close,
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    child: Text(sight.type,
                      style: subtitle1TextStyle.copyWith(color: white),
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
                    Text(scheduledDate,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(color: (visited) ? grey : green),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(closedTime,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    )
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
