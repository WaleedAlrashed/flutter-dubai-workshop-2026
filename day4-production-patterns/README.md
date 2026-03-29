<h1 align="center">
  <img src="https://img.shields.io/badge/Day_4-Production_Patterns-2D2D2D?style=for-the-badge&logo=flutter&logoColor=white" alt="Day 4">
</h1>

<p align="center">
  <strong>Clean Architecture, Error Handling, Interceptors & AI Integration</strong>
</p>

---

## What You'll Learn

- Clean Architecture principles in Flutter
- Result pattern for typed error handling
- Sealed exception classes (`AppException`)
- Dio interceptor chains (logging, error transformation)
- Repository pattern with dependency injection
- Production-level state management with Riverpod
- Working Gemini AI integration for in-app chat
- Volunteer rank system (Bronze -> Silver -> Gold -> Platinum)

## Capstone: Dubai Volunteer Connect (Day 4)

The production-ready iteration. Today we add enterprise patterns:

- **Result pattern** — `Success<T>` and `Failure<T>` for all data operations
- **Sealed exceptions** — `NetworkException`, `ServerException`, `ValidationException`
- **Repository layer** — each feature has a repository returning `Result<T>`
- **Dio interceptors** — logging + error transformation chain
- **Working Gemini AI chat** — real streaming responses as a volunteer advisor
- **Rank badges** — Bronze (<50h), Silver (50-149h), Gold (150-299h), Platinum (300+h)
- **Design system tokens** — named color constants for consistency

### Architecture

```
lib/
├── core/
│   ├── error/
│   │   ├── app_exception.dart    # sealed class AppException
│   │   └── result.dart           # Result<T> = Success | Failure
│   └── network/
│       ├── api_client.dart       # Dio with interceptor chain
│       └── interceptors/         # Logging + Error interceptors
├── features/
│   ├── auth/data/                # AuthRepository -> Result<Volunteer>
│   ├── opportunities/data/       # OpportunitiesRepository -> Result<List<Opportunity>>
│   ├── hours/data/               # HoursRepository -> Result<List<LogEntry>>
│   └── ai_assistant/             # Working Gemini chat!
└── theme/
    └── color_tokens.dart         # Dubai design system
```

### Error Handling Pattern

```dart
// Repository returns Result<T>
final result = await repository.getOpportunities();

// Consumer handles both cases
switch (result) {
  case Success(:final data): showData(data);
  case Failure(:final exception): showError(exception.message);
}
```

### Gemini AI Chat

The AI assistant is now fully functional using `gemini-2.5-flash`:
- System prompt as Dubai volunteer advisor
- Streaming responses with typing indicator
- Persistent chat history
- Culturally aware suggestions

### Running

```bash
cd volunteer_connect_day4
flutter pub get
flutter run -d chrome
```

## Schedule

| Time | Topic |
|------|-------|
| 9:00 - 9:20 | Day 3 Recap |
| 9:20 - 10:00 | Production App Walkthrough (Hamdan Volunteer) |
| 10:00 - 10:15 | Break |
| 10:15 - 11:15 | Networking Patterns Deep-Dive |
| 11:15 - 12:00 | Exception Handling Architecture |
| 12:00 - 12:30 | State Management Patterns |
| 12:30 - 1:30 | Lunch |
| 1:30 - 2:15 | Localization (Arabic/English) |
| 2:15 - 2:45 | Theming & Design Systems |
| 2:45 - 3:45 | Capstone: Volunteer Connect |
| 3:45 - 4:00 | Wrap-Up |

## Dependencies

```yaml
flutter_riverpod: ^2.6.1
go_router: ^14.8.1
dio: ^5.7.0
url_launcher: ^6.3.1
google_generative_ai: ^0.4.6
```
