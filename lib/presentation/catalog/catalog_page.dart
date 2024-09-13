import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_profile/presentation/catalog/category_page.dart';
import 'package:test_profile/shared/extensions.dart';
import '../../application/category/category_overview_bloc.dart';
import '../../domain/category/category.dart';
import '../../injection.dart';
import '../widgets/loading_status.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryOverviewBloc>()..add(const CategoryOverviewEvent.started()),
      child: const SafeArea(
        child: Scaffold(
          body: CatalogPageBody(),
        ),
      ),
    );
  }
}

class CatalogPageBody extends StatelessWidget {
  const CatalogPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryOverviewBloc, CategoryOverviewState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        return LoadingWidget(
          status: state.status,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Разделы каталога', style: TextStyle(fontSize: 20)),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return CatalogCard(category: category);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: state.categories.length,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CatalogCard extends StatelessWidget {
  final Category category;
  const CatalogCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigatorPush(CategoryPage(category: category));
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                category.image,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Всего товаров: ${category.items}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
