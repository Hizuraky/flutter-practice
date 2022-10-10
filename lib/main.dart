import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/search_tab.dart';
import 'components/setting_tab.dart';
import 'components/settings_tab.dart';
import 'components/location_tab.dart';
import 'widgets.dart';

void main() => runApp(const MyAdaptingApp());

class MyAdaptingApp extends StatelessWidget {
  const MyAdaptingApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'お天気アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: const PlatformAdaptingHomePage(),
    );
  }
}

class PlatformAdaptingHomePage extends StatefulWidget {
  const PlatformAdaptingHomePage({super.key});

  @override
  State<PlatformAdaptingHomePage> createState() =>
      _PlatformAdaptingHomePageState();
}

class _PlatformAdaptingHomePageState extends State<PlatformAdaptingHomePage> {
  final LocationTabKey = GlobalKey();

  Widget _buildAndroidHomePage(BuildContext context) {
    return LocationTab(
      key: LocationTabKey,
      androidDrawer: _AndroidDrawer(),
    );
  }

  Widget _buildIosHomePage(BuildContext context) {
    // ヘッダー
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            label: LocationTab.title,
            icon: LocationTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: SearchTab.title,
            icon: SearchTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: SettingTab.title,
            icon: SettingTab.iosIcon,
          ),
        ],
      ),

      // ボトムタブ
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              defaultTitle: LocationTab.title,
              builder: (context) => LocationTab(key: LocationTabKey),
            );
          case 1:
            return CupertinoTabView(
              defaultTitle: SearchTab.title,
              builder: (context) => const SearchTab(),
            );
          case 2:
            return CupertinoTabView(
              defaultTitle: SettingTab.title,
              builder: (context) => const SettingTab(),
            );
          default:
            assert(false, 'Unexpected tab');
            return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}

class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.account_circle,
                color: Colors.green.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile(
            leading: LocationTab.androidIcon,
            title: const Text(LocationTab.title),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SearchTab.androidIcon,
            title: const Text(SearchTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const SearchTab()));
            },
          ),
          ListTile(
            leading: SettingTab.androidIcon,
            title: const Text(SettingTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const SettingTab()));
            },
          ),
          // Long drawer contents are often segmented.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          ListTile(
            leading: SettingsTab.androidIcon,
            title: const Text(SettingsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const SettingsTab()));
            },
          ),
        ],
      ),
    );
  }
}
