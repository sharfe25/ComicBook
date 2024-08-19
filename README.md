
# Comic Book App V3

## Description

Comic Book App is a Flutter-based mobile application that allows users to explore and view a list of comics available through the Comic Vine API. The app is designed with a focus on clean architecture, advanced state management using Flutter BLoC, and seamless user experience through pagination.

## Features

- **Comic List**: Browse and view a list of the latest comics fetched from the Comic Vine API.
- **Comic Details**: Access detailed information about individual comics.
- **Pagination**: Efficiently load comics in batches to enhance performance and user experience.
- **State Management**: Robust state management implemented with the BLoC pattern.
- **Navigation**: Smooth navigation and route management using `go_router`.

## Requirements

- Flutter 3.0.0 or higher
- Dart 2.17.0 or higher

## Project Setup

1. **Clone the repository**:

   ```bash
    https://github.com/sharfe25/ComicBook.git
   cd comic_book_app
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the app**:

   ```bash
   flutter run
   ```

## Project Structure

The project follows a clean architecture, separating business logic, user interface, and data layers:

```
lib/
├── application/       # Business logic (BLoC, Events, States)
├── domain/            # Entities, Repositories, and Use Cases
├── presentation/      # UI Widgets, Screens, and Layouts
├── services/          # API Calls and Data Services
└── main.dart          # Application entry point
```

## BLoC Pattern

This project utilizes the BLoC (Business Logic Component) pattern to manage the state of the application. The `ComicBloc` is responsible for handling events like `FetchComics` and `FetchComicDetails`, managing the corresponding states, and interacting with the `ComicRepository` to fetch data from the Comic Vine API.

## API Integration

The app integrates with the Comic Vine API to fetch comic data. The `ComicService` handles API requests, and the `ComicRepository` acts as a bridge between the service layer and the BLoC layer.

## Pagination

Pagination is implemented to load comics progressively as the user scrolls, improving both performance and the user experience. The `ComicBloc` handles pagination logic by maintaining the current state and appending new data as it becomes available.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or contributions, please contact [shadi2523@gmail.com](mailto:shadi2523@gmail.com).
