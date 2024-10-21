import 'package:flutter/material.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/view/place_details_view/details_body.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        backgroundColor: kAppBarColor,
        scrolledUnderElevation: 0,
      ),
      body: const PlaceDetailsBody(),
    );
  }
}
