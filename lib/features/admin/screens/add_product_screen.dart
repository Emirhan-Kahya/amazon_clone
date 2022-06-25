import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../common/widgets/custom_dashed_border.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  List<File> images = [];
  final _addProductFromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  String category = 'Mobiles';
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashions',
  ];

  void sellProduct() {
    if (_addProductFromKey.currentState!.validate() || images.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: nameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: mVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Product',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFromKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: SizedBox(
                          height: 180,
                          width: size.width,
                          child: CustomPaint(
                            painter: CustomDot(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.folder_open,
                                    size: 42, color: Colors.grey),
                                Text(
                                  'Select Product Images',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                CustomTextField(
                    controller: nameController, hintText: 'Product Name'),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: descriptionController,
                    hintText: 'Description',
                    maxLines: 7),
                const SizedBox(height: 10),
                CustomTextField(controller: priceController, hintText: 'Price'),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: quantityController, hintText: 'Quantity'),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    items: productCategories.map(
                      (String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(text: 'Submit', press: sellProduct),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
