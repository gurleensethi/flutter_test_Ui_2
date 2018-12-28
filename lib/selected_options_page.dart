import 'package:flutter/material.dart';
import 'package:flutter_ui_test_2/models.dart';

class SelectedOptionsPage extends StatelessWidget {
  final SelectedOptions selectedOptions;

  final _dropDownTextStyle = const TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );

  const SelectedOptionsPage({
    Key key,
    this.selectedOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Looking For:'),
              SizedBox(height: 8.0),
              Text(
                selectedOptions.lookingFor,
                style: _dropDownTextStyle,
              ),
              SizedBox(height: 20.0),
              Text('Bedrooms:'),
              SizedBox(height: 8.0),
              Text(
                selectedOptions.bedrooms,
                style: _dropDownTextStyle,
              ),
              SizedBox(height: 20.0),
              Text('Min Price:'),
              SizedBox(height: 8.0),
              Text(
                _minPriceText,
                style: _dropDownTextStyle,
              ),
              SizedBox(height: 20.0),
              Text('Max Price:'),
              SizedBox(height: 8.0),
              Text(
                _maxPriceText,
                style: _dropDownTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get _minPriceText {
    if (selectedOptions.minPrice == -1) {
      return "Minimum";
    } else {
      return "\$${selectedOptions.minPrice}";
    }
  }

  String get _maxPriceText {
    if (selectedOptions.maxPrice == -1) {
      return "Any";
    } else {
      return "\$${selectedOptions.maxPrice}";
    }
  }
}
