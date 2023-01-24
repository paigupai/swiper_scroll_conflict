import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onTapProvider = StateProvider<bool>((ref) {
  return false;
});

class SwiperPage extends StatelessWidget {
  const SwiperPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'images/bg.jpeg',
      'images/bg0.jpeg',
      'images/bg1.jpeg',
      'images/bg2.jpeg',
    ];

    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 200,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                images[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: images.length,
            viewportFraction: 0.8,
            scale: 0.9,
            control: const SwiperControl(),
            pagination: const SwiperPagination(),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Consumer(builder: (context, ref, _) {
          return Listener(
            onPointerDown: (_) {
              ref.watch(onTapProvider.notifier).update((state) => true);
            },
            onPointerUp: (_) {
              ref.watch(onTapProvider.notifier).update((state) => false);
            },
            child: Swiper(
              layout: SwiperLayout.CUSTOM,
              customLayoutOption:
                  CustomLayoutOption(startIndex: -1, stateCount: 3)
                    ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                    ..addTranslate(const [
                      Offset(-370.0, -40.0),
                      Offset(0.0, 0.0),
                      Offset(370.0, -40.0)
                    ]),
              itemWidth: 300.0,
              itemHeight: 200.0,
              outer: false,
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: images.length,
            ),
          );
        }),
      ],
    );
  }
}
