# Personal Portfolio — Flutter App (ITP107)

## How to run
1. Make sure the Flutter SDK is installed (`flutter --version` to check).
2. Open a terminal in this project folder (the one containing `pubspec.yaml`).
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the app on an emulator, simulator, or connected device:
   ```
   flutter run
   ```
5. Open the **Debug Console** in your editor (VS Code / Android Studio) to see
   the printed output when you tap, double-tap, and long-press the
   **CLICK ME** button.

## ⚠️ One thing to double-check
The color `#a950ic` you gave me isn't valid hex — `i` isn't a hex digit. I
assumed it was a typo for **`#A9501C`** (a rust/terracotta tone that fits well
between the navy and the tan/cream), and used that throughout the app. If you
meant a different value, just update the `accent` color in `AppColors` at the
top of `lib/main.dart`.

## What's new in this update
- **Profile photo**: `_HeroSection` now loads `assets/images/profile.jpg`
  instead of a network image. I generated a plain placeholder graphic so the
  app runs immediately — **replace `assets/images/profile.jpg` with your own
  photo** (same filename, any square-ish image works) before submitting.
- **Glowing border**: both the profile photo and the "VIEW MY WORK" button
  are wrapped in a `_GlowPulse` widget — a soft, slowly breathing glow ring
  in the rust accent color.
- **Projects updated**: "Campus Event Tracker" → **Budget Tracking App**,
  and "Recipe Finder" → **Barangay Document Request Tracker**.
- **Footer popups instead of links**: tapping Facebook or Instagram opens an
  in-app popup with your photo and handle; tapping Email or Phone opens a
  popup with that value and a **Copy** button (via clipboard). Nothing tries
  to open another app or website, so `url_launcher` was removed entirely.
- **Distinct gesture effects** on the "CLICK ME" button itself:
  - **Single Tap** → quick shrink-and-release "pulse," button briefly turns tan
  - **Double Tap** → the button does a full 360° spin and flashes cream
  - **Long Press** → the button grows and glows for as long as you hold it
- **New color palette**: `#183451` (navy), `#A9501C` (rust — see note above),
  `#D4AF83` (tan), `#F3ECDE` (cream). A subtle tan-tinted cream is derived
  from the two neutrals to keep alternating sections readable, without
  introducing any new named color.

## Before submitting
- Replace `assets/images/profile.jpg` with your real photo.
- In `_FooterSection`, update the Instagram/Facebook handle and the
  email/phone values shown in the popups if they've changed.
- Confirm the rust accent color matches what you intended (see the note above).

## Widgets used (7+ required)
`Text`, `Image`, `ListView` (vertical for Skills, horizontal for Projects),
`Container`, `Card`, `ElevatedButton`, `GestureDetector`, plus `Icon`, `Row`,
`Column`, `Stack`, `InkWell`, `Dialog`, and `SingleChildScrollView`.

## Gesture behavior (as required)
Wrapped in a single `GestureDetector` around the "CLICK ME" button:
- **Single Tap** → prints the exam date: `September 3, 2026`
- **Double Tap** → prints the professor's name: `Albert Q. Alforja`
- **Long Press** → prints the student's full name: `Mikaela Denisse J. Del Rosario`

Each result prints to the Debug Console via `debugPrint()` and is mirrored
on-screen, alongside its own distinct visual effect described above.
