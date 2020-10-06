// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

model welcomeFromJson(String str) => model.fromJson(json.decode(str));

String welcomeToJson(model data) => json.encode(data.toJson());

class model {
  model({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  Data data;
  String message;
  static model finalData;

  factory model.fromJson(Map<String, dynamic> json) => model(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.id,
    this.modelId,
    this.price,
    this.discountPrice,
    this.capacity,
    this.packageItemsCount,
    this.unit,
    this.featured,
    this.deliverable,
    this.marketId,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.optionGroups,
    this.customFields,
    this.hasMedia,
    this.market,
    this.isfavorite,
    this.category,
    this.options,
    this.dataOptionGroups,
    this.productReviews,
    this.media,
  });

  int id;
  String modelId;
  int price;
  int discountPrice;
  int capacity;
  int packageItemsCount;
  String unit;
  bool featured;
  bool deliverable;
  int marketId;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String description;
  List<OptionGroup> optionGroups;
  List<dynamic> customFields;
  bool hasMedia;
  Market market;
  bool isfavorite;
  Category category;
  List<Option> options;
  List<OptionGroup> dataOptionGroups;
  List<dynamic> productReviews;
  List<Media> media;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      modelId: json["model_id"],
      price: json["price"],
      discountPrice: json["discount_price"],
      capacity: json["capacity"],
      packageItemsCount: json["package_items_count"],
      unit: json["unit"],
      featured: json["featured"],
      deliverable: json["deliverable"],
      marketId: json["market_id"],
      categoryId: json["category_id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      name: json["name"],
      description: json["description"],
      optionGroups: List<OptionGroup>.from(json["optionGroups"].map((x) => OptionGroup.fromJson(x))),
  customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  hasMedia: json["has_media"],
  market: Market.fromJson(json["market"]),
  isfavorite: json["isfavorite"],
  category: Category.fromJson(json["category"]),
  options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  dataOptionGroups: List<OptionGroup>.from(json["option_groups"].map((x) => OptionGroup.fromJson(x))),
  productReviews: List<dynamic>.from(json["product_reviews"].map((x) => x)),
  media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_id": modelId,
    "price": price,
    "discount_price": discountPrice,
    "capacity": capacity,
    "package_items_count": packageItemsCount,
    "unit": unit,
    "featured": featured,
    "deliverable": deliverable,
    "market_id": marketId,
    "category_id": categoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "description": description,
    "optionGroups": List<dynamic>.from(optionGroups.map((x) => x.toJson())),
    "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
    "has_media": hasMedia,
    "market": market.toJson(),
    "isfavorite": isfavorite,
    "category": category.toJson(),
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "option_groups": List<dynamic>.from(dataOptionGroups.map((x) => x.toJson())),
    "product_reviews": List<dynamic>.from(productReviews.map((x) => x)),
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.customFields,
    this.hasMedia,
    this.pdatedat,
    this.media,
  });

  int id;
  int parentId;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String description;
  List<dynamic> customFields;
  bool hasMedia;
  String pdatedat;
  List<Media> media;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json["id"],
      parentId: json["parent_id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      name: json["name"],
      description: json["description"],
      customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  hasMedia: json["has_media"],
  pdatedat: json["pdatedat"],
  media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "description": description,
    "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
    "has_media": hasMedia,
    "pdatedat": pdatedat,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
  };
}

class Media {
  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.thumb,
    this.icon,
    this.formatedSize,
  });

  int id;
  String modelType;
  int modelId;
  String collectionName;
  String name;
  String fileName;
  String mimeType;
  String disk;
  int size;
  List<dynamic> manipulations;
  CustomProperties customProperties;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;
  String url;
  String thumb;
  String icon;
  String formatedSize;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
      id: json["id"],
      modelType: json["model_type"],
      modelId: json["model_id"],
      collectionName: json["collection_name"],
      name: json["name"],
      fileName: json["file_name"],
      mimeType: json["mime_type"],
      disk: json["disk"],
      size: json["size"],
      manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
  customProperties: CustomProperties.fromJson(json["custom_properties"]),
  responsiveImages: List<dynamic>.from(json["responsive_images"].map((x) => x)),
  orderColumn: json["order_column"],
  createdAt: DateTime.parse(json["created_at"]),
  updatedAt: DateTime.parse(json["updated_at"]),
  url: json["url"],
  thumb: json["thumb"],
  icon: json["icon"],
  formatedSize: json["formated_size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_type": modelType,
    "model_id": modelId,
    "collection_name": collectionName,
    "name": name,
    "file_name": fileName,
    "mime_type": mimeType,
    "disk": disk,
    "size": size,
    "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
    "custom_properties": customProperties.toJson(),
    "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
    "order_column": orderColumn,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "url": url,
    "thumb": thumb,
    "icon": icon,
    "formated_size": formatedSize,
  };
}

class CustomProperties {
  CustomProperties({
    this.uuid,
    this.generatedConversions,
  });

  String uuid;
  GeneratedConversions generatedConversions;

  factory CustomProperties.fromJson(Map<String, dynamic> json) => CustomProperties(
    uuid: json["uuid"],
    generatedConversions: GeneratedConversions.fromJson(json["generated_conversions"]),
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "generated_conversions": generatedConversions.toJson(),
  };
}

class GeneratedConversions {
  GeneratedConversions({
    this.thumb,
    this.icon,
  });

  bool thumb;
  bool icon;

  factory GeneratedConversions.fromJson(Map<String, dynamic> json) => GeneratedConversions(
    thumb: json["thumb"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "thumb": thumb,
    "icon": icon,
  };
}

class OptionGroup {
  OptionGroup({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.customFields,
    this.pivot,
  });

  int id;
  Name name;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> customFields;
  Pivot pivot;

  factory OptionGroup.fromJson(Map<String, dynamic> json) => OptionGroup(
      id: json["id"],
      name: nameValues.map[json["name"]],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
    "pivot": pivot.toJson(),
  };
}

enum Name { SIZE, COLOR }

final nameValues = EnumValues({
  "Color": Name.COLOR,
  "Size": Name.SIZE
});

class Pivot {
  Pivot({
    this.productId,
    this.optionGroupId,
  });

  int productId;
  int optionGroupId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    productId: json["product_id"],
    optionGroupId: json["option_group_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "option_group_id": optionGroupId,
  };
}

class Market {
  Market({
    this.id,
    this.name,
    this.description,
    this.address,
    this.latitude,
    this.longitude,
    this.phone,
    this.mobile,
    this.information,
    this.adminCommission,
    this.deliveryFee,
    this.deliveryRange,
    this.defaultTax,
    this.closed,
    this.availableForDelivery,
    this.createdAt,
    this.updatedAt,
    this.customFields,
    this.hasMedia,
    this.rate,
    this.media,
  });

  int id;
  String name;
  String description;
  String address;
  String latitude;
  String longitude;
  dynamic phone;
  String mobile;
  String information;
  int adminCommission;
  int deliveryFee;
  int deliveryRange;
  int defaultTax;
  bool closed;
  bool availableForDelivery;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> customFields;
  bool hasMedia;
  String rate;
  List<dynamic> media;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      address: json["address"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      phone: json["phone"],
      mobile: json["mobile"],
      information: json["information"],
      adminCommission: json["admin_commission"],
      deliveryFee: json["delivery_fee"],
      deliveryRange: json["delivery_range"],
      defaultTax: json["default_tax"],
      closed: json["closed"],
      availableForDelivery: json["available_for_delivery"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  hasMedia: json["has_media"],
  rate: json["rate"],
  media: List<dynamic>.from(json["media"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "phone": phone,
    "mobile": mobile,
    "information": information,
    "admin_commission": adminCommission,
    "delivery_fee": deliveryFee,
    "delivery_range": deliveryRange,
    "default_tax": defaultTax,
    "closed": closed,
    "available_for_delivery": availableForDelivery,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
    "has_media": hasMedia,
    "rate": rate,
    "media": List<dynamic>.from(media.map((x) => x)),
  };
}

class Option {
  Option({
    this.id,
    this.name,
    this.description,
    this.price,
    this.productId,
    this.stock,
    this.optionGroupId,
    this.createdAt,
    this.updatedAt,
    this.customFields,
  });

  int id;
  String name;
  String description;
  int price;
  int productId;
  int stock;
  int optionGroupId;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> customFields;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      productId: json["product_id"],
      stock: json["stock"],
      optionGroupId: json["option_group_id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "product_id": productId,
    "stock": stock,
    "option_group_id": optionGroupId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
