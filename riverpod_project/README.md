# riverpod_project

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A brick to produce boilerplate code for new flutter project using `go_router`, `hooks_riverpod`, `hive_flutter`, `freezed`, `appwrite`.

## Usage 🚀

```
mason make riverpod_project
```

Note:

- for better usage the delete lib folder & pubspec.yaml file
- for generating features use [flutter_riverpod_project]

## Output

```
.
├── l10n.yaml
├── lib
│   ├── app
│   │   ├── app.dart
│   │   ├── core
│   │   │   ├── local_storage
│   │   │   │   └── app_storage.dart
│   │   │   ├── router
│   │   │   │   └── router.dart
│   │   │   └── theme
│   │   │       └── app_theme.dart
│   │   └── features
│   │       └── main
│   │           ├── model
│   │           │   └── main_model.dart
│   │           ├── providers
│   │           │   └── main_providers.dart
│   │           ├── repository
│   │           │   ├── main_repository.dart
│   │           │   ├── main_repository_fake.dart
│   │           │   └── main_repository_impl.dart
│   │           ├── view
│   │           │   └── main_view.dart
│   │           └── widget
│   │               └── main_widget.dart
│   ├── l10n
│   │   ├── arb
│   │   │   └── app_en.arb
│   │   └── l10n.dart
│   └── main.dart
└── pubspec.yaml
```

[riverpod_module]: https://brickhub.dev/bricks/riverpod_module/0.1.0+4
