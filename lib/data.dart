import 'catagory_model.dart';

List<CatagoryModel> getCategories() {
  List<CatagoryModel> myCategories = <CatagoryModel>[];
  CatagoryModel catagoryModel;

  //1
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Business";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  myCategories.add(catagoryModel);

  //2
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Entertainment";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(catagoryModel);

  //3
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "General";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(catagoryModel);

  //4
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Health";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  myCategories.add(catagoryModel);

  //5
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Science";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  myCategories.add(catagoryModel);

  //5
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Sports";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(catagoryModel);

  //5
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Technology";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(catagoryModel);

  return myCategories;
}
