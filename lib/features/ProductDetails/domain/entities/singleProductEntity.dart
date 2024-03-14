import '../../../home/domain/entities/ProductEntity.dart';

/// data : {"id":31,"name":"Starry night","type":"Warehouse","description":"drawings of starry night originally by Vincent van Gogh and copied by me","brand_id":10,"bosta_size_id":null,"product_rating":0,"estimated_days_preparing":8,"_count":{"ProductVariations":4},"SizeChart":null,"subCategory":{"id":8,"name":"Drawings"},"variations":[{"id":51,"price":850,"quantity":1,"inStock":true,"ProductVarientImages":[{"id":45,"image_path":"https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fproduct-variants%2F1695658097880IMG_20230202_011736.jpg?alt=media&token=bb42aaf1-ac00-4f95-9864-370ef010ad1e","product_varient_id":51,"createdAt":"2023-09-25T16:08:18.607Z","updatedAt":"2023-09-25T16:08:18.607Z"},{"id":46,"image_path":"https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fproduct-variants%2F1695658097881IMG-20230829-WA0049.jpg?alt=media&token=432abf5e-b591-4c68-87ff-adc6bb500361","product_varient_id":51,"createdAt":"2023-09-25T16:08:18.607Z","updatedAt":"2023-09-25T16:08:18.607Z"}],"productPropertiesValues":[{"value":"40*30","property":"Size"},{"value":"colored pencil","property":"Materials"},{"value":"#000000","property":"Color"}],"productStatus":"APPROVED","isDefault":true,"product_variation_status_id":2}],"avaiableProperties":[{"property":"Size","values":[{"value":"40*30","id":51}]},{"property":"Materials","values":[{"value":"colored pencil","id":51}]},{"property":"Color","values":[{"value":"#000000","id":51}]}],"brandName":"Artist Mina Maged ","brandImage":"https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fbrands%2F1695386914229FB_IMG_1693330052710.jpg?alt=media&token=501cb71f-ed98-4348-b2e8-41c63e272e32"}
/// message : "Find product successfully"
/// statusCode : 200

class SingleProductEntity {
  SingleProductEntity({
    this.data,
  });

  SingleProductData? data;
}

class SingleProductData {
  SingleProductData({
    this.id,
    this.name,
    this.description,
    this.brandId,
    this.productRating,
    this.variations,
    this.avaiableProperties,
    this.brandName,
    this.brandImage,
  });

  int? id;
  String? name;
  String? description;
  int? brandId;
  int? productRating;
  List<Variations>? variations;
  List<AvaiableProperties>? avaiableProperties;
  String? brandName;
  String? brandImage;
}

class Variations {
  Variations({
    this.id,
    this.price,
    this.inStock,
    this.productVarientImages,
    this.productStatus,
  });

  int? id;
  int? price;
  bool? inStock;
  List<ProductVarientImages>? productVarientImages;
  String? productStatus;
}
