class ProductEntity {
  ProductEntity({
    this.data,
  });

  List<Data>? data;
}

class Brands {
  Brands({
    this.id,
    this.brandType,
    this.brandName,
    this.brandFacebookPageLink,
    this.brandInstagramPageLink,
    this.brandWebsiteLink,
    this.brandMobileNumber,
    this.brandEmailAddress,
    this.taxIdNumber,
    this.brandDescription,
    this.brandLogoImagePath,
  });

  int? id;
  String? brandType;
  String? brandName;
  String? brandFacebookPageLink;
  String? brandInstagramPageLink;
  String? brandWebsiteLink;
  String? brandMobileNumber;
  String? brandEmailAddress;
  String? taxIdNumber;
  String? brandDescription;
  String? brandLogoImagePath;
}

class ProductVarientImages {
  ProductVarientImages({
    this.id,
    this.imagePath,
    this.productVarientId,
  });

  int? id;
  String? imagePath;
  int? productVarientId;
}

class ProductVariations {
  ProductVariations({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.isDefault,
    this.productVarientImages,
  });
  int? id;
  int? productId;
  num? price;
  int? quantity;
  bool? isDefault;
  List<ProductVarientImages>? productVarientImages;

}
class Data {
  Data({
    this.id,
    this.name,
    this.description,
    this.brandId,
    this.productRating,
    this.brands,
    this.productVariations,
  });

  int? id;
  String? name;
  String? description;
  int? brandId;
  num? productRating;
  Brands? brands;
  List<ProductVariations>? productVariations;
}
