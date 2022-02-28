import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/map_state_provider.dart';
import '../repository/user_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.grey[200],
        child: ValueListenableBuilder<User?>(
          valueListenable: UserRepository.instance.userNotifier,
          builder: (context, value, child) {
            if (value != null) {
              return Builder(
                builder: (context) {
                  if (value.isVerified) {
                    return MapViewWidget();
                  } else {
                    return AuthPageWidget(page: 2, uid: value.uid);
                  }
                },
              );
            } else {
              return AuthPageWidget(page: 0);
            }
          },
        ),
      ),
    );
  }
}

class MapViewWidget extends StatelessWidget {
  const MapViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = MapState();
    return ChangeNotifierProvider(create: (_) => state,
    child: ,
    );
  }
}
