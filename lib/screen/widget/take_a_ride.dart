import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/screen/widget/tour_cab_button.dart';

import '../../constants/my_address.dart';
import '../../constants/theme.dart';
import '../../provider/map_state_provider.dart';
import '../ui/address_card.dart';

class TakeARide extends StatelessWidget {
  const TakeARide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapState>();

    return Builder(builder: (context) {
      final isUserDriver = state.userRepo.currentUser?.isDriverRole ?? false;

      if (isUserDriver == true) {
        return Padding(
          padding:  EdgeInsets.all(TourTheme.elementSpacing),
          child: CityCabButton(
            title: state.isActive ? 'Go Offline' : 'Go Online',
            textColor: Colors.white,
            color: state.isActive ? Colors.green : Colors.red,
            onTap: () {
              state.changeActivePresence();
            },
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                state.searchLocation();
              },
              child: Container(
                height: 54,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enter Your Destination...',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                    Icon(Icons.search, size: 30),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: List.generate(
                myAddresses.length,
                    (index) {
                  final address = myAddresses[index];
                  return AddressCard(
                    address: address,
                    onTap: () {
                      state.onTapMyAddresses(address);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}