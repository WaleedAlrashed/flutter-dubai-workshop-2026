# Day 1: Flutter Foundations & First App
## Dubai Workshop 2026 — March 30, 2026

**Instructor:** Waleed Mazen Alrashed
**Schedule:** 9:00 AM – 4:00 PM | **Location:** Vinsys Office, Sheikh Zayed Road, Dubai

---

## Agenda

| Time | Topic |
|------|-------|
| 9:00 – 9:30 | Opening & Course Introduction |
| 9:30 – 10:15 | The 2026 Development Landscape |
| 10:15 – 10:30 | ☕ Morning Break |
| 10:30 – 11:15 | Flutter Architecture Deep-Dive |
| 11:15 – 12:00 | Environment Setup |
| 12:00 – 12:30 | Dart Essentials |
| 12:30 – 1:30 | 🍽️ Lunch Break |
| 1:30 – 2:15 | Widget Fundamentals |
| 2:15 – 3:45 | Mini App: Dubai Profile Card |
| 3:45 – 4:00 | Wrap-Up & Homework |

---

## 1. Opening & Course Introduction (9:00 – 9:30)

### Course Philosophy
> "In 2026, knowing *how* to write a for-loop is table stakes. Knowing *when*, *why*, and *how to architect* systems is what separates effective developers from prompt-typists."

### What We'll Build This Week
| Day | Mini App | Skills |
|-----|----------|--------|
| 1 | **Dubai Profile Card** | Widgets, layout, theming |
| 2 | **Meal Logger** | Forms, validation, state, APIs |
| 3 | **Countries Navigator** | Navigation, lists, architecture |
| 4-5 | **Production Study** | Clean Architecture, Riverpod, Deployment |

### AI-Augmented Development
- Use AI tools (Claude Code, Cursor, Copilot) throughout the course
- Focus on **architecture decisions** AI can't make for you
- Emphasize **code review skills** for AI-generated code
- Build real apps + study production patterns

---

## 2. The 2026 Development Landscape (9:30 – 10:15)

### Evolution of Mobile Development
```
Native (Obj-C/Swift, Java/Kotlin)
  → Hybrid (Cordova, Ionic)
    → Cross-Platform (React Native, Flutter)
      → AI-Augmented (Flutter + AI Assistants)
```

### Why Flutter Thrives in the AI Era
- **Declarative UI** — describe *what* you want, not *how* to build it
- **Strong typing** — Dart's type system catches errors AI might introduce
- **Widget composition** — small, reusable pieces AI can generate reliably
- **Predictable patterns** — consistent structure helps AI understand your code
- **Single codebase** — web, mobile, desktop from one project

### The Developer's Role in 2026
| You (the Architect) | AI (the Assistant) |
|---------------------|-------------------|
| Architecture decisions | Code generation |
| UX/business logic | Boilerplate & scaffolding |
| Code review & quality | Refactoring suggestions |
| Performance tuning | Documentation |
| Security decisions | Test generation |

**Key insight:** AI generates code. You decide if it's the *right* code.

---

## 3. Flutter Architecture Deep-Dive (10:30 – 11:15)

### The Three Trees
Flutter's rendering pipeline uses three tree structures:

```
Widget Tree (your code)
    ↓ creates
Element Tree (framework-managed)
    ↓ creates
RenderObject Tree (actual layout & paint)
    ↓ renders via
Skia / Impeller → Pixels on screen
```

**Widget Tree** — Immutable descriptions YOU write. Lightweight blueprints.
```dart
Column(
  children: [
    Text('Hello'),      // ← This is a Widget
    Icon(Icons.star),   // ← This too
  ],
)
```

**Element Tree** — Framework-managed lifecycle objects. One Element per Widget. Handles mounting, updating, unmounting.

**RenderObject Tree** — The heavy lifters. Actually compute layout (size, position) and paint pixels. Not every Widget creates a RenderObject (e.g., `Padding` wraps, `Column` layouts).

### Skia → Impeller
- **Skia**: Original rendering engine, mature but can cause shader compilation jank
- **Impeller**: New engine (default in 2026), pre-compiles shaders, smoother animations
- You don't interact with these directly, but understanding them helps debug performance

### Why This Matters for AI Prompting
When you understand the architecture, you can:
- Write better prompts: "Create a StatelessWidget that composes X, Y, Z"
- Review AI code: spot unnecessary StatefulWidgets, missing const constructors
- Debug performance: understand why a widget rebuilds too often

> 🔗 **Demo:** [Hello Flutter](day1-demo-hello-flutter.pages.dev) — see the widget tree in action

---

## 4. Environment Setup (11:15 – 12:00)

### Required Tools
- **Flutter SDK** 3.41.x (`flutter doctor` to verify)
- **VS Code** with Flutter extension
- **Chrome** for Flutter web development
- **AI Assistant** — Cursor, Copilot, or Claude Code

### Hands-On: Create Your First Project
```bash
# Verify installation
flutter doctor

# Create a web-only project
flutter create --platforms web my_first_app

# Run it
cd my_first_app
flutter run -d chrome
```

### Project Structure
```
my_first_app/
├── lib/
│   └── main.dart          ← Your app code lives here
├── web/
│   └── index.html         ← Web entry point
├── pubspec.yaml           ← Dependencies & metadata
├── analysis_options.yaml  ← Linting rules
└── test/                  ← Unit tests
```

### Hot Reload vs Hot Restart
- **Hot Reload** (`r`) — Injects updated code, preserves state. Use for UI tweaks.
- **Hot Restart** (`R`) — Full restart, resets state. Use after structural changes.

---

## 5. Dart Essentials — What AI Needs You to Know (12:00 – 12:30)

### Null Safety
Dart's sound null safety means types are non-nullable by default:

```dart
String name = 'Dubai';      // ✅ Cannot be null
String? nickname;            // ✅ Can be null (nullable type)

// Null-aware operators
print(nickname?.length);     // Safe access — returns null if nickname is null
print(nickname ?? 'N/A');    // Default value if null
print(nickname!.length);     // ⚠️ Force unwrap — crashes if null!
```

**Rule of thumb:** Prefer `?` and `??` over `!`. The `!` operator is a code smell.

### Type System
```dart
var count = 42;              // Type inferred as int
final name = 'Dubai';       // Can't be reassigned
const pi = 3.14159;         // Compile-time constant

late String description;     // Initialized later, but guaranteed before use
```

**`const` vs `final`:**
- `final` — set once at runtime
- `const` — set once at compile time (enables widget optimization!)

### Collections
```dart
final cities = ['Dubai', 'Abu Dhabi', 'Sharjah'];   // List
final scores = {1: 'Gold', 2: 'Silver'};             // Map
final tags = {'flutter', 'dart', 'mobile'};           // Set

// Spread operator
final allCities = [...cities, 'Ajman', 'Fujairah'];
```

### Async Patterns
```dart
// Future — a single async value
Future<String> fetchData() async {
  final response = await http.get(Uri.parse(url));
  return response.body;
}

// Stream — multiple async values over time
Stream<int> countDown(int from) async* {
  for (var i = from; i >= 0; i--) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}
```

### Exercise: Review AI-Generated Code
What's wrong with this code?
```dart
Future<List<User>> getUsers() async {
  final response = await http.get(Uri.parse(url));
  final data = jsonDecode(response.body);
  return data.map((e) => User.fromJson(e)).toList();
}
```

**Issues:**
1. No error handling — what if the request fails?
2. No status code check — what if it returns 404?
3. `data` is `dynamic` — `.map()` returns `Iterable<dynamic>`, not `Iterable<User>`
4. Missing type cast: need `(data as List).map(...)`

**Better version:**
```dart
Future<List<User>> getUsers() async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw HttpException('Failed: ${response.statusCode}');
    }
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
  } catch (e) {
    throw Exception('Failed to load users: $e');
  }
}
```

---

## 6. Widget Fundamentals (1:30 – 2:15)

### Everything is a Widget
In Flutter, every visual element is a widget:
- `Text('Hello')` — a widget
- `Icon(Icons.star)` — a widget
- `Padding(padding: ...)` — a widget
- `Column(children: [...])` — a widget
- Even the entire app: `MaterialApp(...)` — a widget

### StatelessWidget vs StatefulWidget

**StatelessWidget** — No mutable state. `build()` called by the framework when parent rebuilds.
```dart
class Greeting extends StatelessWidget {
  const Greeting({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text('Hello, $name!');
  }
}
```

**StatefulWidget** — Has mutable state via `State` object. `setState()` triggers a rebuild.
```dart
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        ElevatedButton(
          onPressed: () => setState(() => _count++),
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
```

**Decision framework:** Start with StatelessWidget. Only use StatefulWidget when you need local mutable state (animations, form inputs, toggles).

> 🔗 **Demo:** [Stateful Counter](day1-demo-stateful-counter.pages.dev) — see the difference live

### Key Layout Widgets
| Widget | Purpose |
|--------|---------|
| `Container` | Box model (padding, margin, decoration) |
| `Column` | Vertical layout |
| `Row` | Horizontal layout |
| `Stack` | Overlapping widgets |
| `Expanded` | Fill remaining space |
| `SizedBox` | Fixed size or spacing |
| `Padding` | Add padding around a child |
| `Card` | Material card with elevation |
| `ListView` | Scrollable list |

> 🔗 **Demo:** [Layout Widgets](day1-demo-layout-widgets.pages.dev) — interactive showcase

### The Power of `const`
```dart
// ❌ Rebuilds every time parent rebuilds
child: Text('Hello Dubai')

// ✅ Skipped during rebuild — framework knows it hasn't changed
child: const Text('Hello Dubai')
```

`const` constructors create compile-time constants. The framework can skip diffing these widgets entirely, improving performance.

---

## 7. Theming with Material 3 (within Mini App session)

### ColorScheme.fromSeed
Material 3 generates an entire color palette from a single seed color:

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Color(0xFFC0392B),  // Dubai red
  ),
)
```

This generates: primary, secondary, tertiary, surface, background, error — all harmonized.

### Dark & Light Themes
```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Color(0xFFC0392B),
    brightness: Brightness.light,
  ),
  darkTheme: ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Color(0xFFC0392B),
    brightness: Brightness.dark,
  ),
  themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
)
```

### Accessing Theme in Widgets
```dart
final colorScheme = Theme.of(context).colorScheme;
final textTheme = Theme.of(context).textTheme;

Container(
  color: colorScheme.primaryContainer,
  child: Text(
    'Styled text',
    style: textTheme.headlineMedium,
  ),
)
```

> 🔗 **Demo:** [Material 3 Theming](day1-demo-theming.pages.dev) — toggle dark/light and see components adapt

---

## 8. Mini App: Dubai Profile Card (2:15 – 3:45)

### Requirements
Build a polished profile card inspired by Dubai government apps:
- Profile photo with circular avatar
- User name and Emirates ID display
- Stats row (volunteering hours, events attended, points)
- Action buttons (Edit Profile, Settings)
- Dark/Light theme support

### Widget Decomposition
```
ProfileScreen
├── AppBar (theme toggle)
├── ProfileAvatar (CircleAvatar with gold border)
├── ProfileInfo (name, Emirates ID, title)
├── StatsRow
│   ├── StatItem (hours)
│   ├── StatItem (events)
│   └── StatItem (points)
└── ActionButtons (Edit, Settings)
```

### Step-by-Step Build
1. Create the `Profile` data model
2. Build `ProfileAvatar` — CircleAvatar with Container border
3. Build `ProfileInfo` — Column of Text widgets with theme styles
4. Build `StatsRow` — Row of stat cards with icons
5. Build `ActionButtons` — Row of ElevatedButton widgets
6. Compose everything in `ProfileScreen`
7. Add theme toggle in AppBar

> 🔗 **Demo:** [Dubai Profile Card](day1-demo-dubai-profile-card.pages.dev) — the finished product

---

## 9. AI Integration Preview

### flutter_gemini Setup
```dart
// pubspec.yaml
dependencies:
  flutter_gemini: ^2.0.0

// main.dart
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(apiKey: 'YOUR_API_KEY');
  runApp(const MyApp());
}
```

### Streaming Chat
```dart
Gemini.instance.streamGenerateContent('Tell me about Dubai').listen(
  (event) {
    // event.output contains the generated text chunk
    print(event.output);
  },
);
```

### AI + UI: Profile Generator
Combine Gemini AI with the profile card UI — generate fictional profiles on demand!

> 🔗 **Demo:** [Gemini Chat](day1-demo-gemini-chat.pages.dev) — AI chat interface
> 🔗 **Demo:** [AI Profile Generator](day1-demo-gemini-profile-gen.pages.dev) — AI-generated profile cards

---

## 10. Homework

1. **Enhance your profile card** — Add an animated element (AnimatedContainer, AnimatedOpacity)
2. **Add a section** — Recent activity list or badges/achievements row
3. **Experiment with themes** — Try different seed colors and see how the palette changes
4. **Challenge:** Make the profile card responsive for different screen sizes

---

## Live Demo Links

| Demo | URL | Concepts |
|------|-----|----------|
| Hello Flutter | day1-demo-hello-flutter.pages.dev | Widget tree basics |
| Layout Widgets | day1-demo-layout-widgets.pages.dev | Container, Row, Column, Stack |
| Stateful Counter | day1-demo-stateful-counter.pages.dev | StatelessWidget vs StatefulWidget |
| Material 3 Theming | day1-demo-theming.pages.dev | ThemeData, ColorScheme, dark/light |
| Dubai Profile Card | day1-demo-dubai-profile-card.pages.dev | Capstone — all Day 1 concepts |
| Gemini Chat | day1-demo-gemini-chat.pages.dev | AI streaming chat |
| AI Profile Generator | day1-demo-gemini-profile-gen.pages.dev | AI + UI combined |

---

*Workshop by **Waleed Mazen Alrashed** — [waleedalrashed.com](https://waleedalrashed.com) | [LinkedIn](https://www.linkedin.com/in/waleedalrashed/) | [GitHub](https://github.com/WaleedAlrashed/) | [X](https://x.com/waleedalrashedd)*
