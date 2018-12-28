import 'package:flutter/material.dart';
import 'package:flutter_ui_test_2/models.dart';
import 'package:flutter_ui_test_2/selected_options_page.dart';

class FilterPage extends StatefulWidget {
  @override
  FilterPageState createState() {
    return new FilterPageState();
  }
}

class FilterPageState extends State<FilterPage> {
  final _lookingForOptions = <String>['Buy', 'Rent'];
  String _selectedLookingForOptions = 'Buy';

  final _bedroomsOptions = <String>['Any', '1+', '2+', '3+', '4+'];
  String _selectedBedroomOption = 'Any';

  final _minPriceRangeOptions = <int>[
    -1,
    0,
    50000,
    75000,
    100000,
    150000,
    200000,
  ];
  int _selectedMinPriceRange = -1;

  final _maxPriceRangeOptions = <int>[
    -1,
    25000,
    50000,
    75000,
    100000,
    150000,
    200000,
    250000,
  ];

  int _selectedMaxPriceRange = -1;

  final _dropDownTextStyle = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Image.asset(
              'images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40.0),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'I\'m looking to',
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                          DropdownButton(
                            items: _lookingForOptions.map(
                              (item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item,
                                    style: _dropDownTextStyle,
                                  ),
                                  value: item,
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedLookingForOptions = value;
                              });
                            },
                            value: _selectedLookingForOptions,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'How many bedrooms?',
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                          DropdownButton(
                            items: _bedroomsOptions.map(
                              (item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item,
                                    style: _dropDownTextStyle,
                                  ),
                                  value: item,
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedBedroomOption = value;
                              });
                            },
                            value: _selectedBedroomOption,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'What price range',
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: DropdownButton<int>(
                                  items: _minPriceRangeOptions.map(
                                    (item) {
                                      String itemText = "";

                                      if (item == -1) {
                                        itemText = "Minimum";
                                      } else {
                                        itemText = '\$$item';
                                      }

                                      return DropdownMenuItem<int>(
                                        child: Text(
                                          itemText,
                                          style: _dropDownTextStyle,
                                        ),
                                        value: item,
                                      );
                                    },
                                  ).toList(),
                                  value: _selectedMinPriceRange,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedMinPriceRange = value;

                                      if (_selectedMaxPriceRange <=
                                          _selectedMinPriceRange) {
                                        _selectedMaxPriceRange = -1;
                                      }
                                    });
                                  },
                                  hint: Text('Testing'),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Expanded(
                                child: DropdownButton<int>(
                                  items: _maxPriceRangeOptions.where((item) {
                                    return item == -1 ||
                                        item > _selectedMinPriceRange;
                                  }).map(
                                    (item) {
                                      String itemText = "";

                                      if (item == -1) {
                                        itemText = "Any";
                                      } else {
                                        itemText = '\$$item';
                                      }

                                      return DropdownMenuItem<int>(
                                        child: Text(
                                          itemText,
                                          style: _dropDownTextStyle,
                                        ),
                                        value: item,
                                      );
                                    },
                                  ).toList(),
                                  value: _selectedMaxPriceRange,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedMaxPriceRange = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(''),
                        ),
                        Container(
                          width: 2.0,
                          height: 30.0,
                          color: Colors.grey[200],
                        ),
                        Expanded(
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SelectedOptionsPage(
                                        selectedOptions: SelectedOptions(
                                          lookingFor: _selectedLookingForOptions,
                                          bedrooms: _selectedBedroomOption,
                                          minPrice: _selectedMinPriceRange,
                                          maxPrice: _selectedMaxPriceRange,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
