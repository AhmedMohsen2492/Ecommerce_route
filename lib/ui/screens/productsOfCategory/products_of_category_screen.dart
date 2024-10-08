import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/productsOfCategory/products_of_category_view_model.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/cart_view_model.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/wish_list_view_model.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:ecommerce_route/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../widgets/loading_view.dart';
import '../cart/cart_screen.dart';

class ProductsOfCategoryScreen extends StatefulWidget {
  const ProductsOfCategoryScreen({super.key});

  static const String routeName = "productsOfCategory";

  @override
  State<ProductsOfCategoryScreen> createState() =>
      _ProductsOfCategoryScreenState();
}

class _ProductsOfCategoryScreenState extends State<ProductsOfCategoryScreen> {
  ProductsOfCategoryViewModel viewModel = getIt();
  CategoryDM? category;
  late CartViewModel cartViewModel;

  late WishListViewModel wishListViewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt();
    cartViewModel = BlocProvider.of(context);
    wishListViewModel = BlocProvider.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadProductsOfCategory(category?.id ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)!.settings.arguments as CategoryDM?;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(category!.name!),
            const Spacer(),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                child: Image.asset(AppAssets.shoppingIcon)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder(
          bloc: viewModel,
          builder: (context, state) {
            if (state is BaseSuccessState<List<ProductDM>>) {
              return BlocBuilder<CartViewModel, dynamic>(
                builder: (context, cartState) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.8),
                    itemCount: state.data!.length,
                    itemBuilder: (context, index) {
                      var product = state.data?[index];
                      bool isInCart = cartViewModel.isInCart(product) != null;
                      bool isInWishList =
                          wishListViewModel.isInWishList(product!);
                      return ProductItem(
                          state.data![index], isInCart, isInWishList);
                    },
                  );
                },
              );
            } else if (state is BaseErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.outOfStockImage,
                    fit: BoxFit.fill,
                    height: MediaQuery.sizeOf(context).height * 0.45,
                  ),
                  Text(
                    "There is no available products for this brand",
                    style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            } else {
              return const LoadingView();
            }
          },
        ),
      ),
    );
  }
}
