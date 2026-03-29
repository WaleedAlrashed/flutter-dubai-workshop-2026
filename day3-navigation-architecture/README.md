<h1 align="center">
  <img src="https://img.shields.io/badge/Day_3-Navigation_&_Architecture-009688?style=for-the-badge&logo=flutter&logoColor=white" alt="Day 3">
</h1>

<p align="center">
  <strong>GoRouter, Dio Networking, Feature-Based Architecture</strong>
</p>

---

## What You'll Learn

- Navigator 1.0 vs Navigator 2.0 (declarative routing)
- GoRouter: routes, ShellRoute, deep linking, route guards
- Dio HTTP client with interceptors
- Feature-based folder structure
- Pagination patterns and search/filter
- Reusable error, loading, and empty state widgets

## Capstone: Dubai Volunteer Connect (Day 3)

The third iteration adds proper navigation and architecture:

- **GoRouter** with ShellRoute for persistent bottom navigation
- **4-tab layout**: Opportunities, My Hours, AI Assistant, Profile
- **Deep linking**: `/opportunities/:id` for opportunity details
- **Dio API client** with base configuration
- **Feature-based folders** (auth, opportunities, hours, profile, ai_assistant)
- **Search & filter** on opportunities list
- **Opportunity detail screen** with sign-up button

### Architecture

```
lib/
├── app/
│   ├── router.dart               # GoRouter with ShellRoute + auth redirect
│   └── app.dart                  # MaterialApp.router
├── core/
│   ├── network/api_client.dart   # Dio setup
│   └── widgets/                  # Error, Loading, Empty views
├── features/
│   ├── auth/                     # Login, Register
│   ├── opportunities/            # List + Detail screens
│   ├── hours/                    # My Hours + Log Hours
│   ├── profile/                  # Profile screen
│   └── ai_assistant/             # Chat placeholder
└── shared/widgets/               # Cards, StatsRow, MainShell
```

### Navigation Map

```
/login
/register
/opportunities          <- Tab 1 (ShellRoute)
/opportunities/:id      <- Detail (pushes on top)
/hours                  <- Tab 2
/hours/log              <- Log form (pushes on top)
/ai-chat                <- Tab 3
/profile                <- Tab 4
```

### Running

```bash
cd volunteer_connect_day3
flutter pub get
flutter run -d chrome
```

## Schedule

| Time | Topic |
|------|-------|
| 9:00 - 9:20 | Day 2 Recap |
| 9:20 - 10:00 | Navigation Deep-Dive |
| 10:00 - 10:15 | Break |
| 10:15 - 11:15 | GoRouter Implementation |
| 11:15 - 12:00 | Advanced UI Components |
| 12:00 - 12:30 | Package Evaluation Skills |
| 12:30 - 1:30 | Lunch |
| 1:30 - 2:15 | API Integration with Dio |
| 2:15 - 2:45 | Data Models |
| 2:45 - 3:50 | Capstone: Volunteer Connect |
| 3:50 - 4:00 | Wrap-Up |

## Dependencies

```yaml
flutter_riverpod: ^2.6.1
go_router: ^14.8.1
dio: ^5.7.0
url_launcher: ^6.3.1
```
