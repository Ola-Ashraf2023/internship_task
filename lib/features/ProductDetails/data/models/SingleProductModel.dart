import 'package:internship_task/features/ProductDetails/domain/entities/singleProductEntity.dart';
import 'package:internship_task/features/home/data/models/ProductModel.dart';

import '../../../home/domain/entities/ProductEntity.dart';

/// data : {"id":31,"name":"Starry night","type":"Warehouse","description":"drawings of starry night originally by Vincent van Gogh and copied by me","brand_id":10,"bosta_size_id":null,"product_rating":0,"estimated_days_preparing":8,"_count":{"ProductVariations":4},"SizeChart":null,"subCategory":{"id":8,"name":"Drawings"},"variations":[{"id":51,"price":850,"quantity":1,"inStock":true,"ProductVarientImages":[{"id":45,"image_path":"https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fproduct-variants%2F1695658097880IMG_20230202_011736.jpg?alt=media&token=bb42aaf1-ac00-4f95-9864-370ef010ad1e","product_varient_id":51,"createdAt":"2023-09-25T16:08:18.607Z","updatedAt":"2023-09-25T16:08:18.607Z"},{"id":46,"image_path":"https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fproduct-variants%2F1695658097881IMG-20230829-WA0049.jpg?alt=media&token=432abf5e-b591-4c68-87ff-adc6bb500361","product_varient_id":51,"createdAt":"2023-09-25T16:08:18.607Z","updatedAt":"2023-09-25T16:08:18.607Z"}],"productPropertiesValues":[{"value":"40*30","property":"Size"},{"value":"colored pencil","property":"Materials"},{"value":"#000000","property":"Color"}],"productStatus":"APPROVED","isDefault":true,"product_variation_status_id":2}],"avaiableProperties":[{"property":"Size","values":[{"value":"40*30","id":51}]},{"property":"Materials","values":[{"value":"colored pencil","id":51}]},{"property":"Color","values":[{"value":"#000000","id":51}]}],"brandName":"Artist Mina Maged ","brandImage":"https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fbrands%2F1695386914229FB_IMG_1693330052710.jpg?alt=media&token=501cb71f-ed98-4348-b2e8-41c63e272e32"}
/// message : "Find product successfully"
/// statusCode : 200

class SingleProductModel extends SingleProductEntity {
  SingleProductModel({
    super.data,
    this.message,
    this.statusCode,
  });

  SingleProductModel.fromJson(dynamic json) {
    data = json['data'] != null
        ? SingleProductModelData.fromJson(json['data'])
        : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }

  String? message;
  int? statusCode;
}

class SingleProductModelData extends SingleProductData {
  SingleProductModelData({
    super.id,
    super.name,
    this.type,
    super.description,
    super.brandId,
    this.bostaSizeId,
    super.productRating,
    this.estimatedDaysPreparing,
    this.sizeChart,
    super.variations,
    super.avaiableProperties,
    super.brandName,
    super.brandImage,
  });

  SingleProductModelData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    brandId = json['brand_id'];
    bostaSizeId = json['bosta_size_id'];
    productRating = json['product_rating'];
    estimatedDaysPreparing = json['estimated_days_preparing'];
    sizeChart = json['SizeChart'];
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations?.add(VariationsModel.fromJson(v));
      });
    }
    if (json['avaiableProperties'] != null) {
      avaiableProperties = [];
      json['avaiableProperties'].forEach((v) {
        avaiableProperties?.add(AvaiableProperties.fromJson(v));
      });
    }
    brandName = json['brandName'];
    brandImage = json['brandImage'];
  }

  String? type;
  int? bostaSizeId;
  int? estimatedDaysPreparing;
  int? sizeChart;
}

class VariationsModel extends Variations {
  VariationsModel({
    super.id,
    super.price,
    this.quantity,
    super.inStock,
    super.productVarientImages,
    super.productStatus,
    this.isDefault,
    this.productVariationStatusId,
  });

  VariationsModel.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    inStock = json['inStock'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = [];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages?.add(ProductVarientImagesModel.fromJson(v));
      });
    }
    productStatus = json['productStatus'];
    isDefault = json['isDefault'];
    productVariationStatusId = json['product_variation_status_id'];
  }

  int? quantity;
  bool? isDefault;
  int? productVariationStatusId;
}
