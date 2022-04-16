import 'package:elysian_app/ui/reusable/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:elysian_app/models/product.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;

  const SingleProductWidget({Key? key, required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  product.image.toString(),
                  width: double.infinity,
                )),
          ),
          CustomText(
            text: product.name,
            size: 18,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: product.brand,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: "\$${product.price}",
                  size: 22,
                  weight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                  icon: const Icon(Icons.add_shopping_cart), onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
