import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../transaction/transaction_screen.dart';
import 'components/side_menu.dart';
import '../modify_card/modify_card_screen.dart';

class MainScreen extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: Beamer(
                key: _beamerKey,
                routerDelegate: BeamerDelegate(
                  transitionDelegate: const NoAnimationTransitionDelegate(),
                  locationBuilder: (routeInformation, _) {
                    if(routeInformation.location!.contains('dashboard'))
                      return DashboardLocation(routeInformation);
                    else if(routeInformation.location!.contains('transaction'))
                      return TransactionLocation(routeInformation);
                    else if(routeInformation.location!.contains('modifycard'))
                      return ModifyCardLocation(routeInformation);
                    else 
                      return DashboardLocation(routeInformation);
                    }
                    //routeInformation.location!.contains('dashboard')
                    //  ? DashboardLocation(routeInformation)
                    //  : TransactionLocation(routeInformation),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardLocation extends BeamLocation<BeamState> {
  DashboardLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/dashboard/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('dashboard'),
      title: 'dashboard',
      child: DashboardScreen(),
    )
  ];
}

class TransactionLocation extends BeamLocation<BeamState> {
  TransactionLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/transaction/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('transaction'),
      title: 'transaction',
      child: TransactionScreen(),
    )
  ];
}

class ModifyCardLocation extends BeamLocation<BeamState> {
  ModifyCardLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/modifycard/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('modifycard'),
      title: 'modifycard',
      child: ModifyCardScreen(),
    )
  ];
}