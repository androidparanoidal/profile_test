import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_profile/presentation/catalog/product_detail_page.dart';
import 'package:test_profile/presentation/widgets/loading_status.dart';
import 'package:test_profile/shared/extensions.dart';
import '../../application/product/product_bloc.dart';
import '../../domain/category/category.dart';
import '../../domain/product/product.dart';
import '../../injection.dart';

class CategoryPage extends StatelessWidget {
  final Category category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductBloc>()..add(ProductEvent.started(category.id)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.name),
          backgroundColor: Colors.blueAccent,
          elevation: 0,
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return LoadingWidget(
              status: state.status,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductCard(product: product);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: state.products.length,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigatorPush(ProductDetailPage(product: product));
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                product.image,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    '${product.price} руб.',
                    style: const TextStyle(color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart, size: 30),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
