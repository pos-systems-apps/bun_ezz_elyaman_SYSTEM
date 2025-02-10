class SplashApiEndPoints {
  static getUsersUrl(String baseUrl, String name) =>
      '${baseUrl}api/v1/customer/search?name=$name';

  static getBankAccountsUrl(String baseUrl) => '${baseUrl}api/v1/account/list';
}
