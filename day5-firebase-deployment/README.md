<h1 align="center">
  <img src="https://img.shields.io/badge/Day_5-Firebase_&_Deployment-F38020?style=for-the-badge&logo=firebase&logoColor=white" alt="Day 5">
</h1>

<p align="center">
  <strong>Authentication, Testing, Localization & Cloudflare Pages Deployment</strong>
</p>

---

## What You'll Learn

- Firebase-style authentication flows (stream-based auth state)
- Auth interceptors for API requests
- Unit testing: models, providers, widgets
- Localization with ARB files (English + Arabic stubs)
- Flutter web build optimization
- Deployment to Cloudflare Pages with `peanut`
- The complete production-ready Flutter app

## Capstone: Dubai Volunteer Connect (Day 5 — FINAL)

The complete, polished capstone. Everything from Days 1-4 plus:

- **Stream-based auth** — mock Firebase auth service with `authStateChanges`
- **Auth interceptor** — automatically adds token to API requests
- **Settings screen** — theme toggle, language selection, sign out
- **Animated stat cards** — numbers animate up with `TweenAnimationBuilder`
- **Quick suggestion chips** in AI chat
- **Unit tests** — model tests, provider tests, widget tests
- **Localization stubs** — English + Arabic ARB files
- **Deploy-ready** configuration

### Final Architecture

```
lib/
├── app/                           # Router + App shell
├── core/
│   ├── auth/auth_service.dart    # Mock Firebase auth (streams)
│   ├── error/                    # AppException + Result<T>
│   ├── network/                  # Dio + 3 interceptors (logging, error, auth)
│   └── widgets/                  # Reusable states
├── features/
│   ├── auth/                     # Login + Register (polished)
│   ├── opportunities/            # List + Detail (search, filter)
│   ├── hours/                    # Dashboard + Log form
│   ├── profile/                  # Profile + Settings
│   └── ai_assistant/             # Working Gemini chat with suggestions
├── l10n/                         # app_en.arb + app_ar.arb
├── models/                       # Volunteer, Opportunity, LogEntry
└── shared/widgets/               # Cards, badges, animations
```

### Volunteer Rank System

| Rank | Hours | Badge Color |
|------|-------|------------|
| Bronze | 0-49 | CD7F32 |
| Silver | 50-149 | C0C0C0 |
| Gold | 150-299 | FFD700 |
| Platinum | 300+ | E5E4E2 |

### Running

```bash
cd volunteer_connect_day5
flutter pub get
flutter run -d chrome
```

### Running Tests

```bash
flutter test
```

### Building for Deployment

```bash
flutter build web --release
# Deploy to Cloudflare Pages
npx wrangler pages deploy build/web --project-name=dubai-volunteer-connect
```

## Schedule

| Time | Topic |
|------|-------|
| 9:00 - 9:20 | Day 4 Recap |
| 9:20 - 10:00 | Firebase Setup & Configuration |
| 10:00 - 10:15 | Break |
| 10:15 - 11:15 | Firebase Authentication |
| 11:15 - 12:00 | Push Notifications (FCM) |
| 12:00 - 12:30 | Crashlytics & Analytics |
| 12:30 - 1:30 | Lunch |
| 1:30 - 2:15 | Testing Strategies |
| 2:15 - 2:45 | Flutter Web Build |
| 2:45 - 3:30 | Deploy to Cloudflare Pages |
| 3:30 - 4:00 | Course Wrap-Up & Certificates |

## Dependencies

```yaml
flutter_riverpod: ^2.6.1
go_router: ^14.8.1
dio: ^5.7.0
url_launcher: ^6.3.1
google_generative_ai: ^0.4.6
```

## What You Built This Week

```
Day 1: Widgets, Layout, Theming          -> Profile Card + 6 demos
Day 2: + Forms, Validation, Riverpod     -> Volunteer Connect v2
Day 3: + GoRouter, Dio, Architecture     -> Volunteer Connect v3
Day 4: + Clean Architecture, AI Chat     -> Volunteer Connect v4
Day 5: + Auth, Tests, Deploy             -> Volunteer Connect v5 (FINAL)
```

You now have a **production-grade Flutter web app** deployed on Cloudflare Pages. Congratulations!
