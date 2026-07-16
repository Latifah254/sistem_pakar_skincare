import 'package:flutter/material.dart';

import 'package:sistem_pakar_skincare/models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isBot = message.isBot;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isBot
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
        children: [
          if (isBot) ...[
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xffDDF4E3),
              child: Icon(
                Icons.smart_toy_rounded,
                color: Color(0xff2E8B57),
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
          ],

          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth:
                    MediaQuery.of(context).size.width * 0.72,
              ),

              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),

              decoration: BoxDecoration(
                color: isBot
                    ? Colors.white
                    : const Color(0xffB7E4C7),

                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(22),
                  topRight: const Radius.circular(22),
                  bottomLeft: Radius.circular(
                    isBot ? 6 : 22,
                  ),
                  bottomRight: Radius.circular(
                    isBot ? 22 : 6,
                  ),
                ),

                border: isBot
                    ? Border.all(
                        color: Colors.grey.shade200,
                      )
                    : null,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.end,
                children: [

                  Expanded(
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color: isBot
                            ? Colors.black87
                            : Colors.black87,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),

                  if (!isBot) ...[
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.done_all,
                      size: 16,
                      color: Color(0xff2E8B57),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}