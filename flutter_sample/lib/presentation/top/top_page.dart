import 'package:flutter/material.dart';
import 'package:flutter_sample/constants/route_path.dart';
import 'package:flutter_sample/model/my_value.dart';
import 'package:flutter_sample/scaffold_messenger.dart';
import 'package:flutter_sample/util/logger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameTop),
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                logger.d('test');
                ref.watch(scaffoldMessengerHelperProvider).showSnackBar('test');
                context.push(kPagePathNext);
              },
              child: const Text(kPageNameNext),
            ),
            const SizedBox(
              height: 100,
            ),
            Text(ref.read(countryProvider)),
            ref.watch(counterProvider).when(
              data: (value) {
                return Text(value.toString());
              },
              error: (_, __) {
                return const Text('エラーが発生しました。');
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.watch(incrementProvider);
                    },
                    child: Text("increment")),
                ElevatedButton(
                    onPressed: () {
                      ref.watch(decrementProvider);
                    },
                    child: Text("decrement")),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  ref.watch(closeProvider);
                },
                child: Text("close")),
          ],
        ),
      ),
    );
  }
}
