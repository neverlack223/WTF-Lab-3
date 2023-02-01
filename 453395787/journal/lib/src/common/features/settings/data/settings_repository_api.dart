import '../settings.dart';

abstract class SettingsRepositoryApi {
  FontScaleFactor get fontScaleFactor;

  Future<void> setFontScaleFactor(FontScaleFactor fontScaleFactor);

  MessageAlignment get messageAlignment;

  Future<void> setMessageAlignment(MessageAlignment messageAlignment);

  bool get isCenterDateBubbleShown;

  Future<void> setCenterDateBubbleShown(bool isCenterDateBubbleShown);

  String? get backgroundImagePath;

  Future<void> setBackgroundImagePath(String? imagePath);

  Future<void> resetToDefault();
}
