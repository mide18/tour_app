import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../constants/theme.dart';
import '../../provider/map_state_provider.dart';

class SearchMapBar extends StatelessWidget {
  const SearchMapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapState>();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: TourTheme.cityWhite,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: TourTheme.cityBlack.withOpacity(.2), spreadRadius: 2, blurRadius: 5),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.circle, size: 16, color: TourTheme.cityBlue),
                    Container(width: 4, height: 40, color: TourTheme.cityBlue),
                    Icon(Icons.place, color: TourTheme.cityBlue),
                  ],
                ).paddingHorizontal(4),
                Expanded(
                  child: Column(
                    children: [
                      Focus(
                        focusNode: state.focusNode,
                        child: TextField(
                          controller: state.currentAddressController,
                          keyboardType:
                          TextInputType.phone,
                          onChanged: (value) {
                            state.searchAddress(value);
                          },
                          decoration:
                          const InputDecoration(
                              contentPadding:
                              EdgeInsets
                                  .symmetric(
                                  horizontal:
                                  10),
                              enabledBorder:
                              OutlineInputBorder(),
                              hintText:
                              'Address',
                              focusedBorder:
                              OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TourTheme
                                        .cityBlue),
                              ),
                              border:
                              OutlineInputBorder(),
                              disabledBorder:
                              OutlineInputBorder(),
                              prefixIcon: Icon(
                                  Icons.location_on)),
                        ).paddingBottom(12)
                      ),
                      Focus(
                        focusNode: state.focusNode,
                        child: TextField(
                          controller: state.destinationAddressController,
                          keyboardType:
                          TextInputType.phone,
                          onChanged: (value) {
                            state.searchAddress(value);
                          },
                          decoration:
                          const InputDecoration(
                              contentPadding:
                              EdgeInsets
                                  .symmetric(
                                  horizontal:
                                  10),
                              enabledBorder:
                              OutlineInputBorder(),
                              hintText:
                              'Destination Address',
                              focusedBorder:
                              OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TourTheme
                                        .cityBlue),
                              ),
                              border:
                              OutlineInputBorder(),
                              disabledBorder:
                              OutlineInputBorder(),
                              prefixIcon: Icon(
                                  Icons.location_on)),

                      ),)
                    ],
                  ).paddingRight(12).paddingVertical(12),
                ),
              ],
            ),
          ],
        ),
      ).paddingAll(8),
    );
  }
}