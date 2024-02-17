import 'package:flutter/material.dart';
import 'package:admin/responsive.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        Text(
          "Create Company",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}