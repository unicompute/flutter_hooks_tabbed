import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(MaterialApp(home: TabBarDemo()));

class TabBarDemo extends HookWidget {
  final List<Widget> list = [
    const Tab(icon: Icon(Icons.card_travel)),
    const Tab(icon: Icon(Icons.add_shopping_cart)),
    const Tab(icon: Icon(Icons.ac_unit)),
  ];

  @override
  Widget build(BuildContext context) {
    final _controller = useTabController(initialLength: list.length);
    final _index = useState(0);
    final _key = GlobalKey();

    _controller.addListener(() {
      _index.value = _controller.index;
    });

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          onTap: (index) {},
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
              child: Text(
            '1.\n_index:${_index.value}\n_controller.index: ${_controller.index}',
            style: const TextStyle(fontSize: 40),
          )),
          Center(
              child: Text(
            '2.\n_index: ${_index.value}\n_controller.index: ${_controller.index}',
            style: const TextStyle(fontSize: 40),
          )),
          Center(
              child: Text(
            '3.\n_index: ${_index.value}\n_controller.index: ${_controller.index}',
            style: const TextStyle(fontSize: 40),
          )),
        ],
      ),
    );
  }
}
