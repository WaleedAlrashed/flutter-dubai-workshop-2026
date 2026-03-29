import 'package:google_generative_ai/google_generative_ai.dart';

const _geminiApiKey = 'AIzaSyCYi9g0YmOPxzhjkTHdfXS6ZvOAnEpLpqU';

class GeminiService {
  late final GenerativeModel _model;
  ChatSession? _chat;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: _geminiApiKey,
      systemInstruction: Content.text(
        'You are a helpful Dubai volunteer assistant. Help users find volunteer '
        'opportunities, answer questions about volunteering in Dubai, and provide '
        'tips for community service. Keep responses concise and friendly.',
      ),
    );
  }

  void startChat() {
    _chat = _model.startChat();
  }

  Stream<String> sendMessageStream(String message) async* {
    _chat ??= _model.startChat();
    final response = _chat!.sendMessageStream(Content.text(message));
    await for (final chunk in response) {
      final text = chunk.text;
      if (text != null) yield text;
    }
  }
}
