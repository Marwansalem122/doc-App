class ApiConstants{
  static const String apiBaseUrl="https://vcare.integration25.com/api/";
  static const String login="auth/login";
  static const String signup="auth/register";
}

class ApiErrors{
  static const String badRequestError="badRequestError";
  static const String noContent="noContent";
  static const String forbiddenError="forbiddenError";
  static const String unauthorizedError="unauthorizedError";
  static const String notFoundError = "notFoundError"; // 404
  static const String conflictError = "conflictError"; // 409
  static const String internalServerError = "internalServerError"; // 500
  static const String unKnownError = "unKnownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}