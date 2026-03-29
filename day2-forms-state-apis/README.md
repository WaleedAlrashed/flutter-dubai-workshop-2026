<h1 align="center">
  <img src="https://img.shields.io/badge/Day_2-Forms,_State_&_APIs-F5A623?style=for-the-badge&logo=flutter&logoColor=white" alt="Day 2">
</h1>

<p align="center">
  <strong>Forms, Validation, Riverpod State Management & API Integration</strong>
</p>

---

## What You'll Learn

- Widget lifecycle: `initState()`, `build()`, `dispose()`
- Form widgets: TextField, DatePicker, DropdownMenu, Chips
- Form validation with inline error messages
- Riverpod fundamentals: Provider, StateNotifier, ConsumerWidget
- HTTP basics and mock API patterns
- Building a feature-complete form-driven app

## Capstone: Dubai Volunteer Connect (Day 2)

The second iteration of our capstone project. Today we add:

- **Login & registration forms** with full validation
- **Log hours form** with date picker and dropdowns
- **Riverpod state management** (no more setState!)
- **Mock data layer** with 10 Dubai volunteer opportunities
- **Profile screen** with volunteer stats

### Architecture

```
lib/
├── main.dart & app.dart          # ProviderScope + MaterialApp
├── models/                        # Volunteer, Opportunity, LogEntry
├── providers/                     # Riverpod state (auth, opportunities, hours)
├── data/mock_data.dart           # 10 Dubai-themed opportunities
├── screens/                       # Login, Register, Home, Log Hours, Profile
└── widgets/                       # OpportunityCard, StatsRow
```

### Running

```bash
cd volunteer_connect_day2
flutter pub get
flutter run -d chrome
```

### Mock Volunteer Opportunities

| # | Opportunity | Category | Hours | Spots |
|---|------------|----------|-------|-------|
| 1 | Beach Cleanup - Jumeirah | Environmental | 4h | 15 |
| 2 | Food Distribution - Al Quoz | Community | 3h | 20 |
| 3 | Expo City Teaching Program | Education | 6h | 8 |
| 4 | Dubai Marathon Support | Sports | 8h | 50 |
| 5 | Senior Care Visit - Rashidiya | Healthcare | 3h | 10 |
| 6 | Tree Planting - Al Barsha Park | Environmental | 5h | 25 |
| 7 | Ramadan Iftar Service | Community | 4h | 30 |
| 8 | Youth Coding Workshop - DIFC | Education | 6h | 12 |

## Schedule

| Time | Topic |
|------|-------|
| 9:00 - 9:20 | Day 1 Recap |
| 9:20 - 10:00 | Widget Lifecycle Deep-Dive |
| 10:00 - 10:15 | Break |
| 10:15 - 11:00 | Core Input Widgets |
| 11:00 - 12:00 | Forms & Validation |
| 12:00 - 12:30 | State Management Introduction |
| 12:30 - 1:30 | Lunch |
| 1:30 - 2:15 | Riverpod Fundamentals |
| 2:15 - 3:00 | API Integration Basics |
| 3:00 - 3:50 | Capstone: Volunteer Connect |
| 3:50 - 4:00 | Wrap-Up |

## Dependencies

```yaml
flutter_riverpod: ^2.6.1
url_launcher: ^6.3.1
```
