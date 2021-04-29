class CategoryModel {
  String _cat;
  String _name;
  String _imageUrl;

  CategoryModel();

  set setName(String n) => _name = n;
  get name => _name;

  set setCat(String n) => _cat = n;
  get cat => _cat;

  get imageUrl => _imageUrl;
  set setImage(String n) => _imageUrl = n;
}
