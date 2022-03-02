import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/screen/widget/select_ride.dart';
import 'package:tour_app/screen/widget/take_a_ride.dart';
import 'package:tour_app/screen/widget/tour_cab_button.dart';

import '../../constants/theme.dart';
import '../../models/user.dart';
import '../../provider/map_state_provider.dart';
import 'arrived_at_destination.dart';
import 'confirm_ride.dart';
import 'driver_on_the_way.dart';
import 'in_motion.dart';

class BottomSlider extends StatefulWidget {
  const BottomSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSlider> createState() => _BottomSliderState();
}

class _BottomSliderState extends State<BottomSlider> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapState>();
    final size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.only(bottom: TourTheme.elementSpacing, top: TourTheme.elementSpacing),
      height: _getSliderHeight(state, size),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: TourTheme.cityWhite,
        boxShadow: [
          BoxShadow(
            color: TourTheme.cityBlack.withOpacity(.1),
            spreadRadius: 6,
            blurRadius: 6,
          )
        ],
      ),
      child: PageView(
        onPageChanged: state.onPageChanged,
        controller: state.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TakeARide(),
          ConfirmLocation(),
          SelectRide(),
          ConfirmRide(),
          DriverOnTheWay(),
          InMotion(),
          ArrivedAtDestination(),
        ],
      ),
    );
  }

  double _getSliderHeight(MapState state, Size size) {
    var checkSearching = state.rideState == RideState.searchingAddress;

    if (checkSearching) {
      if (state.endAddress != null) {
        return size.height * 0.2;
      } else {
        return size.height;
      }
    } else {
      if (state.userRepo.currentUserRole == Roles.driver) {
        return size.height * 0.15;
      }
      return size.height * 0.4;
    }
  }
}

class ConfirmLocation extends StatelessWidget {
  const ConfirmLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapState>();
    var checkSearchingEndLocation = state.rideState == RideState.searchingAddress && state.endAddress != null;

    return GestureDetector(
      onTap: () {
        state.closeSearching();
      },
      child: Container(
        color: Colors.transparent,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            runAlignment: WrapAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(TourTheme.elementSpacing),
                child: Column(
                  children: [
                    state.endAddress != null
                        ? SizedBox.shrink()
                        : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: Builder(builder: (context) {
                        if (state.searchedAddress.isEmpty) {
                          return Center(
                            child: Text('No Address Found'),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.searchedAddress.length,
                          itemBuilder: (context, index) {
                            final address = state.searchedAddress[index];
                            return ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              horizontalTitleGap: 0,
                              trailing: Icon(Icons.north_west, size: 16),
                              title: Text('${address.street}, ${address.city}'),
                              subtitle: Text('${address.state}, ${address.country}'),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.place_outlined, color: TourTheme.cityBlue, size: 18),
                                ],
                              ),
                              onTap: () {
                                state.onTapAddressList(address);
                              },
                            );
                          },
                        );
                      }),
                    ),
                    const SizedBox(height: TourTheme.elementSpacing * 2),
                    CityCabButton(
                      title: 'Request Ride',
                      color: TourTheme.cityBlue,
                      textColor: TourTheme.cityWhite,
                      disableColor: TourTheme.cityLightGrey,
                      buttonState: checkSearchingEndLocation ? ButtonState.initial : ButtonState.disabled,
                      onTap: () {
                        state.requestRide();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}