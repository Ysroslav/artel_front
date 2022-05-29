import 'package:flutter/material.dart';
import 'package:web_artel/functions.dart';

import 'menu_item.dart' as menu;
import 'dropdown_button.dart' as dropdown;


class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/logos/main_logo.png",
            height: 50,
            alignment: Alignment.topCenter,
          ),
          const Spacer(),
          menu.MenuItem(
            key: const Key("home"),
            title: "Home",
            press: () => navigate('/', context),
          ),
          menu.MenuItem(
            key: const Key("about"),
            title: "About",
            press: () {},
          ),
          menu.MenuItem(
            key: const Key("pricing"),
            title: "Pricing",
            press: () => navigate('/pricing', context),
          ),
          menu.MenuItem(
            key: const Key("contact"),
            title: "Contact",
            press: () {},
          ),
          menu.MenuItem(
            key: const Key("login"),
            title: "Login",
            press: () {},
          ),
          const dropdown.DropdownButtonWidget(
            defaultValue: "EN",
            items: <String>["EN", "DE", "CH", "RU"]
          )
        ],
      ),
    );
  }

}