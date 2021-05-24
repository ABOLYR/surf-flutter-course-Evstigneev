import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/services/nearby_sights.dart';
import 'package:places/ui/components/filter/distance_slider.dart';
import 'package:places/ui/components/filter/filter_type_icon.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/style.dart';
import 'package:places/mocks.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {
              print('Back');
            },
              child: Image.asset("res/icons/BackArrow.png")
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: TextButton(
                onPressed: () {
                  for (int i = 0; i < checked.length; i++) {
                    checked[i] = false;
                  }
                  setState(() {
                    selectedTypesList = [];
                    selectedSights = filterSelection(sightsNearby, selectedTypesList);
                  });
                },
              child: Text(
                'Очистить',
                style: headline2TextStyle,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text('Категории',
                      style: headline1TextStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    padding: EdgeInsets.symmetric(horizontal: 40.5),
                    child: GridView.builder(
                      itemCount: type.length,
                      shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                              onTap: () {
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
                              child: FilterCategoryIcon( typeName[index], type[index], checked[index])
                          );
                        },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 56),
                      child: DistanceSlider(
                        onChangeEnd: (matches) {
                          setState(() {
                            sightsNearby = matches;
                            selectedSights = filterSelection(sightsNearby, selectedTypesList);
                          });
                        },
                      )
                  ),
                ],
              ),
            ),
            SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: 328,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: filterScreenLightColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )
                        ),
                        onPressed: () {
                          print('Filtered Sights $selectedSights');
                        },
                        child: Text('Показать (${selectedSights.length})'),
                      ),
                    ),
                  ),
                )
            ),
          ]
        ),
      ),
    );
  }
}
