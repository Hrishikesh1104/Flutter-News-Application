# Pocket News

A minimal, swipe-to-browse news reader built with Flutter. It fetches a random top headline from a random news source using the NewsAPI and displays it in a clean, vertically-paged UI. Tapping "Read More" opens the full article in an in-app WebView.

## Features
- Vertical, page-like browsing of articles (one per page)
- Randomized source and article selection for quick discovery
- Splash screen on startup
- In-app browser using WebView
- Graceful fallbacks for missing images/content

## Screens
- Splash Screen: simple brand splash while the app initializes
- Home: page view of a single article at a time with headline, description, source, publish date, and partial content
- Detail: in-app WebView of the full article URL (forces https when needed)

## Tech Stack
- Flutter (Material 3)
- Packages: `http`, `webview_flutter`, `intl`, `cupertino_icons`, `flutter_launcher_icons`

## Project Structure
- `lib/main.dart`: App entry point and theming; toggles splash -> home
- `lib/controller/fetch_news.dart`: Fetches a random article from NewsAPI
- `lib/model/news_article_model.dart`: Article data model and JSON parsing
- `lib/view/home.dart`: Main UI, vertical `PageView`, loads next article on swipe
- `lib/view/detail_view.dart`: WebView screen for reading the full article
- `lib/view/splash_screen.dart`: Simple launch splash
- `lib/view/widgets/news_container.dart`: Article UI widget

## Setup
1. Prerequisites
   - Flutter SDK installed and configured
   - iOS/Android tooling set up (Xcode, Android Studio/SDK)

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Configure the NewsAPI key
   - The app currently references a hardcoded API key and endpoint in `lib/controller/fetch_news.dart`:
     ```dart
     Response response = await get(Uri.parse(
         'https://newsapi.org/v2/top-headlines?sources=$randomSourceId&apiKey=YOUR_API_KEY'));
     ```
   - Replace `YOUR_API_KEY` with your key from NewsAPI. For production use, prefer securing this via environment config, a secrets manager, or a backend proxy to avoid exposing the key in the client.

4. Assets
   - App expects `assets/` to be available (configured in `pubspec.yaml`). Run `flutter pub get` after adding/changing assets.

## Run
- Debug on a connected device/emulator:
  ```bash
  flutter run
  ```
- Build release APK (Android):
  ```bash
  flutter build apk --release
  ```
- Build iOS (requires macOS/Xcode):
  ```bash
  flutter build ios --release
  ```

## Notes and Limitations
- API Quotas: NewsAPI has usage limits; frequent swiping will generate many requests.
- Image Fallback: If an image URL is missing/invalid, a default breaking news image is shown.

