import 'package:dio/dio.dart';
import 'package:getx_login/packages/config_package.dart';
import 'package:getx_login/packages/screen_package.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  static late ApiClient _instance;
  static late Dio dio;
  static const bool doWriteLog = true;

  static ApiClient get instance => _instance;

  factory ApiClient._private(Dio dio, {String baseUrl}) = _ApiClient;

  static Future<void> init(String baseUrl) async {
    var options = BaseOptions(baseUrl: baseUrl, connectTimeout: 30000, receiveTimeout: 60000, sendTimeout: 60000, headers: {
      "Content-Type": "application/json",
      "Accept": 'application/json',
    });
    dio = Dio(options);
    /* if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        maxWidth: 130,
      ));
    }*/
    _instance = ApiClient._private(dio, baseUrl: baseUrl);
  }

  @GET(ApiUrl.todos)
  Future<List<TodoModal>> getTodos();

  @GET(ApiUrl.compacts)
  Future<List<CompactsModal>> getCompacts(@Path("id") int id);
}

int _noOfApiCalls = 0;

Future<T?> callApi<T>(Future<T> request, {bool showLoader = true, bool showErrorDialog = true}) async {
  try {
    if (showLoader) _showLoader();
    var response = await request;
    if (showLoader) _hideLoader();
    return response;
  } on DioError catch (error) {
    if (showLoader) _hideLoader();
    // AppLogger.log("CALL_API => DIO_ERROR :: $error");
    //AppLogger.log("CALL_API => DIO_ERROR :: stackTrace ${error.stackTrace}");
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.response:
        if (showErrorDialog) onHttpError(error);
        break;
      case DioErrorType.cancel:
      case DioErrorType.other:
        break;
    }
  } catch (error) {
    if (showLoader) _hideLoader();
    // AppLogger.log("CALL_API :: $error");
  }
  return null;
}

void _showLoader() {
  if (_noOfApiCalls == 0) const CircularProgressIndicator();
  _noOfApiCalls++;
}

void _hideLoader() {
  _noOfApiCalls--;
  if (_noOfApiCalls == 0) const CircularProgressIndicator();
}

void onHttpError(DioError error) {
  final json = error.response?.data;
  switch (error.response?.statusCode) {
    case 500: // ServerError
    case 400: // BadRequest
    case 403: // Unauthorized
    case 404: // NotFound
    case 409: // Conflict
    case 423: // Blocked
    case 402: // Payment required
      _apiErrorDialog(json['message']);
      break;
    case 422: // InValidateData
      if (json['errors'] == null) {
        if (json['message'] != null) {
          _apiErrorDialog(json['message']);
        }
      } else {
        String errors = "";
        (json['errors'] as Map<String, dynamic>).forEach((k, v) {
          errors += "• $v\n";
        });
        _apiErrorDialog(errors);
      }
      break;
    case 401: // Unauthenticated
      var baseUrl = ApiClient.dio.options.baseUrl;
      ApiClient.dio.close(force: true);
      ApiClient.init(baseUrl);
      Get.offAll(const SplashScreen());
      break;
    case 426: // ForceUpdate
      break;
    case 524: // ServerTimeout
    case 521: // Web server is down debugPrint
    default:
      _apiErrorDialog('Something went wrong!');
  }
}

_apiErrorDialog(String? description) {
  Get.defaultDialog(
    title: 'Oops \n$description',
    onCancel: () => Get.back(),
  );
}
