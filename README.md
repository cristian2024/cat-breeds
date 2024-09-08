# cat_breeds

A new Flutter project.

## Environment setup

After cloning the repository, execute:

- ```flutter pub get```
  - as of sept 7 - 2024, the project uses the latest stable versions:
    - flutter 3.24.2
    - dart 3.5.2
  - It is recommended to use [FVM](https://fvm.app) if a specific dart/flutter version is required
- ```dart pub run build_runner build```
  - If this one fails, execute ```dart pub run build_runner build --delete-conflicting output```
  - Due to an issue with the code generator of the Retrofit library, after running this command, it is necessary to adjust the 'cat_source.g.dart' file to ensure it reads the global headers configured in the DIO implementation
  