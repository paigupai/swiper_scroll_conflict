import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swiper_scroll_conflict/swiper_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = List.generate(
        3,
        (index) => SwiperPage(
              title: 'page $index',
            ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Consumer(builder: (context, ref, _) {
        final onTap = ref.watch(onTapProvider);
        return PageView.builder(
          physics: onTap
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return children[index % children.length];
          },
          itemCount: 999,
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
