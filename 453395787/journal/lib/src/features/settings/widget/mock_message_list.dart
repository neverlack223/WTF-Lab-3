import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/models/ui/message.dart';
import '../../../common/utils/insets.dart';
import '../../chat/chat.dart';
import '../../chat/widget/message_list/items/time_item.dart';
import '../../chat/widget/message_list/with_background_image.dart';
import '../cubit/settings_cubit.dart';
import '../data/settings_repository_api.dart';

class MockMessageList extends StatelessWidget {
  const MockMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return WithBackgroundImage(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Insets.large,
        ),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.isCenterDateBubbleShown)
                  TimeItem(
                    dateTime: DateTime.now(),
                  ),
                MessageItem(
                  message: Message(
                    id: '0',
                    text: 'Hello world',
                    dateTime: DateTime.now(),
                  ),
                  alignment: state.messageAlignment == MessageAlignment.left
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                ),
                MessageItem(
                  message: Message(
                    id: '1',
                    text: 'You can customize theme here',
                    dateTime: DateTime.now(),
                  ),
                  alignment: state.messageAlignment == MessageAlignment.left
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
