import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_mall_grid_view/controller/controller.dart';
import 'package:shopping_mall_grid_view/view/product_tile.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Obx(
        () => Controller.to.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                  child: Obx(
                    () => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return ProductTile(Controller.to.productList[index]);
                      },
                      itemCount: Controller.to.productList.length,
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Obx(() => Text('Item: ${Controller.to.productsInCartList.length}')),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
