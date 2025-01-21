import 'package:crud_opration/core/components/custom_button.dart';
import 'package:crud_opration/core/components/custom_text_field.dart';
import 'package:crud_opration/core/constants/color_manger.dart';
import 'package:crud_opration/core/constants/image_manger.dart';
import 'package:crud_opration/home/data/model/contact_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModle> contacteItem = [];

  final nameController = TextEditingController();
  final numberController = TextEditingController();

  int selectedIndex = 0;
  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.kMaterialColor,
        centerTitle: true,
        //! AppBar
        title: Text(
          'CRUD Opration',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SafeArea(
          child: Column(
            children: [
              //! name
              CustomTextField(
                hintText: 'name',
                keyboardType: TextInputType.name,
                controller: nameController,
              ),
              SizedBox(height: 20),
              //! number

              CustomTextField(
                maxLength: 11,
                hintText: 'number',
                keyboardType: TextInputType.number,
                controller: numberController,
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //! save Botton
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      String name = nameController.text;
                      String number = numberController.text;
                      if (name.isNotEmpty && number.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          numberController.text = '';
                          contacteItem
                              .add(ContactModle(name: name, number: number));
                        });
                      }
                    },
                    child: CustomButton(
                        backGroundColor: ColorManger.kMaterialColor,
                        titel: 'Save'),
                  ),
                  //! Update Botton
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      String name = nameController.text;
                      String number = numberController.text;
                      if (name.isNotEmpty && number.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          numberController.text = '';
                          contacteItem[selectedIndex].name;
                          contacteItem[selectedIndex].number;
                          selectedIndex = -1;
                        });
                      }
                    },
                    child: CustomButton(
                        backGroundColor: ColorManger.kMaterialColor,
                        titel: 'Update'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              contacteItem.isEmpty
                  ? Expanded(
                      //! image
                      child: Image.asset(
                      ImageManger.kNoIteams,
                    ))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: contacteItem.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              //! CircleAvatar
                              leading: CircleAvatar(
                                backgroundColor: index % 2 == 0
                                    ? ColorManger.kMaterialColor
                                    : ColorManger.kGlodenColor,
                                child: Text(
                                  contacteItem[index].name[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              title: Text(contacteItem[index].name),
                              horizontalTitleGap: 30,
                              subtitle: Text(contacteItem[index].number),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //! Edit
                                  IconButton(
                                    onPressed: () {
                                      nameController.text =
                                          contacteItem[index].name;
                                      numberController.text =
                                          contacteItem[index].number;
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  //! Delete

                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        contacteItem.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
