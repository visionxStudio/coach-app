import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/bottom_filter_sheet/coach_bottom_filter_sheet.dart';
import 'package:digicoach/src/common/widgets/input_field/custom_input_filed.dart';
import 'package:digicoach/src/features/home/bloc/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchInputFieldWidget extends ConsumerStatefulWidget {
  const SearchInputFieldWidget({
    Key? key,
  }) : super(key: key);
  @override
  _SearchInputFieldWidgetState createState() => _SearchInputFieldWidgetState();
}

class _SearchInputFieldWidgetState
    extends ConsumerState<SearchInputFieldWidget> {
  final TextEditingController searchController = TextEditingController();
  FocusNode? searchFocusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: InputField(
              borderRadius: 8.0,
              onChanged: (String query) {
                ref.read(searchControllerProvider).search(searchQuery: query);
              },
              controller: searchController,
              hintText: "homepage.search_text".tr(context),
              focusNode: searchFocusNode,
              icon: const Icon(
                Icons.search,
                color: kDarkGrey,
              ),
              suffix: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  IconAsset.searchFilter,
                  color: kDarkGrey,
                  height: 4.0,
                ),
              ),
              suffixTap: () {
                showModalBottomSheet(
                    isDismissible: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0))),
                    context: context,
                    builder: (context) {
                      return const ShowCoachBottomFilterWidget();
                    });
              },
              backgroundColor: kWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
