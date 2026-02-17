# Flutter Todo App

My first Flutter project to learn Flutter basics and Supabase integration.

## 📱 Features

- ✅ User authentication (Login/SignUp)
- ✅ Create new tasks
- ✅ View all tasks
- ✅ Update existing tasks
- ✅ Delete tasks
- ✅ Mark tasks as complete/incomplete
- ✅ Pull to refresh
- ✅ Dark theme support

## 🛠️ Tech Stack

- **Flutter** 3.x - UI Framework
- **Supabase** - Backend as a Service
  - Authentication
  - PostgreSQL Database
  - Real-time subscriptions
- **Material Design 3** - UI/UX Design

## 📚 What I Learned

- Flutter widgets and layouts
- StatefulWidget vs StatelessWidget
- State management basics
- Supabase CRUD operations
- User authentication flow
- HTTP requests and async/await
- Git & GitHub workflow
- `.gitignore` and protecting sensitive data

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Supabase account

### Installation

1. Clone the repository:
```bash
git clone https://github.com/ahmadwalid-7/flutter_todo_app.git
```

2. Navigate to project directory:
```bash
cd flutter_todo_app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Create your own Supabase project and configure:
   - Create `lib/config/supa_config.dart`
   - Add your Supabase URL and anon key

5. Run the app:
```bash
flutter run
```

## 📁 Project Structure
```
lib/
├── main.dart           # App entry point
├── screens/            # UI screens
│   ├── login.dart
│   ├── signup.dart
│   ├── home.dart
│   └── addtask.dart
├── services/           # Business logic
│   ├── auth.dart       # Authentication service
│   └── datatask.dart   # CRUD operations
└── config/             # Configuration
    └── supa_config.dart # Supabase keys (not in Git)
```

## 🎓 Learning Journey

This project is part of my Flutter learning journey following Wael Abu Hamza's course on YouTube. It helped me understand:

1. Flutter fundamentals
2. Backend integration with Supabase
3. User authentication
4. CRUD operations
5. Version control with Git/GitHub

## 🔜 Next Steps

- Learn Provider for state management
- Explore APIs and HTTP requests
- Study Bloc pattern
- Build more complex projects

## 📝 Notes

- This is a learning project and may contain beginner-level code
- Sensitive configuration files are excluded via `.gitignore`
- Feel free to use this as a reference for your own learning!

## 📧 Contact

Ahmad Walid - [@ahmadwalid-7](https://github.com/ahmadwalid-7)

---

**Made with ❤️ while learning Flutter**
---
**Note:** This is a learning project
