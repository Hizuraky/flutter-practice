import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/search_tab.dart';
import 'components/setting_tab.dart';
import 'components/location_tab.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final LocationTabKey = GlobalKey();

  @override
  Widget build(context) {
    return
        // ヘッダー
        CupertinoTabScaffold(
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
            });
  }
}
