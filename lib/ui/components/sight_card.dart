import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/components/sight_image_preloader.dart';
import 'package:places/ui/res/colors.dart';

class SightCard extends StatefulWidget { //Sight card like on SightListScreen
  final Sight sight;

  SightCard(this.sight);

  @override
  _SightCardState createState() => _SightCardState();
}

class _SightCardState extends State<SightCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Ink(
          width: 328,
          height: 188,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: InkWell(
            splashColor: splashColor.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            onTap: () {
              print('tap');
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(this.widget.sight.url,
                      height: 96,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: sightImagePreloader,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        splashRadius: 20.0,
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                            //TODO Add like functionality
                          });
                        },
                        icon: (isLiked) ? Image.asset('res/icons/LikeIconWhiteFull.png') : Image.asset('res/icons/LikeIconWhite.png'),
                      ),
                    ),
                    Align( //Type string
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 16, top: 16),
                        child: Text(widget.sight.type,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(color: white),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(widget.sight.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(widget.sight.details,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subtitle2
                      ),
                    ],
                  ),
                ),
            ],),
          ),
        ),
      )
    );
  }
}
