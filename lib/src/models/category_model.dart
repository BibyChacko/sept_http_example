class CategoryModel {
  String? _id;
  String? _categoryName;
  String? _categoryCode;

  String? get id => _id;
  String? get categoryName => _categoryName;
  String? get categoryCode => _categoryCode;

  CategoryModel({
      String? id, 
      String? categoryName, 
      String? categoryCode}){
    _id = id;
    _categoryName = categoryName;
    _categoryCode = categoryCode;
}

  CategoryModel.fromJson(dynamic json) {
    _id = json['_id'];
    _categoryName = json['categoryName'];
    _categoryCode = json['categoryCode'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['categoryName'] = _categoryName;
    map['categoryCode'] = _categoryCode;
    return map;
  }

}