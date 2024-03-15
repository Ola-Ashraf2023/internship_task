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

  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsBloc(ApiManager())..add(GetSpecificProductEvent(id)),
      child: BlocConsumer<DetailsBloc, DetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: const Text(
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
                  if (state
                          .currentProduct
                          ?.variations?[
                              DetailsBloc.get(context).variationIdx ?? 0]
                          .productVarientImages !=
                      null)
                    CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          DetailsBloc.get(context)
                              .add(ChangeCarouselIndex(index));
                        },
                        height: 300.0,
                        autoPlay: false,
                        viewportFraction: 1,
                      ),
                      items: state
                          .currentProduct
                          ?.variations?[
                              DetailsBloc.get(context).variationIdx ?? 0]
                          .productVarientImages
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
                    children: [
                      Container(
                        height: 100.h,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.center,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state
                                    .currentProduct
                                    ?.variations?[
                                        DetailsBloc.get(context).variationIdx ??
                                            0]
                                    .productVarientImages
                                    ?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  _controller.animateToPage(index);
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 90.w,
                                  padding: EdgeInsets.all(18.r),
                                  margin: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "${state.currentProduct?.variations?[DetailsBloc.get(context).variationIdx ?? 0].productVarientImages?[index].imagePath}")),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Text(
                              state.currentProduct?.name ?? "",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Text(
                              "EGP ${state.currentProduct?.variations?[DetailsBloc.get(context).variationIdx ?? 0].price ?? 0}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.0.r),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: CachedNetworkImage(
                                height: 100.h,
                                imageUrl:
                                    state.currentProduct?.brandImage ?? "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
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
                                    return InkWell(
                                      onTap: () {
                                        DetailsBloc.get(context)
                                            .add(ChangeColorIndex(index));
                                        //Get ID of chosen variation
                                        var tempId1 = state
                                            .currentProduct?.avaiableProperties
                                            ?.firstWhere(
                                                (element) =>
                                                    element.property == "Color",
                                                orElse: () =>
                                                    AvaiableProperties(
                                                        property: '',
                                                        values: []))
                                            .values?[index]
                                            .id;

                                        DetailsBloc.get(context).add(
                                            ChangeVariationIdx(state
                                                .currentProduct?.variations
                                                ?.indexWhere((variation) =>
                                                    variation.id == tempId1)));
                                      },
                                      child: Container(
                                        width: 30.w,
                                        height: 30.h,
                                        margin: EdgeInsets.all(8.r),
                                        decoration: BoxDecoration(
                                            color: Color(int.parse(
                                                'FF$hexColor',
                                                radix: 16)),
                                            border: Border.all(
                                                color: DetailsBloc.get(context)
                                                            .colorIdx ==
                                                        index
                                                    ? Color(0xffb8ee2e)
                                                    : Colors.white),
                                            shape: BoxShape.circle),
                                      ),
                                    );
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
                                    return Padding(
                                      padding: EdgeInsets.all(20.0.r),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          DetailsBloc.get(context)
                                              .add(ChangeSizeIndex(index));
                                          //Get ID of chosen variation
                                          var tempId2 = state.currentProduct
                                              ?.avaiableProperties
                                              ?.firstWhere(
                                                  (element) =>
                                                      element.property ==
                                                      "Size",
                                                  orElse: () =>
                                                      AvaiableProperties(
                                                          property: '',
                                                          values: []))
                                              .values?[index]
                                              .id;

                                          //;
                                          DetailsBloc.get(context).add(
                                              ChangeVariationIdx(state
                                                  .currentProduct?.variations
                                                  ?.indexWhere((variation) =>
                                                      variation.id ==
                                                      tempId2)));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                DetailsBloc.get(context)
                                                            .sizeIdx ==
                                                        index
                                                    ? Color(0xffb8ee2e)
                                                    : Color(0xff1d1d1f)),
                                        child: Text(
                                          "${state.currentProduct?.avaiableProperties?.firstWhere((element) => element.property == "Size", orElse: () => AvaiableProperties(property: '', values: [])).values?[index].value}",
                                          style: TextStyle(
                                              color: DetailsBloc.get(context)
                                                          .sizeIdx ==
                                                      index
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    );
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
                                    return Padding(
                                      padding: EdgeInsets.all(20.0.r),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          DetailsBloc.get(context)
                                              .add(ChangeMaterialIndex(index));
                                          //Get ID of chosen variation
                                          var tempId = state.currentProduct
                                              ?.avaiableProperties
                                              ?.firstWhere(
                                                  (element) =>
                                                      element.property ==
                                                      "Materials",
                                                  orElse: () =>
                                                      AvaiableProperties(
                                                          property: '',
                                                          values: []))
                                              .values?[index]
                                              .id;

                                          //;
                                          DetailsBloc.get(context).add(
                                              ChangeVariationIdx(state
                                                  .currentProduct?.variations
                                                  ?.indexWhere((variation) =>
                                                      variation.id == tempId)));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                DetailsBloc.get(context)
                                                            .materialIdx ==
                                                        index
                                                    ? Color(0xffb8ee2e)
                                                    : Color(0xff1d1d1f)),
                                        child: Text(
                                          "${state.currentProduct?.avaiableProperties?.firstWhere((element) => element.property == "Materials", orElse: () => AvaiableProperties(property: '', values: [])).values?[index].value}" ??
                                              "",
                                          style: TextStyle(
                                              color: DetailsBloc.get(context)
                                                          .materialIdx ==
                                                      index
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    );
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
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: Text(
                          "Description",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: Text(
                            state.currentProduct?.description ?? "",
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
