class NetworkConstants {
  static const String BASE_API = '/api/v1/';

  static String getFullSubRoute(String subRoute) {
    return BASE_API + subRoute;
  }
}