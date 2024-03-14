import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api/api_manager.dart';
import '../../../home/domain/entities/ProductEntity.dart';
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
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
            ),
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 200.0, autoPlay: true, viewportFraction: 1),
                    items: state
                        .currentProduct?.variations?[0].productVarientImages
                        ?.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: CachedNetworkImage(
                              height: 180.h,
                              width: 237.w,
                              imageUrl: i.imagePath ?? "",
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Text(
                              state.currentProduct?.name ?? "",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Text(
                              "EGP ${state.currentProduct?.variations?[0].price ?? 0}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          //Text(state.currentProduct.productVariations)
                        ],
                      ),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
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
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Text(
                              state.currentProduct?.brandName ?? "Loading",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Visibility(
                    visible: state.currentProduct?.avaiableProperties
                            ?.any((element) => element.property == "Color") ??
                        false,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: Text(
                                "Select Color",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100.h,
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.center,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state
                                          .currentProduct?.avaiableProperties
                                          ?.firstWhere(
                                              (element) =>
                                                  element.property == "Color",
                                              orElse: () => AvaiableProperties(
                                                  property: '', values: []))
                                          .values
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    String? hexColor = state
                                        .currentProduct?.avaiableProperties
                                        ?.firstWhere(
                                            (element) =>
                                                element.property == "Color",
                                            orElse: () => AvaiableProperties(
                                                property: '', values: []))
                                        .values?[index]
                                        .value;
                                    hexColor = hexColor?.replaceAll("#", "");
                                    hexColor ??= '#000000';
                                    return Container(
                                      width: 30.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          color: Color(int.parse('FF$hexColor',
                                              radix: 16)),
                                          border:
                                              Border.all(color: Colors.white),
                                          shape: BoxShape.circle),
                                    );

                                    // Text("${state.currentProduct?.avaiableProperties?.firstWhere((element) => element.property=="Color").values?[index].value}",style: TextStyle(color: Colors.white),);
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: state.currentProduct?.avaiableProperties
                            ?.any((element) => element.property == "Size") ??
                        false,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: Text(
                                "Select Size",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100.h,
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.center,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state
                                          .currentProduct?.avaiableProperties
                                          ?.firstWhere(
                                              (element) =>
                                                  element.property == "Size",
                                              orElse: () => AvaiableProperties(
                                                  property: '', values: []))
                                          .values
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    return ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "${state.currentProduct?.avaiableProperties?.firstWhere((element) => element.property == "Size", orElse: () => AvaiableProperties(property: '', values: [])).values?[index].value}",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xffb8ee2e)),
                                    );

                                    // Text("${state.currentProduct?.avaiableProperties?.firstWhere((element) => element.property=="Color").values?[index].value}",style: TextStyle(color: Colors.white),);
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: state.currentProduct?.avaiableProperties?.any(
                            (element) => element.property == "Materials") ??
                        false,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: Text(
                                "Select Material",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100.h,
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.center,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state
                                          .currentProduct?.avaiableProperties
                                          ?.firstWhere(
                                              (element) =>
                                                  element.property ==
                                                  "Materials",
                                              orElse: () => AvaiableProperties(
                                                  property: '', values: []))
                                          .values
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    return ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "${state.currentProduct?.avaiableProperties?.firstWhere((element) => element.property == "Materials", orElse: () => AvaiableProperties(property: '', values: [])).values?[index].value}" ??
                                            "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xffb8ee2e)),
                                    );

                                    // Text("${state.currentProduct?.avaiableProperties?.firstWhere((element) => element.property=="Color").values?[index].value}",style: TextStyle(color: Colors.white),);
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
