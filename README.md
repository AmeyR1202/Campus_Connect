<div align="center">

<img src="assets/images/welcome.svg" alt="Campus Connect" width="120"/>

# Campus Connect

**A full-stack Flutter + Firebase campus platform built with clean architecture.**  
Attendance tracking today — notes, blogs, chat, and event ticketing coming next.

</div>

---

## Overview

Campus Connect is a cross-platform Flutter application designed to centralise the daily digital needs of college students. The current release focuses on **attendance tracking** with a professor-facing and student-facing flow. The app is architected to expand incrementally — notes sharing, blogs, real-time chat, and a deep-linked event ticketing companion app (FestPass) are on the roadmap.

The project is intentionally built with production-grade patterns: clean architecture, BLoC state management, functional error handling via `fpdart`, and strict separation between data, domain, and presentation layers.

---

## Features

### ✅ Available now

#### Authentication

- College email-based sign-in via Firebase Auth
- Role selection at onboarding — Student or Professor
- Persistent session with auto-login on relaunch
- Secure sign-out with local state cleanup
- Onboarding guarded by GoRouter redirect logic

#### Attendance Tracker

- Students can view their subject-wise attendance with percentage breakdown
- Visual indicator for subjects approaching the 75% threshold
- Attendance records stored in Firestore with real-time sync
- Role-based access — professor and student flows separated via Firebase Auth claims

#### Timetable

- Weekly timetable view per student/class
- Subjects, timings, and faculty details stored in Firestore
- Clean day-wise tab navigation
- Timetable data shared across students in the same batch/division

### 🚧 In progress / Roadmap

| Feature                           | Status  | Branch                         |
| --------------------------------- | ------- | ------------------------------ |
| Notes sharing                     | Planned | `feature/notes`                |
| Blogs feed                        | Planned | `feature/blogs`                |
| Real-time chat                    | Planned | `feature/chat`                 |
| FestPass deep link                | Planned | `feature/festpass-integration` |
| Professor dashboard (Flutter Web) | Planned | `feature/web-dashboard`        |

---

## Architecture

Campus Connect follows **Clean Architecture** with a strict three-layer separation:

```
lib/
├── core/                   # Shared utilities, error types, DI setup
│   ├── di/                 # GetIt service locator registrations
│   ├── error/              # Failure types (fpdart Either)
│   └── router/             # GoRouter route definitions
│
├── features/
│   ├── auth/
│   │   ├── data/           # Firebase Auth data source, user model
│   │   ├── domain/         # Auth repository interface, login/logout use cases
│   │   └── presentation/   # AuthBloc, login page, onboarding
│   ├── attendance/
│   │   ├── data/           # Firestore data sources, models (Freezed + JSON)
│   │   ├── domain/         # Entities, repository interfaces, use cases
│   │   └── presentation/   # BLoC, pages, widgets
│   └── timetable/
│       ├── data/           # Firestore timetable source, slot model
│       ├── domain/         # Timetable entity, repository interface, use cases
│       └── presentation/   # TimetableBloc, day-wise tab view, widgets
│
└── main.dart
```

Each feature is fully self-contained. Adding a new feature (e.g. Notes) means creating a new folder under `features/` without touching existing code.

### Key patterns

- **BLoC** for all state management — no `setState` outside of truly local UI state
- **GetIt** for dependency injection — all repositories and use cases are registered at app startup
- **fpdart `Either`** for functional error handling — no uncaught exceptions in the domain layer
- **Freezed** for immutable data classes and union types on BLoC states/events
- **GoRouter** for declarative, type-safe navigation

---

## Tech Stack

| Layer                  | Technology                               |
| ---------------------- | ---------------------------------------- |
| UI                     | Flutter 3.x (Material 3)                 |
| State management       | flutter_bloc ^9.1.1                      |
| Dependency injection   | get_it ^9.2.1                            |
| Navigation             | go_router ^17.1.0                        |
| Functional programming | fpdart ^1.2.0                            |
| Code generation        | freezed, json_serializable, build_runner |
| Auth                   | firebase_auth ^6.2.0                     |
| Database               | cloud_firestore ^6.1.3                   |
| Core                   | firebase_core ^4.5.0                     |
| Font                   | DM Sans (400, 500, 700)                  |

---

## Getting Started

### Prerequisites

- Flutter SDK `^3.12.0`
- Dart SDK `^3.12.0`

### Setup

```bash
# 1. Clone the repository
git clone https://github.com/AmeyR1202/Campus_Connect.git
cd Campus_Connect

# 2. Install dependencies
flutter pub get

# 3. Run code generation (Freezed + JSON serializable)
dart run build_runner build --delete-conflicting-outputs

# 4. Configure Firebase
flutterfire configure

# 5. Run the app
flutter run
```

> **Note:** You will need to add your own `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) from your Firebase project. These files are gitignored and not committed to the repo.

---

## Branching Strategy

This project uses a **feature branch → dev → main** workflow.

```
main          ← production-ready, only accepts PRs from dev
  └── dev     ← integration branch, all features merge here first
        ├── feature/attendance
        ├── feature/notes
        ├── feature/blogs
        ├── feature/chat
        └── feature/festpass-integration
```

### Rules

- `main` is protected — **no direct commits**. All changes enter via PR from `dev`.
- `dev` is the integration branch — feature branches are merged here via PR after review.
- Feature branches are named `feature/<feature-name>` (e.g. `feature/notes-sharing`).
- Bugfix branches use `fix/<description>`.
- Each PR to `dev` must pass the CI check (GitHub Actions Flutter analyze + test).
- Squash merge is preferred when merging feature → dev to keep history clean.

### Example flow

```bash
# Start a new feature
git checkout dev
git pull origin dev
git checkout -b feature/notes-sharing

# ... make changes ...

git push origin feature/notes-sharing
# Open PR: feature/notes-sharing → dev
# After review and CI pass → merge to dev
# When dev is stable → open PR: dev → main
```

---

## CI/CD

GitHub Actions runs on every push and PR:

- `flutter analyze` — static analysis
- Build check for Android

See `.github/workflows/` for the workflow definitions.

---

## Ecosystem

Campus Connect is part of a two-app ecosystem:

- **Campus Connect** (this repo) — attendance, notes, blogs, chat
- **[FestPass](#)** _(coming soon)_ — college event ticketing with QR entry, race-safe seat booking via Firestore transactions, and a Flutter Web organiser dashboard

Both apps share the same Firebase project for seamless single sign-on. Campus Connect will deep-link into FestPass via Firebase Dynamic Links from the Events tab.

---

## Contributing

1. Fork the repository
2. Create a feature branch off `dev`: `git checkout -b feature/your-feature`
3. Commit your changes with clear messages
4. Push and open a PR targeting `dev`
5. Ensure `flutter analyze` passes with zero warnings before requesting review

---

<div align="center">
  <sub>Built with Flutter · Firebase · Clean Architecture</sub>
</div>
