
import '../models/ride_option.dart';

List<RideOption> rideOptions = [
  RideOption(
    id: '00',
    title: 'Stardard',
    timeOfArrival: DateTime.now().add(const Duration(minutes: 5)),
    price: 500,
    icon: IconAssets.standardCar,
  ),
  RideOption(
    id: '01',
    title: 'Premium',
    timeOfArrival: DateTime.now().add(const Duration(minutes: 3)),
    price: 1000,
    icon: IconAssets.premiumCar,
  ),
  RideOption(
    id: '02',
    title: 'VIP',
    timeOfArrival: DateTime.now().add(const Duration(minutes: 2)),
    price: 2000,
    icon: IconAssets.vipCar,
  ),
];