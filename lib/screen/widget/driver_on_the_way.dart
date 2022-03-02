import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/screen/widget/tour_cab_button.dart';

import '../../constants/theme.dart';
import '../../provider/map_state_provider.dart';
import '../ui/rating_card.dart';
import 'bottom_slider_title.dart';

class DriverOnTheWay extends StatelessWidget {
  const DriverOnTheWay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child:  BottomSliderTitle(title: 'YOUR DRIVER IS ON THE WAY'),
        ),
        const SizedBox(height: TourTheme.elementSpacing),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                Icons.timelapse_rounded,
                color: Colors.grey[600],
                size: 18,
              ),
              const SizedBox(width: 4),
             const Text(
                'Pickup in 4:49',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: TourTheme.cityBlue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      color: TourTheme.cityBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Mr Kelvin Feige',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: TourTheme.cityBlack,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const RatingCard(rating: 4),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/vip-car.png',
                    height: 60,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'BMW EOS 400',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: TourTheme.cityBlack,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'CITY-2342534',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TourTheme.cityBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CityCabButton(
                  title: 'Call',
                  color: TourTheme.cityBlue,
                  textColor: TourTheme.cityWhite,
                  disableColor: TourTheme.cityLightGrey,
                  buttonState: ButtonState.initial,
                  onTap: () {
                    state.callDriver();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CityCabButton(
                  title: 'Cancel',
                  color: TourTheme.cityWhite,
                  textColor: TourTheme.cityBlack,
                  disableColor: TourTheme.cityLightGrey,
                  buttonState: ButtonState.initial,
                  borderColor: Colors.grey[800],
                  onTap: () {
                    state.cancelRide();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}