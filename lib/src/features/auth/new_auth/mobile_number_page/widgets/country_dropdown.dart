import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/features/auth/new_auth/mobile_number_page/model/country_code_model.dart';
import 'package:flutter/material.dart';

class CountryCodeDropdown extends StatefulWidget {
  const CountryCodeDropdown({Key? key}) : super(key: key);

  @override
  State<CountryCodeDropdown> createState() => _CountryCodeDropdownState();
}

/// This is the private State class that goes with CountryCodeDropdown.
class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  String dropdownValue = '+977';

  List<String> countryCodes = [];
  final CountryCodeModel countryCodeModel =
      CountryCodeModel(countryName: "", dialCode: "", isoCode: "");

  @override
  void initState() {
    super.initState();
    countryCodes = countryCodeModel.getCountryCode().map((element) {
      return element.dialCode;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const RotatedBox(
        quarterTurns: 3,
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: 14.0,
          color: kPrimaryColor,
        ),
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: kPrimaryColor, fontSize: 14.0),
      underline: Container(
        height: 0,
        color: kScafoldColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: countryCodes.map((String value) {
        return DropdownMenuItem<String>(
          child: Text(value),
          value: value,
        );
      }).toList(),
    );
  }
}
