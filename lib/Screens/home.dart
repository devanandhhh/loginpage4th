import 'package:flutter/material.dart';
import 'package:login_page_2/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME '),
        actions: [ 
          IconButton(
              onPressed: () {
                exit(context);
                // signOut(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) => ListTile(
                    title: Text('PERSON ${index + 1}'),
                    subtitle: Text('Message ${index + 1}'),
                    leading: index % 2 == 0
                        ? circlePic(context)
                        : squarePic(context),
                  ),
              separatorBuilder: (ctx, index) => const Divider(),
              itemCount: 30)),
    );
  }

  signOut(ctx) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }

  exit(ctx) {
    showDialog(
        context: ctx,
        builder: (ctx1) => AlertDialog(
              title: const Text('Do you want to Exit'),
              actions: [
                TextButton(
                  onPressed: () {
                    signOut(ctx1);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx1).pop();
                    },
                    child: const Text('No'))
              ],
            ));
  }

  circlePic(ctx) {
    return const CircleAvatar(
      radius: 29,
      backgroundColor: Colors.blueGrey,
      backgroundImage: NetworkImage(
          'https://phantom-marca.unidadeditorial.es/f49fe109fd9d688b5c6a4562df3115f2/resize/828/f/jpg/assets/multimedia/imagenes/2023/09/20/16952383458235.png'),
    );
  }

  squarePic(ctx1) {
    return Image.network(
        "https://cdn.vox-cdn.com/thumbor/5WabOR79OqtxHblAta0eEZrcZbg=/0x0:3300x2247/1200x800/filters:focal(1442x156:1970x684)/cdn.vox-cdn.com/uploads/chorus_image/image/58435547/56034291.jpg.0.jpg",
        height: 70,
        width: 60);
  }
}
