import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/features/auth/bloc/signup_with_mobile/signup_with_mobile_state_notifier.dart';
import 'package:digicoach/src/features/auth/new_auth/mobile_number_page/model/country_code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryCodeDropdown extends ConsumerStatefulWidget {
  const CountryCodeDropdown({Key? key}) : super(key: key);

  @override
  _CountryCodeDropdownState createState() => _CountryCodeDropdownState();
}

/// This is the private State class that goes with CountryCodeDropdown.
class _CountryCodeDropdownState extends ConsumerState<CountryCodeDropdown> {
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
    return Consumer(
      builder: (ctx, ref, child) {
        final state = ref.watch(mobileSignUpStateProvider);

        return DropdownButton<String>(
          value: state.countryCode,
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
          onChanged: (value) {
            ref
                .read(mobileSignUpStateProvider.notifier)
                .countryCodeChanged(value!);
          },
          items: countryCodes.map((String value) {
            return DropdownMenuItem<String>(
              child: Text(value),
              value: value,
            );
          }).toList(),
        );
      },
    );
  }
}
