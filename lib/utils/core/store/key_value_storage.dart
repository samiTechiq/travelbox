import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelbox/utils/core/store/key_value_class.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  /// The instance of shared preferences
  final SharedPreferences prefs;

  /// The single instance which will remain all through the app lifecycle
  static KeyValueStorageServiceImpl? _instance;

  /// Getter for the instance
  static KeyValueStorageServiceImpl get instance => _instance!;

  /// Set the instance value, if not already set, by creating an object
  /// of `KeyValueStorageServiceImpl` type and passing the SharedPreferences.
  static void setSharedPreferences(SharedPreferences prefs) {
    _instance ??= KeyValueStorageServiceImpl._(prefs);
  }

  /// Private Constructor to prevent multiple instances of this class.
  KeyValueStorageServiceImpl._(this.prefs);

  /// The `get` operation returns the value itself, not a future.
  @override
  T? getValue<T>(String key) {
    switch (T) {
      case String:
        return prefs.getString(key) as T?;
      case int:
        return prefs.getInt(key) as T?;
      case double:
        return prefs.getDouble(key) as T?;
      case bool:
        return prefs.getBool(key) as T?;
      case List:
        return prefs.getStringList(key) as T?;
      default:
        throw UnimplementedError(
            'No implementation Get for ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    switch (T) {
      case String:
        await prefs.setString(key, value as String);
        break;
      case int:
        await prefs.setInt(key, value as int);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case bool:
        await prefs.setBool(key, value as bool);
        break;
      case List:
        await prefs.setStringList(key, value as List<String>);
        break;
      default:
        throw UnimplementedError(
            'No implementation Set for  ${T.runtimeType}');
    }
  }
}
