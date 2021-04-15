class Categories {
  Categories({
    this.status,
    this.message,
    this.data,
  });

  final bool status;
  final String message;
  final List<Category> data;

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
        status: json["status"],
        message: json["message"],
        data: List<Category>.from(json["data"].map((x) => Category.fromMap(x))),
      );
}

class Category {
  Category({
    this.id,
    this.menu,
    this.category,
    this.catType,
    this.description,
    this.banner,
    this.status,
  });

  final int id;
  final String menu;
  final String category;
  final String catType;
  final String description;
  final dynamic banner;
  final String status;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        menu: json["menu"],
        category: json["category"],
        catType: json["catType"],
        description: json["description"],
        banner: json["banner"],
        status: json["status"],
      );
}
