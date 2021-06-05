class Urls {
  Urls._();

  static const String base_url = 'https://dev.6amtech.com/efood/api/v1';
  static const String registration_url = '/auth/register';
// params: f_name, l_name, phone, email, password

  static const String category_url = '/categories';
  static const String banner_url = '/banners';
  static const String menu_url = '/products/set-menu';
  static const String single_product_url = '/products/details/';
  static const String all_product_url =
      '/products/latest?limit=:limit&&offset=:offset';

  static const String category_image_url =
      'https://dev.6amtech.com/efood/storage/app/public/category/';
  static const String banner_image_url =
      'https://dev.6amtech.com/efood/storage/app/public/banner/';
  static const String product_image_url =
      'https://dev.6amtech.com/efood/storage/app/public/product/';
}
