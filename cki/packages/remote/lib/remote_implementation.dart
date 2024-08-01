part of remote;

class RemoteImplementation implements IRemote{
  RemoteImplementation(this.baseURL);
  final _client = http.Client();
  String? baseURL;
  int timeout = 360;

  @override
  Future delete(
      {required String query,
      required Map<String, String> header,
      body,
      Map<String, Object?>? debugData}) async {
    try {
      var base = baseURL != null ? '$baseURL/$query' : query;
      var uri = Uri.encodeFull(base);
      var url = Uri.parse(uri);
      final response = await _client
          .delete(url,
              headers: header,
              body: body != null ? json.encode(body.toJson()) : null)
          .timeout(Duration(seconds: timeout));
      Map<String, dynamic> responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw const FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw const FetchDataException('O que procuras não existe');
    } on FormatException {
      throw const FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw const FetchDataException('O pedido demorou muito. Tente novamente');
    } on FileSystemException {
      throw const FetchDataException(
          'Ficheira não encontrado. Tente novamente');
    } on TlsException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    } on ClientException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    }
  }

  @override
  Future get(
      {required String query,
      required Map<String, String> header,
      Map<String, Object?>? debugData}) async {
    try {
      var base = baseURL != null ? '$baseURL/$query' : query;
      var uri = Uri.encodeFull(base);
      var url = Uri.parse(uri);

      final response = await _client
          .get(url, headers: header)
          .timeout(Duration(seconds: timeout));
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw const FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw const FetchDataException('O que procuras não existe');
    } on FormatException {
      throw const FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw const FetchDataException('O pedido demorou muito. Tente novamente');
    } on FileSystemException {
      throw const FetchDataException(
          'Ficheira não encontrado. Tente novamente');
    } on TlsException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    } on ClientException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    }
  }

  @override
  Future patch(
      {required String query,
      required Map<String, String> header,
      body,
      Map<String, Object?>? debugData}) async {
    try {
      var base = baseURL != null ? '$baseURL/$query' : query;
      var uri = Uri.encodeFull(base);
      var url = Uri.parse(uri);

      http.Response response = await _client
          .patch(url,
              headers: header,
              body: body != null ? json.encode(body.toJson()) : null)
          .timeout(Duration(seconds: timeout));
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw const FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw const FetchDataException('O que procuras não existe');
    } on FormatException {
      throw const FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw const FetchDataException('O pedido demorou muito. Tente novamente');
    } on FileSystemException {
      throw const FetchDataException(
          'Ficheira não encontrado. Tente novamente');
    } on TlsException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    } on ClientException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    }
  }

  @override
  Future post(
      {required String query,
      required Map<String, String> header,
      body,
      Map<String, Object?>? debugData}) async {
    try {
      var base = baseURL != null ? '$baseURL/$query' : query;
      var uri = Uri.encodeFull(base);

      var url = Uri.parse(uri);

      http.Response response = await _client
          .post(url,
              headers: header,
              body: body != null ? json.encode(body.toJson()) : null)
          .timeout(Duration(seconds: timeout));
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw const FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw const FetchDataException('O que procuras não existe');
    } on FormatException {
      throw const FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw const FetchDataException('O pedido demorou muito. Tente novamente');
    } on FileSystemException {
      throw const FetchDataException(
          'Ficheira não encontrado. Tente novamente');
    } on TlsException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    } on ClientException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    }
  }

  @override
  Future put(
      {required String query,
      required Map<String, String> header,
      body,
      Map<String, Object?>? debugData}) async {
    try {
      var base = baseURL != null ? '$baseURL/$query' : query;
      var uri = Uri.encodeFull(base);
      var url = Uri.parse(uri);

      final response = await _client
          .put(url,
              headers: header,
              body: body != null ? json.encode(body.toJson()) : null)
          .timeout(Duration(seconds: timeout));
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw const FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw const FetchDataException('O que procuras não existe');
    } on FormatException {
      throw const FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw const FetchDataException('O pedido demorou muito. Tente novamente');
    } on FileSystemException {
      throw const FetchDataException(
          'Ficheira não encontrado. Tente novamente');
    } on TlsException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    } on ClientException {
      throw const FetchDataException('Erro de conexão. Tente novamente');
    }
  }

  @override
  Map<String, dynamic> returnResponse(http.Response response) {
    Map<String, dynamic> data = json.decode(response.body);
    switch (response.statusCode) {

      case 201:
      case 200:
        return data;
      //WARNING: api's can be unrealiable so you
      //may create your own exception error message

      case 400:
        throw BadRequestException(data['message']);
      case 401:
      case 403:
        throw UnauthorisedException(data['message']);
      case 404:
        throw NotFoundException(data['message']);
      case 500:
      default:
        throw FetchDataException(data['message']);
    }
  }

}
