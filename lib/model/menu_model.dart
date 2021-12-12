class MenuModel {
  MenuModel({
    this.menus,
  });

  List<Menu>? menus;

  factory MenuModel.fromJson(Map json) => MenuModel(
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
      );

  Map toJson() => {
        "menus": List<dynamic>.from(menus!.map((x) => x.toJson())),
      };
}

class Menu {
  Menu({
    this.key,
    this.description,
    this.items,
    this.orderTag,
  });

  dynamic key;
  dynamic description;
  List<Item>? items;
  dynamic orderTag;

  factory Menu.fromJson(Map json) => Menu(
        key: json["key"],
        description: json["description"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        orderTag: json["orderTag"],
      );

  Map toJson() => {
        "key": key,
        "description": description,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "orderTag": orderTag,
      };
}

class Item {
  Item({
    this.name,
    this.caption,
    this.image,
    this.items,
    this.price,
    this.subMenus,
  });

  dynamic name;
  dynamic caption;
  dynamic image;
  List<Item>? items;
  dynamic price;
  List<String>? subMenus;

  factory Item.fromJson(Map json) => Item(
        name: json["name"],
        caption: json["caption"],
        image: "./assets" + json["image"].toString().replaceFirst(".", ""),
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        price: json["price"],
        subMenus: json["subMenus"] == null
            ? null
            : List<String>.from(json["subMenus"].map((x) => x)),
      );

  Map toJson() => {
        "name": name,
        "caption": caption,
        "image": image,
        "items": items == null
            ? null
            : List<Item>.from(items!.map((x) => x.toJson())),
        "price": price,
        "subMenus": subMenus == null
            ? null
            : List<dynamic>.from(subMenus!.map((x) => x)),
      };
}
