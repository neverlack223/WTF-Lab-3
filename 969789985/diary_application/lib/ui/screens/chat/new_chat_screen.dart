import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

import '../../../basic/models/chat_model.dart';
import '../../../widgets/chat_list/chat_variation.dart';
import '../../utils/icons.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) => ChatVariation(
        chat: ChatModel(
          id: 0,
          chatTitle: '',
          chatIcon: possibleIcons.first,
          messages: IList(),
        ),
        isEditMode: false,
      );
}
