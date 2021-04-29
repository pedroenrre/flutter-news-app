import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  CategoryModel category = new CategoryModel();

  // Categoria 1
  category = new CategoryModel();
  category.setCat = 'Business';
  category.setName = 'Negócios';
  category.setImage =
      'https://images.unsplash.com/photo-1491336477066-31156b5e4f35?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';
  categories.add(category);

  // Categoria 2
  category = new CategoryModel();
  category.setCat = 'Entertainment';
  category.setName = 'Entretenimento';
  category.setImage =
      'https://images.unsplash.com/photo-1461151304267-38535e780c79?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1490&q=80';
  categories.add(category);

  // Categoria 3
  category = new CategoryModel();
  category.setCat = 'General';
  category.setName = 'Generalidades';
  category.setImage =
      'https://images.unsplash.com/photo-1617396900799-f4ec2b43c7ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80';
  categories.add(category);

  // Categoria 4
  category = new CategoryModel();
  category.setCat = 'Sports';
  category.setName = 'Esportes';
  category.setImage =
      'https://images.unsplash.com/photo-1575361204480-aadea25e6e68?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80';
  categories.add(category);

  // Categoria 5
  category = new CategoryModel();
  category.setCat = 'Health';
  category.setName = 'Saúde';
  category.setImage =
      'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';
  categories.add(category);

  // Categoria 6
  category = new CategoryModel();
  category.setCat = 'Technology';
  category.setName = 'Tecnologia';
  category.setImage =
      'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
  categories.add(category);

  return categories;
}
