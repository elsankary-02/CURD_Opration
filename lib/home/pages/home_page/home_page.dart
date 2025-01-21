import 'package:crud_opration/core/components/custom_button.dart';
import 'package:crud_opration/core/components/custom_text_field.dart';
import 'package:crud_opration/core/constants/color_manger.dart';
import 'package:crud_opration/core/constants/image_manger.dart';
import 'package:crud_opration/home/data/model/contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contactes = [];
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.kMaterialColor,
        centerTitle: true,
        // AppBar
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
              // name
              CustomTextField(
                hintText: 'name',
                keyboardType: TextInputType.name,
                controller: nameController,
              ),
              SizedBox(height: 20),
              // number

              CustomTextField(
                maxLength: 11,
                hintText: 'number',
                keyboardType: TextInputType.number,
                controller: ageController,
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // save Botton
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      final name = nameController.text;
                      final number = ageController.text;
                      if (name.isNotEmpty && number.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          ageController.text = '';
                          contactes.add(Contact(name: name, number: number));
                        });
                      }
                    },
                    child: CustomButton(
                        backGroundColor: ColorManger.kMaterialColor,
                        titel: 'Save'),
                  ),
                  // Update Botton
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      setState(() {});
                    },
                    child: CustomButton(
                        backGroundColor: ColorManger.kMaterialColor,
                        titel: 'Update'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              contactes.isEmpty
                  ? Expanded(
                      //image
                      child: Image.asset(
                      ImageManger.kNoIteams,
                      fit: BoxFit.cover,
                    ))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: contactes.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              // CircleAvatar
                              leading: CircleAvatar(
                                backgroundColor: index % 2 == 0
                                    ? ColorManger.kMaterialColor
                                    : ColorManger.kGlodenColor,
                                child: Text(
                                  contactes[index].name[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              title: Text(contactes[index].name),
                              horizontalTitleGap: 30,
                              subtitle: Text(contactes[index].number),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {},
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
