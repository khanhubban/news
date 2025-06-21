![Screenshot_20250621-135648](https://github.com/user-attachments/assets/e3d54565-65aa-49f4-9eb0-7be68b922f7e)
![Screenshot_20250621-135610](https://github.com/user-attachments/assets/3c7b0af5-b1e5-4f2e-a5d1-d8396d705a60)
![Screenshot_20250621-135524](https://github.com/user-attachments/assets/97da20ea-1fb6-40a7-bc34-3c88875e220f)
![Screenshot_20250621-135516](https://github.com/user-attachments/assets/e82ef1c6-1da6-4e02-9e5d-39ae91df34bf)
![Screenshot_20250621-135421](https://github.com/user-attachments/assets/d6fde109-cb7a-4345-a504-ef8ac3f9cf1e)
![Screenshot_20250621-135400](https://github.com/user-attachments/assets/b86e0380-d11f-4570-9a3a-48831d78b5b8)
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

