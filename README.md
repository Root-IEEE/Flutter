# E-Learning App Readme

## Overview

Welcome to the E-Learning App project! This application is designed to provide a comprehensive learning experience for secondary students. It encompasses a mobile app built with Flutter and a website to facilitate learning through lessons, quizzes, exams, and interactive communication between teachers, teacher assistants, and students.

## Project Structure

This project follows the MVVM (Model-View-ViewModel) architectural pattern for organizing its codebase. Below, you will find an overview of the project structure:

### `lib` Directory

- **Layout**: This directory contains the UI layout code, including the main app cubit and app states, as well as layout screens.

- **Model**: Here, you'll find the data models used throughout the application.

- **Modules**: The modules directory houses the business logic and state management code, organized by functionality. Each module includes a screen with its respective state management.

### Shared Documentation

- **Components**: This section includes shared components that are used across the app, such as constants and custom widgets.

- **Network**: The network documentation provides details on how the app communicates with both local and remote data sources, including any API endpoints or database connections.

- **Styles**: This section contains information about the app's styling, including fonts, colors, and other design-related details.

- **Main.dart**: The main entry point of the Flutter application, where the app is initialized and runs.

### Assets

Images and icons used in the application are stored in the main project directory, separate from the `lib` directory.

## Dependencies

This project utilizes various packages and dependencies to enhance its functionality. Here is a list of the key dependencies used:

- `cupertino_icons`: Provides Cupertino-style icons for iOS and Flutter.

- `shared_preferences`: Enables data persistence for user preferences and settings.

- `flutter_bloc` and `bloc`: Used for state management within the application.

- `google_fonts`: Allows for the integration of custom fonts from Google Fonts.

- `flutter_svg`: Provides SVG rendering capabilities for Flutter.

- `flutter_otp_text_field`: Used for OTP (One-Time Password) input fields.

- `smooth_page_indicator`: Enables smooth page indicators for the app's UI.

- `intl`: Provides internationalization and localization support.

- `dio`: A powerful HTTP client for making network requests.

- `conditional_builder_null_safety`: Offers conditional widget rendering based on certain conditions.

- `video_player` and `vimeo_video_player_custom`: Used for video playback, including Vimeo integration.

- `fluttertoast`: Provides customizable toast messages for user notifications.

- `get`: A navigation and animation library for Flutter.

## Getting Started

To start using and developing this E-Learning App, follow these steps:

1. Clone this repository to your local machine.

2. Ensure that you have Flutter and Dart installed on your development environment.

3. Install the project's dependencies by running `flutter pub get`.

4. Run the application using your preferred development tool or command-line interface.

## Contributing

We welcome contributions from the community to enhance and improve the E-Learning App. Feel free to submit issues, suggest enhancements, or make pull requests.

## License

This project is open-source and released under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as needed.

Thank you for contributing to the world of education through this E-Learning App project!

