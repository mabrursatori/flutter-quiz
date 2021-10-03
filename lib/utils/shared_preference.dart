part of 'utils.dart';

class SharedPreference {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<List<Level>> setSession(
      {@required String key, @required List<Level> data}) async {
    final SharedPreferences prefs = await _prefs;
    String jsonText = jsonEncode(data);
    await prefs.setString(key, jsonText);
    List list = json.decode(prefs.getString(key));
    List<Level> newList = list.map((e) => Level.fromJson(e)).toList();
    return newList;
  }

  static Future<List<Level>> getSession({@required String key}) async {
    final SharedPreferences prefs = await _prefs;
    var jsonText = prefs.getString(key);
    if (jsonText != null) {
      List list = json.decode(prefs.getString(key));
      List<Level> newList = list.map((e) => Level.fromJson(e)).toList();
      return newList;
    }
    return null;
  }
}
