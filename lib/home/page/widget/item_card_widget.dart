import 'package:crud_opration/core/constants/color_manger.dart';
import 'package:crud_opration/home/data/model/contact_model.dart';
import 'package:flutter/material.dart';

class ItemsCardWidget extends StatefulWidget {
  const ItemsCardWidget({
    super.key,
    required this.index,
    required this.contacteItem,
    required this.nameController,
    required this.numberController,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });
  final int index;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  final List<ContactModle> contacteItem;
  final TextEditingController nameController;
  final TextEditingController numberController;
  @override
  State<ItemsCardWidget> createState() => _ItemsCardWidgetState();
}

class _ItemsCardWidgetState extends State<ItemsCardWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //! CircleAvatar
        leading: CircleAvatar(
          backgroundColor: widget.index % 2 == 0
              ? ColorManger.kMaterialColor
              : ColorManger.kGlodenColor,
          child: Text(
            widget.contacteItem[widget.index].name[0],
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        title: Text(widget.contacteItem[widget.index].name),
        horizontalTitleGap: 30,
        subtitle: Text(widget.contacteItem[widget.index].number),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //! Edit
            IconButton(
              onPressed: widget.onPressedEdit,
              icon: Icon(Icons.edit),
            ),
            //! Delete

            IconButton(
              onPressed: widget.onPressedDelete,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
