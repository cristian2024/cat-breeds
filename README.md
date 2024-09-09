# Cat Breeds

A Flutter project to display information about various cat breeds using Retrofit for API interactions. This project leverages code generation with build_runner and uses `--dart-define-from-file` for sensitive configurations.

## Features

- Fetches data on various cat breeds from a remote API.
- Fetches filtered breeds by words
- Displays breed information with pagination.
- Clean Architecture structure to ensure scalability and maintainability.

## Environment Setup

After cloning the repository, follow these steps:

### Install dependencies

   ```bash
   flutter pub get
   ```

As of Sept 7, 2024, the project uses:

- Flutter 3.24.2
- Dart 3.5.2
  - It is recommended to use FVM if a specific Dart/Flutter version is required.

### Code generation

Run build_runner:

```bash
dart pub run build_runner build
```

If this command fails, try:

```bash
dart pub run build_runner build --delete-conflicting-outputs
```

### Environment variables

The project uses the Dart tool `--dart-define-from-file`, where environment variables are loaded from a JSON file. In the `environment` folder, you will find an `example.env.json` file, which serves as a template.

After configuring the correct environment data, update the `.vscode/launch.json` file (create it if it doesn't exist) to point to the corresponding `.env.json` file in the `environment` folder. The `launch.json` is already set up to use `dev.env.json` by default, but you can adjust it to match your environment-specific file.

## Running the project

In order to execute the code from the terminal, you already need to have configured the [environment](#environment-setup), and more importantly the [environment variables](#environment-variables)

Run

```bash
flutter run --dart-define-from-file=environments/<your .env.json file>
```

Similar for generating APK and IPA

```bash
flutter build apk --dart-define-from-file=environments/<your .env.json file>
```

```bash
flutter build ipa --dart-define-from-file=environments/<your .env.json file>
```

## Project Structure

The project follows the Clean Architecture principle and is divided into the following layers:

- Domain: Contains business logic and entities.
- Data: Handles API requests and data models.
- UI: Presentation layer with widgets and UI components.
