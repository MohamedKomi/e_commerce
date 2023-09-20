class Banners {
  bool? status;
  String? message;
  List<BannerItem>? data;

  Banners({this.status, this.message, this.data});

  Banners.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BannerItem>[];
      json['data'].forEach((v) {
        data!.add(BannerItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerItem {
  int? id;
  String? image;

  BannerItem({
    this.id,
    this.image,
  });

  BannerItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;

    return data;
  }
}
