import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _playerName = prefs.getString('ff_playerName') ?? _playerName;
    });
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    _safeInit(() {
      _lastAchievedLevel =
          prefs.getInt('ff_lastAchievedLevel') ?? _lastAchievedLevel;
    });
    _safeInit(() {
      _isSoundOn = prefs.getBool('ff_isSoundOn') ?? _isSoundOn;
    });
    _safeInit(() {
      _musicFile = prefs.getString('ff_musicFile') ?? _musicFile;
    });
    _safeInit(() {
      _currentMusicVolume =
          prefs.getDouble('ff_currentMusicVolume') ?? _currentMusicVolume;
    });
    _safeInit(() {
      _currentLevel = prefs.getInt('ff_currentLevel') ?? _currentLevel;
    });
    _safeInit(() {
      _correctOption = prefs.getString('ff_correctOption') ?? _correctOption;
    });
    _safeInit(() {
      _curentQuestion = prefs.getInt('ff_curentQuestion') ?? _curentQuestion;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _playerName = '';
  String get playerName => _playerName;
  set playerName(String value) {
    _playerName = value;
    prefs.setString('ff_playerName', value);
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
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
    prefs.setInt('ff_lastAchievedLevel', value);
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
    prefs.setBool('ff_isSoundOn', value);
  }

  String _musicFile =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cipherhunt-8l4cam/assets/kh8v0d7hnb9o/Nevada_-_Vicetone_Nublet_Karaoke.mp3';
  String get musicFile => _musicFile;
  set musicFile(String value) {
    _musicFile = value;
    prefs.setString('ff_musicFile', value);
  }

  double _currentMusicVolume = 50.0;
  double get currentMusicVolume => _currentMusicVolume;
  set currentMusicVolume(double value) {
    _currentMusicVolume = value;
    prefs.setDouble('ff_currentMusicVolume', value);
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
    prefs.setInt('ff_currentLevel', value);
  }

  String _correctOption = '';
  String get correctOption => _correctOption;
  set correctOption(String value) {
    _correctOption = value;
    prefs.setString('ff_correctOption', value);
  }

  /// track the qurrent question in the game
  int _curentQuestion = 1;
  int get curentQuestion => _curentQuestion;
  set curentQuestion(int value) {
    _curentQuestion = value;
    prefs.setInt('ff_curentQuestion', value);
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
