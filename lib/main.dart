import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// based of code from https://stackoverflow.com/questions/55485466/how-to-detect-tabbar-change-in-flutter

void main() => runApp(TabBarDemo());

class TabBarDemo extends HookWidget {
  final List<Widget> list = [
    Tab(icon: Icon(Icons.card_travel)),
    Tab(icon: Icon(Icons.add_shopping_cart)),
  ];

  @override
  Widget build(BuildContext context) {
    final _controller = useTabController(initialLength: list.length);
    int _selectedIndex = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Center(
                child: Text(
              _selectedIndex.toString(),
              style: TextStyle(fontSize: 40),
            )),
            Center(
                child: Text(
              (_selectedIndex + 1).toString(),
              style: TextStyle(fontSize: 40),
            )),
          ],
        ),
      ),
    );
  }
}

// ----------------

/*
TabController useTabController({@required int length, int initialIndex = 0}) {
  return use(TabControllerHook(length, initialIndex));
}

class TabControllerHook extends Hook<TabController> {
  final int length;
  final int initialIndex;

  const TabControllerHook(this.length, this.initialIndex);

  @override
  HookState<TabController, TabControllerHook> createState() {
    return _TabControllerHookState();
  }
}

class _TabControllerHookState
    extends HookState<TabController, TabControllerHook> {
  @override
  build(BuildContext context) {
    final tickerProvider =
        useSingleTickerProvider(keys: [hook.length, hook.initialIndex]);
    final controller = useMemoized(
        () => TabController(
            length: hook.length,
            vsync: tickerProvider,
            initialIndex: hook.initialIndex),
        [tickerProvider]);

    useEffect(() {
      return controller.dispose;
    }, [controller]);

    return controller;
  }
}
*/
