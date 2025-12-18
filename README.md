# Az Navigation

## Step 1: Setup MaterialApp
Set the `navigatorKey` in your `MaterialApp` so `AzNavigation` can work without `BuildContext`:

```dart
return MaterialApp(
  navigatorKey: AzNavigation.navigatorKey, // Required for AzNavigation
```

## Step 2
Simple navigation helper with animated page transitions.

```dart
AzNavigation.to(const HomePage(), transition: Transition.rightToLeft);
```