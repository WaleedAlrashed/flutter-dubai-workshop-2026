import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/gemini_service.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final bool isStreaming;

  const ChatMessage({required this.text, required this.isUser, this.isStreaming = false});

  ChatMessage copyWith({String? text, bool? isUser, bool? isStreaming}) {
    return ChatMessage(
      text: text ?? this.text,
      isUser: isUser ?? this.isUser,
      isStreaming: isStreaming ?? this.isStreaming,
    );
  }
}

class ChatNotifier extends Notifier<List<ChatMessage>> {
  late final GeminiService _gemini;

  @override
  List<ChatMessage> build() {
    _gemini = GeminiService();
    _gemini.startChat();
    return [];
  }

  Future<void> sendMessage(String text) async {
    // Add user message
    state = [...state, ChatMessage(text: text, isUser: true)];

    // Add placeholder for AI response
    state = [...state, const ChatMessage(text: '', isUser: false, isStreaming: true)];

    try {
      final buffer = StringBuffer();
      await for (final chunk in _gemini.sendMessageStream(text)) {
        buffer.write(chunk);
        final messages = [...state];
        messages[messages.length - 1] = ChatMessage(
          text: buffer.toString(),
          isUser: false,
          isStreaming: true,
        );
        state = messages;
      }
      // Mark as done streaming
      final messages = [...state];
      messages[messages.length - 1] = messages.last.copyWith(isStreaming: false);
      state = messages;
    } catch (e) {
      final messages = [...state];
      messages[messages.length - 1] = ChatMessage(
        text: 'Sorry, I encountered an error: ${e.toString()}',
        isUser: false,
      );
      state = messages;
    }
  }

  void clear() {
    _gemini.startChat();
    state = [];
  }
}

final chatProvider = NotifierProvider<ChatNotifier, List<ChatMessage>>(ChatNotifier.new);
