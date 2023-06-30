# todo_app

Todo App Demo Structure

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## State Management
This poject uses the Providers library for state managements.
 - [Provider](https://pub.dev/packages/provider)

Folder Structure is as Follows:
```
.
├── assets (Font files, logos, audio, video, etc!)
└── lib
    ├── services (handle the business logic and data fetching)
    ├── routes (route configuration, navigation helpers, or even nested sub-folders for different sections of the app)
    ├── constants (For any constant values, such as API endpoints, route names, or configuration settings, you can store them in the constants folder)
    ├── utils (utility functions or helper classes that are used throughout your app. These utilities can be independent of your state management implementation and provide general-purpose functionalities)
    ├── models (store your data model classes. These classes define the structure of your data entities, such as users, products, or any other objects you may need.)
    ├── providers (organize your state management logic here using Provider)
    └── ui
        ├── screens (place your app screens here, eg: HomeScreen, LoginScreen)
        ├── widgets (stores reusable UI components. These components can be used across multiple screens and help in maintaining consistency throughout the app.)
        └── styles (used for storing your app's styles, such as colors, and themes configs)

```

