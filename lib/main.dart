import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './i18n/message.dart';

void main() => runApp(GetMaterialApp(
      translations: Messages(), // 你的翻译
      locale: Locale('zh', 'CN'),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: '/home',
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      getPages: [
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/other', page: () => Other())
      ],
    ));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class UnknownRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('404')),
    );
  }
}

class Home extends StatelessWidget {
  void changeLocal() {
    print("当前语言" + Get.locale.toString());
    switch (Get.locale.toString()) {
      case 'zh_CN':
        Get.updateLocale(const Locale('en', 'US'));
        break;
      case 'en_US':
        Get.updateLocale(const Locale('zh', 'CN'));
        break;
    }
  }

  @override
  Widget build(context) {
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final Controller c = Get.put(Controller());

    return Scaffold(
        // 使用Obx(()=>每当改变计数时，就更新Text()。
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文！
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text("Go to Other test"),
                onPressed: () => Get.toNamed('/other')),
            TextButton(
                onPressed: () => Get.snackbar('Hi', 'i am a modern snackbar'),
                child: const Text('test snack')),
            TextButton(
                onPressed: () => Get.defaultDialog(
                    onConfirm: () => print("Ok"),
                    middleText: "Dialog made in 3 lines of code"),
                child: const Text('test dialog')),
            TextButton(
                onPressed: () => Get.bottomSheet(Container(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                              leading: const Icon(Icons.music_note),
                              title: const Text('Music'),
                              onTap: () {}),
                          ListTile(
                            leading: const Icon(Icons.videocam),
                            title: const Text('Video'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    )),
                child: const Text('test get bottomSheet')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('english'.tr),
                ElevatedButton(
                    onPressed: changeLocal, child: const Text('改变语言'))
              ],
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // 访问更新后的计数变量
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
