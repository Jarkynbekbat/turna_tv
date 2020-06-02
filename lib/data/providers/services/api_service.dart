class ApiService {
  static String imgBase = "https://turna.tv";
  static String _base = "https://turna.tv/use/api/view";
  //content
  static String movies = "$_base/movie/";
  static String categories = "$_base/category/";
  static String genres = "$_base/genre/";
  //login
  static String userByEmail = "$_base/user/auth.php";
  static String userByGoogle = '$_base/user/google.php';
  //registration
  static String registrateByEmail = '$_base/user/register.php';
  static String registrateByGoogle = '$_base/user/google-register.php';

  //watch later
  static String addWatchLater = "$_base/user/favourite.php";
  static String removeWatchLater = "$_base/user/favourite-delete.php";
}
