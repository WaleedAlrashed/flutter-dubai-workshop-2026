# Day 1 — Project Ideas
## Flutter Foundations & Widget Building

Use these ideas to practice what you learned today. Start with Beginner if you're new to Flutter, or jump to Intermediate/AI-Enhanced for a challenge.

---

## Beginner — Extend What We Built

### 1. Personal Business Card
A digital business card with your photo, name, title, contact info, and a QR code.
- **Widgets:** CircleAvatar, Column, Row, Card, Icon
- **Stretch:** Add `qr_flutter` package to generate a QR code from your contact URL

### 2. Dubai Landmarks Card
Showcase a famous Dubai landmark with an image, description, and fun stats.
- **Widgets:** Image, Container (with decoration), Column, Text, SizedBox
- **Data:** Burj Khalifa (828m, 163 floors, opened 2010), Dubai Frame, Palm Jumeirah

### 3. Team Roster
A scrollable list of team member profile cards using ListView.builder.
- **Widgets:** ListView.builder, Card, ListTile, CircleAvatar
- **Stretch:** Add search/filter functionality

---

## Intermediate — Apply Concepts Creatively

### 4. Weather Dashboard
A single-screen weather display for Dubai with current conditions, hourly forecast, and daily forecast.
- **Widgets:** Column, Row, Card, Icon, Container with gradient
- **Theming:** Use ColorScheme to match weather conditions (sunny = gold, rainy = blue)
- **Stretch:** Fetch real data from OpenWeatherMap API

### 5. Restaurant Menu Card
A beautifully styled menu item card with food image, name, description, price, spice level, and an "Add to Cart" button.
- **Widgets:** Card, Stack (for price badge), Row, Column, Chip (for tags)
- **Stretch:** Build a full menu page with categories

### 6. Social Media Profile Header
An Instagram/Twitter-style profile header with cover photo, avatar, stats (posts, followers, following), and a bio section.
- **Widgets:** Stack (cover + avatar overlap), Row for stats, Column for bio
- **Theming:** Dark mode with accent colors

### 7. Event Countdown Card
A card showing the next Dubai event (Expo, Shopping Festival, etc.) with a live countdown timer.
- **Widgets:** StatefulWidget, Timer, Card, Text with custom styling
- **Concepts:** Widget lifecycle, dispose(), periodic updates

---

## AI-Enhanced — Use Gemini

### 8. AI Bio Generator
Enter a name and role, Gemini generates a creative professional bio displayed in a styled card.
- **Gemini prompt:** "Write a 3-sentence professional bio for [name], a [role] based in Dubai"
- **UI:** TextField input → Generate button → Animated card reveal

### 9. Dubai Tour Guide Chat
A Gemini-powered chatbot that recommends Dubai attractions, restaurants, and activities.
- **Gemini prompt:** System prompt as Dubai tourism expert
- **UI:** Chat interface with streaming responses
- **Stretch:** Add quick-reply chips ("Best restaurants", "Hidden gems", "Family activities")

### 10. Flutter Code Explainer
Paste Flutter code into a text area, Gemini explains what each widget does and suggests improvements.
- **Gemini prompt:** "Explain this Flutter code widget by widget. Suggest improvements."
- **UI:** Split view — code input on left, explanation on right
- **Great for:** Understanding AI-generated code (meta!)

### 11. AI Color Palette Generator
Describe a mood or theme ("Dubai sunset", "ocean calm"), Gemini suggests hex colors, and the app renders them as a palette with Material 3 preview.
- **Gemini prompt:** "Suggest 5 hex colors for a [theme] palette. Return as JSON array."
- **Stretch:** Apply generated palette as app theme in real-time

---

## Challenge — Push Your Skills

### 12. Animated Profile Card
Take the Dubai Profile Card and add:
- Hero animation when tapping the avatar
- AnimatedContainer for expanding/collapsing sections
- Page transition to a detail view
- **Concepts:** Implicit animations, Hero, Navigator

### 13. Multi-Profile Dashboard
Display multiple profile cards in a responsive grid that adapts to screen size.
- **Widgets:** GridView, LayoutBuilder, MediaQuery
- **Stretch:** Add sorting/filtering by stats

---

## Tips for All Projects
- **Start with StatelessWidget** — only use StatefulWidget when you need mutable state
- **Use `const` constructors** — improve performance by marking immutable widgets
- **Extract widgets** — if a build() method exceeds ~30 lines, break it into smaller widgets
- **Apply theming** — use `Theme.of(context)` instead of hardcoded colors
- **Review AI-generated code** — understand every line before keeping it

---

*Workshop by **Waleed Mazen Alrashed** — [waleedalrashed.com](https://waleedalrashed.com) | [LinkedIn](https://www.linkedin.com/in/waleedalrashed/) | [GitHub](https://github.com/WaleedAlrashed/) | [X](https://x.com/waleedalrashedd)*
