import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  CategoryModel category = new CategoryModel();

  // Categoria 1
  category = new CategoryModel();
  category.setName = 'Business';
  category.setImage =
      'https://images.unsplash.com/photo-1491336477066-31156b5e4f35?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';
  categories.add(category);

  // Categoria 2
  category = new CategoryModel();
  category.setName = 'Entertainment';
  category.setImage =
      'https://images.unsplash.com/photo-1461151304267-38535e780c79?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1490&q=80';
  categories.add(category);

  // Categoria 3
  category = new CategoryModel();
  category.setName = 'General';
  category.setImage =
      'https://images.unsplash.com/photo-1617396900799-f4ec2b43c7ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80';
  categories.add(category);

  // Categoria 4
  category = new CategoryModel();
  category.setName = 'Sports';
  category.setImage =
      'https://images.unsplash.com/photo-1575361204480-aadea25e6e68?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80';
  categories.add(category);

  // Categoria 5
  category = new CategoryModel();
  category.setName = 'Health';
  category.setImage =
      'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';
  categories.add(category);

  // Categoria 6
  category = new CategoryModel();
  category.setName = 'Technology';
  category.setImage =
      'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
  categories.add(category);

  return categories;
}
