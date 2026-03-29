<h1 align="center">
  <img src="https://img.shields.io/badge/Day_1-Flutter_Foundations-C0392B?style=for-the-badge&logo=flutter&logoColor=white" alt="Day 1">
</h1>

<p align="center">
  <strong>Widgets, Layout, Theming & Your First Flutter App</strong>
</p>

---

## What You'll Learn

- Flutter architecture (Widget Tree -> Element Tree -> RenderObject Tree)
- Dart essentials: null safety, type system, async patterns
- StatelessWidget vs StatefulWidget
- Layout widgets: Container, Column, Row, Stack, Expanded
- Material 3 theming with `ColorScheme.fromSeed`
- Dark/light theme toggle
- AI integration with Gemini

## Projects

### Mini Demos

| # | Project | Description | Live Demo |
|---|---------|-------------|-----------|
| 1 | [`demo_hello_flutter`](./demo_hello_flutter/) | First Flutter app — widget tree basics | [Live](https://day1-demo-hello-flutter.pages.dev) |
| 2 | [`demo_layout_widgets`](./demo_layout_widgets/) | Layout widget showcase — Container, Row, Column, Stack | [Live](https://day1-demo-layout-widgets.pages.dev) |
| 3 | [`demo_stateful_counter`](./demo_stateful_counter/) | StatelessWidget vs StatefulWidget comparison | [Live](https://day1-demo-stateful-counter.pages.dev) |
| 4 | [`demo_theming`](./demo_theming/) | Material 3 theme switching with component showcase | [Live](https://day1-demo-theming.pages.dev) |
| 5 | [`demo_dubai_profile_card`](./demo_dubai_profile_card/) | Day 1 capstone — polished profile card with theme toggle | [Live](https://day1-demo-dubai-profile-card.pages.dev) |
| 6 | [`demo_gemini_chat`](./demo_gemini_chat/) | AI chat interface with Gemini streaming responses | [Live](https://day1-demo-gemini-chat.pages.dev) |
| 7 | [`demo_gemini_profile_gen`](./demo_gemini_profile_gen/) | AI-generated profiles rendered as styled cards | [Live](https://day1-demo-gemini-profile-gen.pages.dev) |

## Running a Demo

```bash
cd demo_hello_flutter
flutter pub get
flutter run -d chrome
```

## Schedule

| Time | Topic |
|------|-------|
| 9:00 - 9:30 | Opening & Course Introduction |
| 9:30 - 10:15 | The 2026 Development Landscape |
| 10:15 - 10:30 | Break |
| 10:30 - 11:15 | Flutter Architecture Deep-Dive |
| 11:15 - 12:00 | Environment Setup |
| 12:00 - 12:30 | Dart Essentials |
| 12:30 - 1:30 | Lunch |
| 1:30 - 2:15 | Widget Fundamentals |
| 2:15 - 3:45 | Mini App: Dubai Profile Card |
| 3:45 - 4:00 | Wrap-Up & Homework |

## Key Takeaways

- Everything in Flutter is a widget
- Start with `StatelessWidget`, use `StatefulWidget` only when needed
- `const` constructors improve performance
- `ColorScheme.fromSeed` generates a full color palette from one color
- Material 3 gives you a modern, consistent design system for free
