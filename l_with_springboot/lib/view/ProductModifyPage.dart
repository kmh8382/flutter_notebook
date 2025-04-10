import 'package:flutter/material.dart';
import 'package:l_with_springboot/product/Product.dart';
import 'package:l_with_springboot/viewmodel/ProductProvider.dart';
import 'package:provider/provider.dart';

class ProductModifyPage extends StatelessWidget {

  ProductModifyPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _desctiptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // 전달된 arguments (수정하기 이전의 product)
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    _nameController.text = product.name;
    _priceController.text = product.price.toString();
    _desctiptionController.text = product.description;

    return Scaffold(
        appBar: AppBar(title: const Text("Product Modify")),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:  6.0, horizontal:  32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "상품명"),
                    validator: (String? value) => value!.isEmpty ? "상품명 입력" : null,
                    controller: _nameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "상품가격"),
                    validator: (String? value) => int.parse(value!) <= 0 ? "상품가격 오류" : null,
                    controller: _priceController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "상품개요"),
                    validator: (String? value) => value!.isEmpty ? "상품개요 입력" : null,
                    controller: _desctiptionController,
                  ),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();  // 뒤로가기 (AlertDialog 닫기)
                        },
                        child: const Text("취소"),
                      ),
                      SizedBox(width: 10.0,),
                      ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()) { // Form 내부의 모든 TextFormField 의 validator 콜백 결과를 모두 통과하면
                            context.read<ProductProvider>().modifyProduct(
                                Product(
                                  id: product.id,
                                  name: _nameController.text,
                                  price: int.parse(_priceController.text),
                                  description: _desctiptionController.text,
                                )
                            );
                          }
                          Navigator.of(context).pop();  // 뒤로가기 (AlertDialog 닫기)
                        },
                        child: const Text("수정"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );

  }

}