import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class LocationTab extends StatefulWidget {
  static const title = '現在地';
  static const androidIcon = Icon(Icons.place);
  static const iosIcon = Icon(CupertinoIcons.placemark_fill);

  const LocationTab({super.key});

  @override
  State<LocationTab> createState() => _LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  static const _itemsLength = 50;
  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();
  late List<MaterialColor> colors;
  late List<String> songNames;

  @override
  void initState() {
    _setData();
    super.initState();
  }

  void _setData() {
    colors = getRandomColors(_itemsLength);
    songNames = getRandomNames(_itemsLength);
  }

  Future<void> _refreshData() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => setState(() => _setData()),
    );
  }

  Widget _test(BuildContext context, int index) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(),
    );
  }

  @override
  Widget build(context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(),
        CupertinoSliverRefreshControl(
          onRefresh: _refreshData,
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                _test,
                childCount: _itemsLength,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
