import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/services/nearby_sights.dart';
import 'package:places/ui/components/filter/appbar.dart';
import 'package:places/ui/components/filter/list_view.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/main_action_button.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_content.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<bool> checked = [];
  List<String> selectedTypesList = [];
  List<Sight> sightsNearby = [];
  List<String> type = [];
  List<String> typeName = [];
  List<Sight> selectedSights = [];
  Map<String, double> locationPoint = {
    'lat': 40.4383117433301,
    'lon': 116.57859470410664,
  };
  Map<String, double> radius = {
    'min': 0.1,
    'max': 10.0
  };

  @override
  void initState() {
    categoriesList();
    sightsNearby = NearbySights().sightsList(locationPoint, radius);
    selectedSights = sightsNearby;
    super.initState();
  }

  void categoriesList() {
    for(int i = 0; i < mocks.length; i++){
      if (!type.contains(mocks[i].meta['type'])) {
        type.add(mocks[i].meta['type']);
        typeName.add(mocks[i].type);
        checked.add(false);
      }
    }
  }

  List<Sight> filterSelection(List<Sight> sightsNearby, List<String> categories) {
    List<Sight> result = [];
    if (categories.isEmpty) {
      return result = sightsNearby;
    }
    if (sightsNearby.isEmpty) {
      return sightsNearby;
    }
    for (int i = 0; i < sightsNearby.length; i++) {
      if (categories.contains(sightsNearby[i].meta['type'])) {
        result.add(sightsNearby[i]);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FiltersScreenAppBar(
        height: AppBar().preferredSize.height,
        onTap: () {
          for (int i = 0; i < checked.length; i++) {
            checked[i] = false;
          }
          setState(() {
            selectedTypesList = [];
            selectedSights = filterSelection(sightsNearby, selectedTypesList);
          });
        }
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 24),
        child: Column(
          children: [
            FiltersScreenListView(
              checked: checked,
              type: type,
              typeName: typeName,
              onTap: (index) {
                if (!checked[index]) {
                  setState(() {
                    checked[index] = true;
                    selectedTypesList.add(type[index]);
                  });
                }else{
                  setState(() {
                    checked[index] = false;
                    selectedTypesList.removeWhere((element) => element == type[index]);
                  });
                }
                setState(() {
                  selectedSights = filterSelection(sightsNearby, selectedTypesList);
                });
              },
              onChangeEnd: (matches) {
                setState(() {
                  sightsNearby = matches;
                  selectedSights = filterSelection(sightsNearby, selectedTypesList);
                });
              },
            ),
            MainActionButton(
              onPressed: () => print('Filtered Sights $selectedSights'),
              content: Text('${TextContent.filtersButton[1]} (${selectedSights.length})'),
              color: filterScreenLightColor,
            ),
          ]
        ),
      ),
    );
  }
}
