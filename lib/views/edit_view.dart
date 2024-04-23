import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/style.dart';
import 'package:flutter_application_1/controllers/home_controller.dart';
import 'package:flutter_application_1/models/item_model.dart';

class EditView extends StatelessWidget {
  final int? index;
  final ItemModel? item;
  const EditView({
    super.key,
    this.index,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: item?.name);
    TextEditingController descriptionController =
        TextEditingController(text: item?.description);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item == null ? 'Thêm' : 'Sửa',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            icon: icon.save,
            onPressed: () {
              if (item != null) {
                homeController.update(
                  index!,
                  ItemModel(
                    id: item!.id,
                    name: nameController.text,
                    description: descriptionController.text,
                  ),
                );
                Navigator.pop(context);
                return;
              } else {
                homeController.add(
                  ItemModel(
                    name: nameController.text,
                    description: descriptionController.text,
                  ),
                );
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: FormField(
          builder: (context) => Column(
            children: [
              themes.boxContainer(
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: nameController,
                    onChanged: (value) => item?.name = value,
                    style: text.primaryTextStyle,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: color.primaryTextColor,
                      ),
                    ),
                  ),
                ),
              ),
              themes.boxContainer(
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: descriptionController,
                    onChanged: (value) => item?.description = value,
                    style: text.primaryTextStyle,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color: color.primaryTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
