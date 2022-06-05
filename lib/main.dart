import 'package:flutter/material.dart';
import 'package:higherror_portfolio/modules/data.dart';
import 'package:higherror_portfolio/routes.dart';

import 'package:higherror_portfolio/theme.dart';
import 'package:higherror_portfolio/widgets/drawer_widget/drawer_widget.dart';
import 'package:higherror_portfolio/widgets/footer_widget/footer_widget.dart';
import 'package:higherror_portfolio/widgets/header_widget/header_widget.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

GlobalKey<ScaffoldState>? _key;

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

void changeDrawerState() {
  if (_key == null) return;
  _key!.currentState!.openEndDrawer();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HighError Portfolio',
      navigatorKey: Data.navigationKey,
      theme: theme,
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final double _minHeaightContent =
        (_size.height - StaticData.headerHeight * 2) < 0
            ? 0
            : (_size.height - StaticData.headerHeight * 2);

    _key = GlobalKey();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: PreferredSize(
          child: HeaderWidget(),
          preferredSize: Size(_size.width, StaticData.headerHeight),
        ),
        extendBodyBehindAppBar: true,
        key: _key,
        endDrawer: const DrawerWidget(),
        endDrawerEnableOpenDragGesture: false,
        body: WebSmoothScroll(
          controller: _scrollController,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: _minHeaightContent,
                ),
                child: widget.child,
              ),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
