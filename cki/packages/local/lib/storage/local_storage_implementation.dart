part of local;

class LocalStorageImplementation implements ILocalStorage {
  @override
  Future<bool> clear({bool? debugData}) async {
    try {
      SharedPreferences shared = await SharedPreferences.getInstance();
      bool response = await shared.clear();
      return response;
    } catch (e) {
      throw CachedException("$e");
    }
  }

  @override
  Future get({required String key, Map<String, Object?>? debugData}) async {
    try {
      var shared = await SharedPreferences.getInstance();
      return shared.get(key);
    } catch (e) {
      throw CachedException("$e");
    }
  }

  @override
  Future<bool> delete({required String key, bool? debugData}) async {
    try {
      var shared = await SharedPreferences.getInstance();
      bool response = await shared.remove(key);
      return response;
    } catch (e) {
      throw CachedException("$e");
    }
  }

  @override
  Future<bool> put(
      {required String key, required dynamic value, bool? debugData}) async {
    try {
      var shared = await SharedPreferences.getInstance();
      bool response = false;
      if (value is bool) {
        response = await shared.setBool(key, value);
        return response;
      } else if (value is String) {
        response = await shared.setString(key, value);
        return response;
      } else if (value is int) {
        response = await shared.setInt(key, value);
        return response;
      } else if (value is double) {
        response = await shared.setDouble(key, value);
        return response;
      } else if (value is List<String>) {
        response = await shared.setStringList(key, value);
        return response;
      } else {
        return response;
      }
    } catch (e) {
      throw CachedException("$e");
    }
  }
}
