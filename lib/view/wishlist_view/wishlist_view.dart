import 'package:flutter/material.dart';
import 'package:spot_it/core/widgets/buttons/custom_drawer_button.dart';
import 'package:spot_it/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:spot_it/view/wishlist_view/components/wishlist_body.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: CustomDrawerButton(onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        }),
        leadingWidth: 80,
      ),
      // ~~~~ Drawer
      drawer: const CustomDrawer(),
      // Scaffold Body

      // Wishliost Body
      body: const WishlistBody(),
    );
  }
}
