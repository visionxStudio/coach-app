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
    final searchProvider = ref.watch(searchControllerProvider);

    return Consumer(
      builder: (context, ref, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: InputField(
                  // onTap: () {
                  //   ref
                  //       .read(searchControllerProvider)
                  //       .toggleIsSearching(value: true);
                  // },
                  onChanged: (String query) {
                    ref
                        .read(searchControllerProvider)
                        .search(searchQuery: query);
                  },
                  controller: searchController,
                  hintText: "Chercher un coachs",
                  focusNode: searchFocusNode,
                  icon: const Icon(
                    Icons.search,
                    color: kPrimaryColor,
                  ),
                  suffix: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      width: 50.0,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.tune,
                              color: kPrimaryColor,
                            ),
                            const SizedBox(height: 8.0),
                            searchProvider.isSearching
                                ? GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(searchControllerProvider)
                                          .toggleIsSearching(value: false);
                                    },
                                    child: Container(
                                      height: 14.0,
                                      width: 14.0,
                                      decoration: BoxDecoration(
                                        color: kLightGreyColor,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.close,
                                          size: 8.0,
                                          color: kBlackColor,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
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
                  backgroundColor: kSearch,
                ),
              ),
              searchProvider.isSearching
                  ? GestureDetector(
                      onTap: () {
                        ref
                            .read(searchControllerProvider)
                            .toggleIsSearching(value: false);
                        searchController.text = "";
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
