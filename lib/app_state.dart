import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _playerName =
          await secureStorage.getString('ff_playerName') ?? _playerName;
    });
    await _safeInitAsync(() async {
      _isDarkMode = await secureStorage.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    await _safeInitAsync(() async {
      _lastAchievedLevel = await secureStorage.getInt('ff_lastAchievedLevel') ??
          _lastAchievedLevel;
    });
    await _safeInitAsync(() async {
      _isSoundOn = await secureStorage.getBool('ff_isSoundOn') ?? _isSoundOn;
    });
    await _safeInitAsync(() async {
      _musicFile = await secureStorage.getString('ff_musicFile') ?? _musicFile;
    });
    await _safeInitAsync(() async {
      _currentMusicVolume =
          await secureStorage.getDouble('ff_currentMusicVolume') ??
              _currentMusicVolume;
    });
    await _safeInitAsync(() async {
      _currentLevel =
          await secureStorage.getInt('ff_currentLevel') ?? _currentLevel;
    });
    await _safeInitAsync(() async {
      _correctOption =
          await secureStorage.getString('ff_correctOption') ?? _correctOption;
    });
    await _safeInitAsync(() async {
      _curentQuestion =
          await secureStorage.getInt('ff_curentQuestion') ?? _curentQuestion;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _playerName = '';
  String get playerName => _playerName;
  set playerName(String value) {
    _playerName = value;
    secureStorage.setString('ff_playerName', value);
  }

  void deletePlayerName() {
    secureStorage.delete(key: 'ff_playerName');
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    secureStorage.setBool('ff_isDarkMode', value);
  }

  void deleteIsDarkMode() {
    secureStorage.delete(key: 'ff_isDarkMode');
  }

  int _levelsCount = 5;
  int get levelsCount => _levelsCount;
  set levelsCount(int value) {
    _levelsCount = value;
  }

  int _lastAchievedLevel = 0;
  int get lastAchievedLevel => _lastAchievedLevel;
  set lastAchievedLevel(int value) {
    _lastAchievedLevel = value;
    secureStorage.setInt('ff_lastAchievedLevel', value);
  }

  void deleteLastAchievedLevel() {
    secureStorage.delete(key: 'ff_lastAchievedLevel');
  }

  List<PlayerStruct> _currentPlayers = [];
  List<PlayerStruct> get currentPlayers => _currentPlayers;
  set currentPlayers(List<PlayerStruct> value) {
    _currentPlayers = value;
  }

  void addToCurrentPlayers(PlayerStruct value) {
    currentPlayers.add(value);
  }

  void removeFromCurrentPlayers(PlayerStruct value) {
    currentPlayers.remove(value);
  }

  void removeAtIndexFromCurrentPlayers(int index) {
    currentPlayers.removeAt(index);
  }

  void updateCurrentPlayersAtIndex(
    int index,
    PlayerStruct Function(PlayerStruct) updateFn,
  ) {
    currentPlayers[index] = updateFn(_currentPlayers[index]);
  }

  void insertAtIndexInCurrentPlayers(int index, PlayerStruct value) {
    currentPlayers.insert(index, value);
  }

  List<LevelStruct> _levelsList = [];
  List<LevelStruct> get levelsList => _levelsList;
  set levelsList(List<LevelStruct> value) {
    _levelsList = value;
  }

  void addToLevelsList(LevelStruct value) {
    levelsList.add(value);
  }

  void removeFromLevelsList(LevelStruct value) {
    levelsList.remove(value);
  }

  void removeAtIndexFromLevelsList(int index) {
    levelsList.removeAt(index);
  }

  void updateLevelsListAtIndex(
    int index,
    LevelStruct Function(LevelStruct) updateFn,
  ) {
    levelsList[index] = updateFn(_levelsList[index]);
  }

  void insertAtIndexInLevelsList(int index, LevelStruct value) {
    levelsList.insert(index, value);
  }

  bool _isHapticAllowed = true;
  bool get isHapticAllowed => _isHapticAllowed;
  set isHapticAllowed(bool value) {
    _isHapticAllowed = value;
  }

  bool _isSoundOn = true;
  bool get isSoundOn => _isSoundOn;
  set isSoundOn(bool value) {
    _isSoundOn = value;
    secureStorage.setBool('ff_isSoundOn', value);
  }

  void deleteIsSoundOn() {
    secureStorage.delete(key: 'ff_isSoundOn');
  }

  String _musicFile =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cipherhunt-8l4cam/assets/kh8v0d7hnb9o/Nevada_-_Vicetone_Nublet_Karaoke.mp3';
  String get musicFile => _musicFile;
  set musicFile(String value) {
    _musicFile = value;
    secureStorage.setString('ff_musicFile', value);
  }

  void deleteMusicFile() {
    secureStorage.delete(key: 'ff_musicFile');
  }

  double _currentMusicVolume = 50.0;
  double get currentMusicVolume => _currentMusicVolume;
  set currentMusicVolume(double value) {
    _currentMusicVolume = value;
    secureStorage.setDouble('ff_currentMusicVolume', value);
  }

  void deleteCurrentMusicVolume() {
    secureStorage.delete(key: 'ff_currentMusicVolume');
  }

  bool _isAnswerCorrect = true;
  bool get isAnswerCorrect => _isAnswerCorrect;
  set isAnswerCorrect(bool value) {
    _isAnswerCorrect = value;
  }

  int _currentLevel = 1;
  int get currentLevel => _currentLevel;
  set currentLevel(int value) {
    _currentLevel = value;
    secureStorage.setInt('ff_currentLevel', value);
  }

  void deleteCurrentLevel() {
    secureStorage.delete(key: 'ff_currentLevel');
  }

  String _correctOption = '';
  String get correctOption => _correctOption;
  set correctOption(String value) {
    _correctOption = value;
    secureStorage.setString('ff_correctOption', value);
  }

  void deleteCorrectOption() {
    secureStorage.delete(key: 'ff_correctOption');
  }

  /// track the qurrent question in the game
  int _curentQuestion = 1;
  int get curentQuestion => _curentQuestion;
  set curentQuestion(int value) {
    _curentQuestion = value;
    secureStorage.setInt('ff_curentQuestion', value);
  }

  void deleteCurentQuestion() {
    secureStorage.delete(key: 'ff_curentQuestion');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
