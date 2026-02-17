# Copilot / AI Agent Instructions for train_app_2

Purpose: give an AI coding agent the immediate, actionable knowledge to be productive in this Flutter + Supabase todo app.

- **Big picture**: This is a small Flutter app (Material 3) that uses Supabase for auth and a single `task` table. App entry is `lib/main.dart` which initializes Supabase (`Supabase.initialize`) and sets `home: LoginTask()`.

- **Major components**:
  - `lib/config/supa_config.dart` — Supabase `url` and `anonKey` (app keeps anon key here).
  - `lib/services/auth.dart` — signup/login/signout via `Supabase.instance.client.auth`.
  - `lib/services/datatask.dart` — CRUD against `task` table using `Supabase.instance.client.from('task')`.
  - `lib/screens/*` — UI screens: `login.dart`, `signup.dart`, `home.dart`, `addtask.dart`.

- **Data model (inferred from code)**: table `task` with fields used: `id`, `title`, `is_done`, `user_id`, `context`, `created_at`. Agent changes to backend queries should preserve these field names.

- **Routing & navigation**: App uses direct `MaterialPageRoute` pushes from screens; there is no central named-routes map. Note: `HomePage` logout calls `Navigator.pushReplacementNamed(context, 'login')` — no `'login'` named route is defined in `main.dart` (uses `home: LoginTask()`), so agents should prefer explicit routes or update `main.dart` before adding named-route logic.

- **State & patterns**: UI is implemented with `StatefulWidget`s and local state only — no global state management (Provider/Bloc/GetX). When editing UI or lifecycle, favor `setState` updates consistent with current patterns.

- **Supabase usage patterns**:
  - Always initialize Supabase before `runApp` (see `lib/main.dart`).
  - Use `Supabase.instance.client` directly in services; follow existing convention (e.g., `Datatask().create(...)`).
  - Auth uses `Supabase.instance.client.auth.currentUser` for user id.

- **Error handling conventions**: Errors are surfaced to users with `ScaffoldMessenger.of(context).showSnackBar(...)`. Preserve this style for UI-visible failures.

- **Files to inspect when making changes** (examples):
  - `lib/services/datatask.dart` — DB queries and ordering (`.order('created_at')`).
  - `lib/screens/home.dart` — loads tasks via `Datatask().read()` and calls `setState()`; edits and deletes call service methods then reload.
  - `lib/screens/addtask.dart` — handles both create and update flows depending on optional `task` parameter.

- **Developer workflows / commands** (common and repo-specific):
  - Fetch deps: `flutter pub get`
  - Run (device): `flutter run` or `flutter run -d windows` / `-d chrome` as appropriate
  - Run tests: `flutter test` (project has `test/widget_test.dart`)
  - Build Android release: `flutter build apk`

- **Important gotchas & suggested checks for PRs**:
  - `supa_config.dart` contains an anon key — do not accidentally commit a different secret or expose service-role keys. If changing keys, update `lib/config/supa_config.dart`.
  - The logout path uses a named route `'login'` that is not declared. If you introduce named routes, update `main.dart` accordingly or change logout to use an explicit route push.
  - The UI relies on synchronous `Supabase.initialize` in `main()`; any refactor must preserve initialization before widgets build.

- **When modifying DB code**: keep the field names `title`, `is_done`, `user_id`, `context`, and sorting by `created_at`. Tests / integration changes should reflect those names.

- **When adding features**:
  - Prefer adding small service methods in `lib/services/` (follow existing simple class-per-concern pattern: `AuthTask`, `Datatask`).
  - Add new screens under `lib/screens/` and wire using `MaterialPageRoute` unless you also add a named-routes map in `main.dart`.

- **Where to run quick debug checks**:
  - Reproducing auth flows: run on an emulator/device and use the SignUp -> Login -> Home flow.
  - Inspect API calls via Supabase dashboard if DB schema changes are needed.

If any of this is unclear or you want this tailored (e.g., add explicit route map, add tests, or remove hard-coded anon key), tell me which part to expand or change.
