import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/style.dart';
import 'package:flutter_application_1/controllers/home_controller.dart';
import 'package:flutter_application_1/models/item_model.dart';
import 'package:flutter_application_1/views/edit_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: icon.add,
                onPressed: () {
                  showModalBottomSheet<String?>(
                    context: context,
                    builder: (context) => const EditView(),
                  );
                },
              ),
            )
          ],
        ),
        body: Center(
          child: ListenableBuilder(
            listenable: homeController,
            builder: (context, _) => ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  themes.items(context, index, items[index]),
            ),
          ),
        ),
      ),
    );
  }
}
