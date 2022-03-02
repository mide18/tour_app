import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/provider/auth_state_provider.dart';
import 'package:tour_app/screen/otp_screen.dart';

import '../../constants/theme.dart';

class AuthPage extends StatefulWidget {
  final int page;
  final String? uid;
  const AuthPage({Key? key,
  this.page = 0,
    this.uid
  }) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AuthState>(context);
    return Builder(builder: (context) {
      return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: PageView(
              controller: state.controller,
              onPageChanged: state.onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/city.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              TextField(
                                controller: state.phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    enabledBorder: OutlineInputBorder(),
                                    hintText: 'Enter Phone Number',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: TourTheme.cityBlue),
                                    ),
                                    border: OutlineInputBorder(),
                                    disabledBorder: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.phone)),
                              ),
                              const OtpPage(),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                          height: kToolbarHeight * 0.6),
                                      Text(
                                        'Set Up Account',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ).paddingBottom(
                                          TourTheme.elementSpacing / 2),
                                      Text(
                                        'Fill the details below...',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ).paddingBottom(TourTheme.elementSpacing),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller:
                                                  state.firstNameController,
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(),
                                                  hintText: 'First Name',
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            TourTheme.cityBlue),
                                                  ),
                                                  border: OutlineInputBorder(),
                                                  disabledBorder:
                                                      OutlineInputBorder(),
                                                  prefixIcon:
                                                      Icon(Icons.phone)),
                                            ),
                                          ),
                                          const SizedBox(
                                              width: TourTheme.elementSpacing),
                                          Expanded(
                                            child: TextField(
                                              controller:
                                                  state.lastNameController,
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(),
                                                  hintText: 'Last Name',
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            TourTheme.cityBlue),
                                                  ),
                                                  border: OutlineInputBorder(),
                                                  disabledBorder:
                                                      OutlineInputBorder(),
                                                  prefixIcon:
                                                      Icon(Icons.phone)),
                                            ),
                                          ),
                                        ],
                                      ).paddingBottom(TourTheme.elementSpacing),
                                      TextField(
                                        controller: state.emailController,
                                        keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            enabledBorder: OutlineInputBorder(),
                                            hintText: 'Email',
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: TourTheme.cityBlue),
                                            ),
                                            border: OutlineInputBorder(),
                                            disabledBorder:
                                                OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.phone)),
                                      ).paddingBottom(TourTheme.elementSpacing),
                                      Row(
                                        children: [
                                          CupertinoSwitch(
                                            value: state.isRoleDriver,
                                            onChanged: (v) {
                                              state.changeRoleState =
                                                  v == true ? 1 : 0;
                                            },
                                          ),
                                          const SizedBox(
                                              width: TourTheme.elementSpacing *
                                                  0.5),
                                          Text(
                                            'I\'m a Driver',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                        ],
                                      ).paddingBottom(TourTheme.elementSpacing),
                                      Builder(builder: (context) {
                                        if (state.isRoleDriver == false)
                                          return const SizedBox.shrink();
                                        return Column(
                                          children: [
                                            TextField(
                                              controller: state.phoneController,
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(),
                                                  hintText: 'Vehicle Type',
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            TourTheme.cityBlue),
                                                  ),
                                                  border: OutlineInputBorder(),
                                                  disabledBorder:
                                                      OutlineInputBorder(),
                                                  prefixIcon:
                                                      Icon(Icons.phone)),
                                            ).paddingBottom(
                                                TourTheme.elementSpacing),
                                            TextField(
                                              controller: state
                                                  .vehicleManufacturersController,
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(),
                                                  hintText:
                                                      'Vehicle Manufacturer',
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            TourTheme.cityBlue),
                                                  ),
                                                  border: OutlineInputBorder(),
                                                  disabledBorder:
                                                      OutlineInputBorder(),
                                                  prefixIcon:
                                                      Icon(Icons.phone)),
                                            ).paddingBottom(
                                                TourTheme.elementSpacing),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    controller: state
                                                        .vehicleColorController,
                                                    keyboardType:
                                                        TextInputType.phone,
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
                                                                'Vehicle Color',
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
                                                                Icons.phone)),
                                                  ),
                                                ),
                                                const SizedBox(
                                                    width: TourTheme
                                                        .elementSpacing),
                                                Expanded(
                                                  child: TextField(
                                                    controller: state
                                                        .licensePlateController,
                                                    keyboardType:
                                                        TextInputType.phone,
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
                                                                'License plate',
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
                                                                Icons.phone)),
                                                  ),
                                                ),
                                              ],
                                            ).paddingBottom(
                                                TourTheme.elementSpacing),
                                          ],
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}

class AuthPageWidget extends StatelessWidget {
  final int page;
  final String? uid;

  const AuthPageWidget({
    Key? key,
    required this.page,
    this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = AuthState(page, uid ?? '');
    return ChangeNotifierProvider(
      create: (_) => state,
      child: ChangeNotifierProvider.value(
        value: state,
        child: AuthPage(page: page, uid: uid),
      ),
    );
  }
}
