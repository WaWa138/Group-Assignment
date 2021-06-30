
import 'package:flutter/material.dart';

enum TabItem { main, contacts, profile }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.main: TabItemData(title: 'Main page', icon: Icons.home),
    TabItem.contacts: TabItemData(title: 'Contacts', icon: Icons.view_headline),
    TabItem.profile: TabItemData(title: 'Account', icon: Icons.person),
  };
}