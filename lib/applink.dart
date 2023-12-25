class AppLink {

  static const String server = "https://mostafaben.bsite.net";
  static const String imageststatic = "https://mostafaben.bsite.net";

//
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";

  static const String signUp = "$server/api/Users/register";
  static const String login = "$server/api/Users/login";
  static const String verifycodessignup = "$server/api/Users/verify";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/api/Users/forgot-password";
  static const String resetPassword = "$server/api/Users/reset-password";
  static const String verifycodeforgetpassword = "$server/api/Users/verify";
  //category
  static const String catview  = "$server/api/Categories";
  static const String catadd  = "$server/api/Categories";
  static const String catedit  = "$server/api/Categories/{id}";
  static const String catdelete  = "$server/api/Categories/{id}";
//product
  static const String proview  = "$server/api/Products";
  static const String proadd  = "$server/api/Products";
  static const String proedit  = "$server/api/Products/id";
  static const String prodelte  = "$server/api/Products/id";
  //user
  static const String userview  = "$server/orders/delete.php";
  static const String useradd  = "$server/orders/delete.php";
  static const String useredit  = "$server/orders/delete.php";
  static const String userdelete  = "$server/orders/delete.php";


}