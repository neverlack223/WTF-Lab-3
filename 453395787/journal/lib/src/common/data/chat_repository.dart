import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:rxdart/rxdart.dart';

import '../api/provider/chat_provider_api.dart';
import '../api/repository/chat_repository_api.dart';
import '../models/ui/chat.dart';
import '../utils/transformers.dart';

class ChatRepository extends ChatRepositoryApi {
  ChatRepository({
    required ChatProviderApi provider,
  }) : _provider = provider;

  final ChatProviderApi _provider;

  @override
  ValueStream<IList<Chat>> get chats => _provider.chats
      .transform(
        Transformers.modelsToChatsStreamTransformer,
      )
      .shareValueSeeded(
        Transformers.modelsToChats(
          _provider.chats.value,
        ),
      );

  @override
  Future<void> add(Chat chat) async {
    await _provider.addChat(
      Transformers.chatToModel(chat),
    );
  }

  @override
  Future<void> pin(Chat chat) async {
    await _provider.updateChat(
      Transformers.chatToModel(chat).copyWith(
        isPinned: true,
      ),
    );
  }

  @override
  Future<void> remove(Chat chat) async {
    await _provider.deleteChat(chat.id);
  }

  @override
  Future<void> togglePin(Chat chat) async {
    await _provider.updateChat(
      Transformers.chatToModel(chat).copyWith(
        isPinned: !chat.isPinned,
      ),
    );
  }

  @override
  Future<void> unpin(Chat chat) async {
    await _provider.updateChat(
      Transformers.chatToModel(chat).copyWith(
        isPinned: false,
      ),
    );
  }

  @override
  Future<void> update(Chat chat) async {
    await _provider.updateChat(
      Transformers.chatToModel(chat),
    );
  }
}
