
# news_app
AI-Powered News App
An advanced, feature-rich news application built with Flutter and Riverpod. This app provides a seamless user experience with AI-powered article summaries, personalized feeds, and robust backend services powered by Firebase.

Overview
This is not just another news reader. It leverages the power of AI to deliver concise, easy-to-digest summaries of articles, extracts clean article content for a better reading experience, and offers a modern, intuitive interface. The project is built following Clean Architecture principles, ensuring the codebase is scalable, maintainable, and testable.

✨ Key Features
AI-Generated Summaries: Uses the Google Gemini API to provide quick summaries of long articles.
Clean Content Extraction: Leverages the Diffbot API to strip away ads and clutter, presenting only the core article content.
Dynamic News Feed: Fetches top headlines across multiple categories (General, Business, Technology, Sports) from the NewsAPI.
Full User Authentication: Secure sign-up and login functionality using Firebase Authentication.
Saved Articles: Users can save their favorite articles, which are synced across devices using Cloud Firestore.
Powerful Search: Instantly search for articles with a debounced search implementation.
Push Notifications: Subscribe to topics of interest and receive notifications via Firebase Cloud Messaging.
Advanced State Management: Built with Riverpod for efficient and predictable state management.
Modern UI/UX: A sleek, dark-themed interface with custom glassmorphism effects and smooth animations.
Robust Navigation: Utilizes GoRouter for a declarative, URL-based routing system that handles authentication redirects seamlessly.
WebView Integration: Read the full original story in the integrated web browser.

🏗️ Architecture
The project follows the principles of Clean Architecture to separate concerns and create a highly modular structure.

domain: Contains the core business logic, entities (Article), and repository interfaces (AuthRepository). It is the innermost layer and has no dependencies on other layers.
data: Implements the repositories defined in the domain layer. It handles data fetching from remote APIs (NewsAPI, Diffbot, Gemini) and local sources (SharedPreferences for caching).
features: Contains the UI and presentation logic for each feature of the app (e.g., news_feed, auth, article_detail). This layer uses Riverpod providers to interact with the data layer and manage the state of the UI.
core: Holds shared utilities, theme definitions (AppTheme), and navigation setup (GoRouter).

🛠️ Technologies & Services Used
Framework: Flutter
State Management: flutter_riverpod
Navigation: go_router
Backend & Services:
Firebase: Authentication, Cloud Firestore, Cloud Messaging
NewsAPI: For fetching news articles.
Diffbot API: For clean article content extraction.
Google Gemini API: For AI-powered summarization.
Networking: dio & http
UI & Widgets:
cached_network_image: For efficient image caching and display.
shimmer: To create beautiful loading skeletons.
webview_flutter: To display web content.
share_plus: For invoking the native share dialog.
Local Storage: shared_preferences for caching summaries.
Utilities: equatable for value equality.
![photo-collage png](https://github.com/user-attachments/assets/49e2be70-f585-40c4-a030-f645bee961a2)

