import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// based of code from https://stackoverflow.com/questions/55485466/how-to-detect-tabbar-change-in-flutter

void main() => runApp(MaterialApp(home: TabBarDemo()));

class TabBarDemo extends HookWidget {
  final List<Widget> list = [
    Tab(icon: Icon(Icons.card_travel)),
    Tab(icon: Icon(Icons.add_shopping_cart)),
    Tab(icon: Icon(Icons.ac_unit)),
  ];


  @override
  Widget build(BuildContext context) {

    final _controller = useTabController(initialLength: list.length);
    final _index = useState(0);
    final _key = GlobalKey();

    _controller.addListener(()
      {
        _index.value = _controller.index;
      });

    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
              // _index.value = index;
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('Tabs Demo ${_index.value}'),
        ),
        body: TabBarView(
          key: _key,
          controller: _controller,
          children: [
            Center(
              // key: GlobalKey(),
              child: Text('1.\n_index:${_index.value}\n_controller.index: ${_controller.index}',
              style: TextStyle(fontSize: 40),
            )),
            Center(
              // key: GlobalKey(),
              child: Text('2.\n_index: ${_index.value}\n_controller.index: ${_controller.index}',
              style: TextStyle(fontSize: 40),
            )),
            Center(
              // key: GlobalKey(),
              child: Text('3.\n_index: ${_index.value}\n_controller.index: ${_controller.index}',
              style: TextStyle(fontSize: 40),
            )),
          ],
        ),
      );
  }
}
