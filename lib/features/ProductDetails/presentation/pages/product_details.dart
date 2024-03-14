import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api/api_manager.dart';
import '../Bloc/details_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  String id;

  ProductDetailsScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsBloc(ApiManager())..add(GetSpecificProductEvent(id)),
      child: BlocConsumer<DetailsBloc, DetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text(
                "Product Details",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.arrow_back),
            ),
            backgroundColor: Colors.black,
            body: Column(
              children: [
                // CarouselSlider(
                //   options: CarouselOptions(
                //       height: 200.0, autoPlay: true, viewportFraction: 1),
                //   items: state.products?[0].productVariations?[0].productVarientImages?.map((i) {
                //     return Builder(
                //       builder: (BuildContext context) {
                //         return Container(
                //           width: MediaQuery.of(context).size.width,
                //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                //           child: CachedNetworkImage(
                //             height: 180.h,
                //             //width: 237.w,
                //             imageUrl: i.imagePath??"",
                //             fit: BoxFit.cover,
                //             placeholder: (context, url) =>
                //                 Center(child: CircularProgressIndicator()),
                //             errorWidget: (context, url, error) => Icon(Icons.error),
                //           ),
                //         );
                //       },
                //     );
                //   }).toList(),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          state.currentProduct?.name ?? "",
                          style: TextStyle(color: Colors.white),
                        ),
                        //Text(state.currentProduct.productVariations)
                      ],
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CachedNetworkImage(
                            height: 100.h,
                            imageUrl: state.currentProduct?.brandImage ?? "",
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Text(
                          state.currentProduct?.brandName ?? "Loading",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
