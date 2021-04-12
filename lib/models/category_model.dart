class CategoryModel {
  String _name;
  String _imageUrl;

  CategoryModel();

  set setName(String n) => _name = n;
  get name => _name;

  get imageUrl => _imageUrl;
  set setImage(String n) => _imageUrl = n;
}
