part of remote;

class ApiHeaders {
  setTokenHeaders(String token) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000"
      };

  setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000"
      };
}
