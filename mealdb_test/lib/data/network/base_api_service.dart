abstract class BaseApiServices {

  Future<dynamic> getApi(String url);


  Future<dynamic> postApi(payload, url);
}