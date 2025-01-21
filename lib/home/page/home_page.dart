import 'package:auto_route/annotations.dart';
import 'package:crud_opration/core/components/custom_button.dart';
import 'package:crud_opration/core/components/custom_text_field.dart';
import 'package:crud_opration/core/constants/color_manger.dart';
import 'package:crud_opration/core/constants/image_manger.dart';
import 'package:crud_opration/home/data/model/contact_model.dart';
import 'package:crud_opration/home/page/widget/item_card_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final List<ContactModle> contacteItem = [];

  final nameController = TextEditingController();
  final numberController = TextEditingController();

  late int selectedIndex = 0;
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //! Custom Text Field name
                CustomTextField(
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return 'valid';
                    } else {
                      return 'this field cannot be empty';
                    }
                  },
                  hintText: 'name',
                  keyboardType: TextInputType.name,
                  controller: nameController,
                ),
                SizedBox(height: 20),
                //! Custom Text Field number
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this field cannot be empty';
                    } else if (value.length != 11) {
                      return 'Type 11 numbers';
                    }
                    return 'valid';
                  },
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
                        formKey.currentState!.validate();
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
                        titel: 'Update',
                      ),
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
                            return ItemsCardWidget(
                              //! on Pressed Delete
                              onPressedDelete: () {
                                setState(() {
                                  contacteItem.removeAt(index);
                                });
                              },
                              //! on Pressed Edit
                              onPressedEdit: () {
                                nameController.text = contacteItem[index].name;
                                numberController.text =
                                    contacteItem[index].number;
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              nameController: nameController,
                              numberController: numberController,
                              index: index,
                              contacteItem: contacteItem,
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
