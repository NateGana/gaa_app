# G.A.A — ITP107 Final Laboratory 1

Three-screen Flutter app — **Login → Sign-Up → Home** — with named routes,
route arguments, and a consistent design across all three screens.

## What's in this project

```
gaa_app/
  lib/
    main.dart                  # MaterialApp + named routes
    routes/app_routes.dart     # '/login', '/signup', '/home' constants
    screens/
      login_screen.dart
      signup_screen.dart
      home_screen.dart
    widgets/
      brand_logo.dart          # "G.A.A" mark (Login, Home)
      custom_text_field.dart   # labeled input w/ icon, shared by both forms
      primary_button.dart      # full-width primary button
    theme/app_theme.dart       # colors, input/button theme shared by all screens
  android/                     # full Android project (Gradle, manifest, launcher icons)
  web/                         # full Web project (index.html, manifest, icons)
  pubspec.yaml
  analysis_options.yaml
```

This is a real Flutter project folder — open the `gaa_app` folder itself
(the one containing `pubspec.yaml`) in Android Studio or VS Code, the same
way you'd open any existing Flutter project.

## Two things to know before you run it

I don't have Flutter or Android Studio available in the environment I
built this in, so I could not run `flutter pub get` / `flutter run` /
`flutter analyze` myself. I hand-wrote and carefully checked every file
(all Dart brackets balanced, all XML/JSON validated), but that is not the
same as compiling it. Two specific things to expect the **first** time you
open it:

1. **Gradle wrapper jar** — `android/gradle/wrapper/gradle-wrapper.properties`
   (which tells Gradle "use version 8.3") is included, but not the
   compiled `gradle-wrapper.jar` binary itself — I have no internet access
   in my environment to fetch the real one, and fabricating a binary jar
   by hand isn't safe to do. **This is not a manual step for you** —
   Android Studio generates it automatically the first time it opens/syncs
   the project (its normal "Gradle Sync" on first open). If you ever run
   `flutter run` from a raw terminal *before* opening the project in
   Android Studio at least once and it complains about the wrapper, just
   open the project in Android Studio first and let it sync.
2. **No `ios/` folder** — Xcode's project file format is a fragile,
   hand-editable-but-easy-to-break format that I have no way to verify
   without Xcode itself (Mac-only, not available to me). Since this course
   is Android/Android-Studio-focused and nothing in the lab asks for iOS, I
   left it out rather than hand it to you possibly broken. If your group
   ever needs it: run `flutter create --platforms=ios .` inside this
   folder — safe to do, since `ios/` doesn't exist yet, so it can only add
   files, never touch `lib/` or `android/`.

**Realistic path to testing this:** Android emulator/device (primary) or
`flutter run -d chrome` (web build is fully self-contained, no missing
pieces — good as a quick sanity check while Android syncs).

## How to run it

1. Open the `gaa_app` folder in Android Studio (or VS Code with the
   Flutter extension).
2. Let it finish "Gradle Sync" / fetching packages (first time only —
   needs internet).
3. Run `flutter pub get` if your editor doesn't do it automatically.
4. Pick a device/emulator (or Chrome) and hit Run, or run `flutter run`
   from a terminal inside `gaa_app/`.

## Navigation (2+ Navigator methods, as required)

| From → To                          | Method                          |
|-------------------------------------|----------------------------------|
| Login → Sign-Up                     | `Navigator.pushNamed`           |
| Sign-Up → Login (both back links)   | `Navigator.pop`                 |
| Login → Home                        | `Navigator.pushReplacementNamed` |
| Sign-Up → Home (passes full name)   | `Navigator.pushReplacementNamed(..., arguments: fullName)` |
| Home → Login (Logout)               | `Navigator.pushReplacementNamed` |

`pushReplacementNamed` is used everywhere a screen should NOT be reachable
via the back button afterward (can't get back to Home after Logout, or
back to Login after signing in).

## How the name gets to Home

`SignUpScreen` reads the Full Name field and passes it as the `arguments`
of `Navigator.pushReplacementNamed`. `HomeScreen` reads it back with
`ModalRoute.of(context)?.settings.arguments as String?` and shows
`Welcome, <name>!`. On the direct Login → Home path there's no name to
pass, so it falls back to a generic `Welcome!`.

## Test flow

1. Launch → Login screen appears.
2. Tap **Sign Up** → Sign-Up screen (named route).
3. Leave a field empty and tap **Create Account** → inline validation errors.
4. Fill in Full Name `Test User`, Email `test@example.com`, Password
   `123456`, Confirm `123456` → tap **Create Account** → Home shows
   **"Welcome, Test User!"**.
5. Tap **Logout** → back to Login. Device Back from Login should not
   return to Home.
6. From Login, fill both fields and tap **Login** → Home shows the generic
   **"Welcome!"**.

## What to ZIP for submission

The whole `gaa_app` folder as it is (everything above). If you want a
smaller ZIP, it's safe to delete `android/.gradle/`, `build/`, and
`.dart_tool/` first if they exist (these get regenerated automatically) —
but don't remove anything under `lib/`, `android/app/`, or `pubspec.yaml`.

## What was intentionally left out

- No backend/Firebase/API/database — not required by the lab.
- No `google_fonts` package — uses Flutter's built-in default font, so
  there's no network dependency just to render text.
- No automated widget tests (`test/`) — optional per the brief; manual
  testing covers the required flow.
- No Hive/build_runner — the professor's Hive files you attached are
  course-style reference only, not a requirement for this lab, so none of
  that was added.
