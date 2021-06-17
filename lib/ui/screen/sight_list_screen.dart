import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/add_sight_action_button.dart';
import 'package:places/ui/components/bottom_navigation_bar.dart';
import 'package:places/ui/components/sight_card.dart';
import 'package:places/ui/components/sight_card_appBar.dart';

import 'add_sight/add_sight_screen.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> { //Screen with list of sights
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SightCardAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: mocks.length,
              itemBuilder: (buildContext, index) {
                return SightCard(mocks[index]);
              }
            ),
            AddSightActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddSightScreen()),)
                    .then((value) {
                      setState(() {});
                    });
              }
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 0),
    );
  }
}
