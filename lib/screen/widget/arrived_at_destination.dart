
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/screen/widget/tour_cab_button.dart';

import '../../constants/theme.dart';
import 'bottom_slider_title.dart';

class ArrivedAtDestination extends StatelessWidget {
  const ArrivedAtDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: BottomSliderTitle(title: 'Arrived At Destination'),
        ),
        const SizedBox(height: 16),
        const RideDetailCard(),
        const SizedBox(height: TourTheme.elementSpacing * 0.5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 20,
                bottom: 25,
                child: Container(
                  width: 2.5,
                  color: Colors.grey[400],
                  height: 80,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(CupertinoIcons.circle_fill, color: TourTheme.cityBlue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Woji, Port Harcourt, Nigeria',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TourTheme.elementSpacing),
                  Row(
                    children: [
                      const Icon(CupertinoIcons.placemark_fill, color: TourTheme.cityBlue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '25, Patterson Trans-Amadi Okujagu, Port Harcourt Nigeria',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: TourTheme.elementSpacing),
          child: CityCabButton(
            title: 'Pay For Ride',
            color: TourTheme.cityBlue,
            textColor: TourTheme.cityWhite,
            disableColor: TourTheme.cityLightGrey,
            buttonState: ButtonState.initial,
            //onTap: () {},
          ),
        ),
      ],
    );
  }
}

class RideDetailCard extends StatelessWidget {
  const RideDetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: TourTheme.cityBlue.withOpacity(.08),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Standard',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\₦5,000',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse_rounded,
                        color: Colors.grey[600],
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Drop-off in 20 mins',
                        style: TextStyle(
                          fontSize: 12,
                          color: TourTheme.cityBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.bolt, color: Colors.orange[300]),
              Image.asset(
                'assets/icons/vip-car.png',
                height: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }
}