import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class CategoryDealScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryDealScreen> createState() => _CategoryDealScreenState();
}

class _CategoryDealScreenState extends State<CategoryDealScreen> {
  List<Product>? productsList = [];
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productsList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: productsList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shopping for ${widget.category}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 15),
                      itemCount: productsList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (context, index) {
                        final product = productsList![index];
                        return Column(
                          children: [
                            SizedBox(
                              height: 130,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(
                                    product.images[0],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 5,
                                right: 15,
                              ),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
