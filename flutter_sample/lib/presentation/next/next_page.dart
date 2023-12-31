import 'package:flutter/material.dart';
import 'package:flutter_sample/constants/route_path.dart';
import 'package:flutter_sample/constants/text_style.dart';
import 'package:flutter_sample/gen/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class NextPage extends ConsumerWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameNext),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  kPageNameNext,
                  style: textStylePlain,
                ),
                Text('textStyleLarge', style: textStyleLarge),
                Text('textStyleMedium', style: textStyleMedium),
                Text('textStylePlane', style: textStylePlain),
                Text('textStyleBold', style: textStyleBold),
                const Text('textStyleNon'),
              ],
            ),
            Lottie.asset(Assets.lottie.programming),
          ],
        ),
      ),
    );
  }
}
