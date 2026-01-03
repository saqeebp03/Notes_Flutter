# 📝 Notes App (Flutter)

A clean, beginner-friendly Notes App built with Flutter, Provider, and Hive for local storage. Perfect for learning, personal use, and as a portfolio project to showcase good practices in mobile development.

---

## 🚀 Features
- Create, edit, and delete notes with title and content
- Persist notes locally (offline-first) using Hive database
- Material Design UI with card-based list, AppBar, and Floating Action Button
- Responsive empty state when no notes exist
- Provider for state management
- Confirmation dialogs and input validation
- Snackbar notifications for actions

---

## ⚙️ Tech Stack
- **Flutter (Latest stable)**
- **Dart**
- **Provider** for state management
- **Hive** for fast local storage
- **Material Design** UI components

---

## 🛠️ Installation & Setup

### Prerequisites
- Flutter SDK ([Install guide](https://docs.flutter.dev/get-started/install))
- Android Studio/VS Code/Any IDE
- Android/iOS emulator or device

### Getting Started
1. **Clone this repository:**
   ```bash
   git clone <your-repo-url>
   cd Notes_Flutter
   ```
2. **Get the packages:**
   ```bash
   flutter pub get
   ```
3. **Create platform folders (for Android/iOS/Web/Windows):**
   ```bash
   flutter create .
   ```
4. **[Only if you modify models] Regenerate Hive adapters:**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

---

## ▶️ Running the App
1. **Open an emulator or connect a device.**
2. **Run the app:**
   ```bash
   flutter run
   ```
   You can also use your IDE’s 'Run' or 'Debug' feature.

---

## 📁 Project Structure
```
lib/
  main.dart
  models/
    note.dart
    note.g.dart
  providers/
    notes_provider.dart
  services/
    notes_service.dart
  screens/
    home_screen.dart
    note_edit_screen.dart
  widgets/
    note_card.dart
    empty_state.dart
```

---

## 👨‍🎓 Suitable for
- Students and beginners looking to learn Flutter
- Interview or portfolio demonstrations
- Extending later for online sync (e.g., Firebase)

---

Enjoy building and customizing your own offline-first Notes App! If you find this helpful, 🌟 star your repo!
