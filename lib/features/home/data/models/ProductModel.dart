import '../../domain/entities/ProductEntity.dart';

class BrandsModel extends Brands {
  BrandsModel({
    super.id,
    super.brandType,
    super.brandName,
    super.brandFacebookPageLink,
    super.brandInstagramPageLink,
    super.brandWebsiteLink,
    super.brandMobileNumber,
    super.brandEmailAddress,
    super.taxIdNumber,
    super.brandDescription,
    super.brandLogoImagePath,
    this.brandStatusId,
    this.brandStoreAddressId,
    this.brandCategoryId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.brandSellerId,
    this.brandId,
    this.slashContractPath,
    this.brandRating,
    this.daysLimitToReturn,
    this.planId,});

  BrandsModel.fromJson(dynamic json) {
    id = json['id'];
    brandType = json['brand_type'];
    brandName = json['brand_name'];
    brandFacebookPageLink = json['brand_facebook_page_link'];
    brandInstagramPageLink = json['brand_instagram_page_link'];
    brandWebsiteLink = json['brand_website_link'];
    brandMobileNumber = json['brand_mobile_number'];
    brandEmailAddress = json['brand_email_address'];
    taxIdNumber = json['tax_id_number'];
    brandDescription = json['brand_description'];
    brandLogoImagePath = json['brand_logo_image_path'];
    brandStatusId = json['brand_status_id'];
    brandStoreAddressId = json['brand_store_address_id'];
    brandCategoryId = json['brand_category_id'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    brandSellerId = json['brand_seller_id'];
    brandId = json['brand_id'];
    slashContractPath = json['slash_contract_path'];
    brandRating = json['brand_rating'];
    daysLimitToReturn = json['days_limit_to_return'];
    planId = json['planId'];
  }
  int? brandStatusId;
  dynamic brandStoreAddressId;
  int? brandCategoryId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? brandSellerId;
  dynamic brandId;
  dynamic slashContractPath;
  int? brandRating;
  int? daysLimitToReturn;
  dynamic planId;
}
class ProductStatusLookups {
  ProductStatusLookups({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,});

  ProductStatusLookups.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
}

class ProductVarientImagesModel extends ProductVarientImages {
  ProductVarientImagesModel({
    super.id,
    super.imagePath,
    super.productVarientId,
    this.createdAt,
    this.updatedAt,});

  ProductVarientImagesModel.fromJson(dynamic json) {
    id = json['id'];
    imagePath = json['image_path'];
    productVarientId = json['product_varient_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image_path'] = imagePath;
    map['product_varient_id'] = productVarientId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class ProductVariationsModel extends ProductVariations {
  ProductVariationsModel({
    super.id,
    super.productId,
    super.price,
    super.quantity,
    this.warehouseId,
    super.isDefault,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.productVariationStatusId,
    this.acceptedBy,
    this.productStatusLookups,
    super.productVarientImages,});

  ProductVariationsModel.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
    warehouseId = json['warehouse_id'];
    isDefault = json['is_default'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productVariationStatusId = json['product_variation_status_id'];
    acceptedBy = json['accepted_by'];
    productStatusLookups = json['ProductStatusLookups'] != null ? ProductStatusLookups.fromJson(json['ProductStatusLookups']) : null;
    if (json['ProductVarientImages'] != null) {
      productVarientImages = [];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages?.add(ProductVarientImagesModel.fromJson(v));
      });
    }
  }

  dynamic warehouseId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? productVariationStatusId;
  dynamic acceptedBy;
  ProductStatusLookups? productStatusLookups;
}

class SubCategories {
  SubCategories({
    this.id,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.imagePath,});

  SubCategories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    categoryId = json['category_id'];
    imagePath = json['image_path'];
  }
  int? id;
  String? name;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? categoryId;
  String? imagePath;

}
class ModelData extends Data {
  ModelData({
    super.id,
    super.name,
    this.type,
    super.description,
    this.subCategoryId,
    super.brandId,
    this.bostaSizeId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    super.productRating,
    this.estimatedDaysPreparing,
    super.brands,
    super.productVariations,
    this.subCategories,
    this.sizeChart,
    this.notApprovedVariants,});

  ModelData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    subCategoryId = json['sub_category_id'];
    brandId = json['brand_id'];
    bostaSizeId = json['bosta_size_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    productRating = json['product_rating'];
    estimatedDaysPreparing = json['estimated_days_preparing'];
    brands = json['Brands'] != null ? BrandsModel.fromJson(json['Brands']) : null;
    if (json['ProductVariations'] != null) {
      productVariations = [];
      json['ProductVariations'].forEach((v) {
        productVariations?.add(ProductVariationsModel.fromJson(v));
      });
    }
    subCategories = json['SubCategories'] != null ? SubCategories.fromJson(json['SubCategories']) : null;
    sizeChart = json['SizeChart'];
    notApprovedVariants = json['notApprovedVariants'];
  }
  String? type;
  int? subCategoryId;
  dynamic bostaSizeId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? estimatedDaysPreparing;
  SubCategories? subCategories;
  dynamic sizeChart;
  int? notApprovedVariants;


}
class ProductModel extends ProductEntity {
  ProductModel({
    this.statusCode,
    this.message,
    this.pagination,
    super.data,});

  ProductModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ModelData.fromJson(v));
      });
    }
  }
  int? statusCode;
  String? message;
  Pagination? pagination;



}

class Pagination {
  Pagination({
    this.pages,});

  Pagination.fromJson(dynamic json) {
    pages = json['pages'];
  }
  dynamic pages;


}