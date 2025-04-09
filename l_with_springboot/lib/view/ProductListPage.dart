import 'package:flutter/material.dart';
import 'package:l_with_springboot/product/Product.dart';
import 'package:l_with_springboot/viewmodel/ProductProvider.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {

  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {

    // Provider 등록
    final productProvider = context.read<ProductProvider>();

    // 최초 빌드 시점에서 Product 목록 로드하기
    WidgetsBinding.instance.addPostFrameCallback((_) {  // 매개변수 duration 을 사용하지 않는다면 (_) { }
      if(productProvider.products.isEmpty) {            // 상품 목록이 비어 있으면
        productProvider.fetchProduct();                 // 상품 목록 가져오기
      }
    });

    // UI 빌드
    return Scaffold(
      appBar: AppBar(title: const Text("Product App")),
      body: Consumer<ProductProvider>(  // 상태가 변하면 해당 부분의 리빌드를 위한 (전체 리빌드가 아닌) consumer 사용
        builder: (context, provider, child) {
          // builder() 는 화면에 표시할 UI 를 반환함
          if(provider.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {   // itemBuilder : Product 하나를 UI 로 변환
              final product = provider.products[index];   // Product
              return Card(
                margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  leading: Checkbox(
                    value: true, onChanged: (value) { }
                  ),
                  title: Text(product.name, style: TextStyle(fontWeight: FontWeight.w900)),
                  subtitle: Text(product.price.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.edit, color: Colors.blue,),
                      ),
                      IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.delete, color: Colors.red,),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { _showDialogRegist(context); },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDialogRegist(context) {
    showDialog(
      context: context,
      builder: (context) {
        String name = "";
        int price = 0;
        String description = "";
        return AlertDialog(
          title: const Text("Product Registration"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "상품명"),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: InputDecoration(hintText: "상품가격"),
                onChanged: (value) => price = int.parse(value),
              ),
              TextField(
                decoration: InputDecoration(hintText: "상품설명"),
                onChanged: (value) => description = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // 뒤로가기 (AlertDialog 닫기)
              },
              child: const Text("취소"),
            ),
            TextButton(
                onPressed: () {
                  context.read<ProductProvider>().registProduct(
                    Product(
                      name: name,
                      price: price,
                      description: description
                    )
                  );
                  Navigator.of(context).pop();  // 뒤로가기 (AlertDialog 닫기)
                },
                child: const Text("등록"),
            ),
          ],
        );
      }
    );
  }
}