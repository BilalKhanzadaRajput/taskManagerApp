# Task Manager App

A Flutter application for managing tasks, built as a technical assessment. The app demonstrates Clean Architecture principles, BLoC state management, and modern Flutter development practices.

## Features

- **User Authentication**: Secure login using DummyJSON Auth API with session persistence
- **Task Management**: Full CRUD operations for tasks (Create, Read, Update, Delete)
- **Pagination**: Efficient loading of tasks with pagination support
- **Offline Support**: Local caching of tasks for offline access
- **Dark Mode**: Support for light and dark themes with persistent theme preference
- **Responsive Design**: Adaptive UI using flutter_screenutil
- **Search Functionality**: Real-time task search
- **Error Handling**: User-friendly error messages with proper exception handling
- **Success Notifications**: Visual feedback for successful operations (login, logout, task operations)

## Project Setup and Run Instructions

### Prerequisites

- Flutter SDK (3.10.7 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio (recommended IDE)

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/task_manager_app.git
   cd task_manager_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code files**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
   
   This generates:
   - JSON serialization code for models (`.g.dart` files)
   - Freezed classes for BLoC events/states (`.freezed.dart` files)
   - Retrofit API client code

4. **Run the app**
   ```bash
   flutter run
   ```

### Test Credentials

For testing the login functionality, you can use any valid credentials from DummyJSON. Example:
- Username: `kminchelle`
- Password: `0lelplR`

## Architectural Decisions

### Clean Architecture

The project follows **Clean Architecture** principles with strict separation into three layers:

```
lib/
├── data/                    # Data Layer
│   ├── datasources/        # Data sources (remote & local)
│   ├── mappers/           # Data ↔ Domain conversion
│   ├── models/            # Data models (JSON serializable)
│   ├── network/           # Network configuration
│   ├── repositories/      # Repository implementations
│   └── utils/             # Data layer utilities
│
├── domain/                  # Domain Layer (Business Logic)
│   ├── entities/          # Pure Dart business entities
│   ├── exceptions/        # Domain-level exceptions
│   ├── repositories/      # Repository interfaces (contracts)
│   └── usecases/          # Use cases (business logic)
│
└── presentation/            # Presentation Layer (UI)
    ├── bloc/              # State Management (BLoC/Cubit)
    ├── constants/         # UI constants (colors, dimensions, routes)
    ├── di/                # Dependency injection
    ├── factories/         # UseCase factory
    ├── router/            # Navigation and routing
    ├── screens/           # Screen widgets
    ├── utils/             # Presentation utilities
    └── widgets/           # Reusable UI components
```

### Key Architectural Principles

1. **Dependency Rule**: 
   - Domain layer has **NO dependencies** on other layers
   - Data layer depends on Domain (implements interfaces)
   - Presentation layer depends on Domain and uses UseCases

2. **Separation of Concerns**:
   - Each layer has a single, well-defined responsibility
   - Business logic separated from UI
   - Data access separated from business logic

3. **Dependency Inversion**:
   - High-level modules (Domain) don't depend on low-level modules (Data)
   - Both depend on abstractions (interfaces)
   - Data layer implements domain repository interfaces

### Layer Responsibilities

#### Domain Layer
- **Entities**: Pure Dart classes representing business concepts (`TaskEntity`, `UserEntity`)
- **Repositories**: Interfaces defining data access contracts
- **Use Cases**: Encapsulate business logic operations
- **Exceptions**: Domain-level exceptions representing business rules

#### Data Layer
- **Models**: JSON-serializable data models for API communication
- **Data Sources**: Remote (API) and Local (Storage) data sources
- **Mappers**: Convert between Data models and Domain entities
- **Repository Implementations**: Implement domain repository interfaces
- **Network**: API client configuration with interceptors

#### Presentation Layer
- **BLoC/Cubit**: State management for UI
- **Screens**: Full-page widgets
- **Widgets**: Reusable UI components
- **Router**: Navigation configuration with authentication guards
- **Constants & Utils**: UI-related constants and utilities

## State Management Approach

### BLoC Pattern

The app uses **BLoC (Business Logic Component)** pattern with `flutter_bloc` and `freezed` for type-safe state management.

#### BLoC Structure

**AuthBloc** - Manages authentication state:
- **Events**: 
  - `onLogin` - User login attempt
  - `onLogout` - User logout
  - `onCheckAuthStatus` - Check if user is authenticated
- **States**: 
  - `isLoading` - Loading indicator
  - `isAuthenticated` - Authentication status
  - `user` - Current user entity
  - `errorMessage` - Error message if any

**TaskBloc** - Manages task operations:
- **Events**:
  - `onLoadTasks` - Load paginated tasks
  - `onAddTask` - Add new task
  - `onUpdateTask` - Update existing task
  - `onDeleteTask` - Delete task
  - `onToggleTask` - Toggle task completion status
  - `onSearchTasks` - Search/filter tasks
- **States**:
  - `isLoading` - Loading indicator
  - `tasks` - List of task entities
  - `total`, `skip`, `limit` - Pagination metadata
  - `hasMore` - Whether more tasks are available
  - `searchQuery` - Current search query
  - `errorMessage` - Error message if any

**ThemeCubit** - Manages theme state:
- **Methods**: `toggleTheme()`, `setThemeMode()`
- **States**: `themeMode` (light, dark, system)

### State Flow

```
User Interaction (UI)
    ↓
Event (BLoC)
    ↓
UseCase (Domain)
    ↓
Repository (Domain Interface)
    ↓
Repository Implementation (Data)
    ↓
DataSource (Remote/Local)
    ↓
State Update (BLoC)
    ↓
UI Rebuild
```

### Benefits of BLoC Pattern

1. **Predictable State Updates**: All state changes go through BLoC
2. **Testability**: Easy to test business logic in isolation
3. **Separation of Concerns**: Business logic separated from UI
4. **Reactive Programming**: UI automatically updates when state changes
5. **Type Safety**: Freezed ensures type-safe states and events

### Use Cases

The app uses **Use Cases** to encapsulate business logic:

- `GetTasksUseCase` - Fetch paginated tasks
- `AddTaskUseCase` - Create new task
- `UpdateTaskUseCase` - Update existing task
- `DeleteTaskUseCase` - Remove task
- `LoginUseCase` - Authenticate user
- `LogoutUseCase` - Sign out user
- `CheckAuthStatusUseCase` - Verify authentication status

**Benefits**:
- Single responsibility per use case
- Easy to test
- Reusable business logic
- Clear separation between domain and presentation

## Challenges Faced

### 1. Clean Architecture Implementation

**Challenge**: Restructuring the project to follow strict Clean Architecture with only 3 layers (Data, Domain, Presentation) while maintaining existing functionality.

**Solution**: 
- Moved BLoC classes from separate `businessLogic/` folder to `presentation/bloc/`
- Created Use Cases in domain layer to encapsulate business logic
- Moved utilities to appropriate layers (data utils in data layer, UI utils in presentation layer)
- Ensured dependency rule: Domain has no dependencies, Data depends on Domain, Presentation depends on Domain

### 2. Dependency Injection Setup

**Challenge**: Setting up dependency injection with `injectable` and `get_it` while maintaining manual factory pattern for immediate functionality.

**Solution**: 
- Created `UseCaseFactory` for manual instantiation (temporary solution)
- Set up `injectable` annotations for automatic DI
- Prepared `injection.dart` for build_runner code generation
- Can migrate to full DI after running build_runner

### 3. Type Safety with Freezed

**Challenge**: Ensuring type safety when migrating from `TaskModel` to `TaskEntity` across all layers.

**Solution**:
- Updated all BLoC states to use domain entities
- Created mappers to convert between data models and domain entities
- Used explicit type annotations in lambda functions
- Regenerated freezed files with build_runner

### 4. Router Authentication Flow

**Challenge**: Implementing proper authentication guards with GoRouter while handling logout navigation correctly.

**Solution**:
- Provided AuthBloc at app level
- Used GoRouter's `redirect` callback for route protection
- Implemented BlocListener to handle navigation after logout completes
- Ensured user state is cleared before navigation

### 5. Pagination with State Management

**Challenge**: Implementing infinite scroll pagination while maintaining proper state and avoiding duplicate loads.

**Solution**:
- Tracked `skip`, `limit`, `hasMore` in TaskState
- Used ScrollController to detect when user reaches bottom
- Prevented multiple simultaneous loads with loading state check
- Merged new tasks with existing list for seamless pagination

### 6. Offline Support

**Challenge**: Implementing local caching that works seamlessly with network calls and provides fallback when network fails.

**Solution**:
- Used SharedPreferences for local task caching
- Implemented try-catch in repository to fallback to cached data
- Cache tasks after successful network fetch
- Return cached data when network request fails

### 7. Exception Handling

**Challenge**: Providing user-friendly error messages from various exception types (network, validation, etc.).

**Solution**:
- Created `ErrorMessageHelper` to extract user-friendly messages
- Handled specific DioException types and status codes
- Provided default fallback messages for unknown errors
- Displayed errors via SnackBar with appropriate colors

### 8. Theme Management

**Challenge**: Implementing persistent theme preference with system theme support.

**Solution**:
- Created ThemeCubit to manage theme state
- Used SharedPreferences to persist theme preference
- Supported ThemeMode.system, ThemeMode.light, and ThemeMode.dark
- Integrated theme toggle in AppBar

## Additional Features and Improvements

### Implemented Features

1. **Clean Architecture**: Strict 3-layer architecture (Data, Domain, Presentation)
   - Use Cases for business logic encapsulation
   - Repository pattern with interfaces
   - Mappers for data transformation

2. **Secure Storage**: Authentication tokens stored securely using `flutter_secure_storage`
   - Encrypted storage on Android and iOS
   - Automatic token injection in API requests

3. **Local Caching**: Tasks cached locally using `SharedPreferences` for offline access
   - Automatic fallback to cached data when network fails
   - Cache invalidation on successful network fetch

4. **Comprehensive Error Handling**: 
   - User-friendly error messages
   - Specific handling for network errors, validation errors, etc.
   - Visual error indicators (red SnackBar)

5. **Success Notifications**: 
   - Green SnackBar for successful operations
   - Feedback for login, logout, task add/update/delete

6. **Loading States**: Proper loading indicators for all async operations
   - Prevents multiple simultaneous requests
   - Better UX during network operations

7. **Input Validation**: Form validation for user inputs
   - Required field validation
   - User ID validation

8. **Responsive Design**: Adaptive UI using `flutter_screenutil`
   - Consistent spacing and sizing across devices
   - Responsive font sizes

9. **Theme Support**: 
   - Light and dark theme support
   - System theme detection
   - Persistent theme preference
   - Theme toggle in AppBar

10. **Search Functionality**: Real-time task search/filter
    - Search by task name
    - Instant filtering as user types

11. **Centralized Theming**: 
    - `AppTextStyles` for consistent text styling
    - `ThemeExtension` for easy theme color access
    - `ColorsResource` and `DimensionsResource` for constants

12. **Edit Task Feature**: 
    - Edit icon in task list
    - Pre-filled form for editing
    - Update task with validation

13. **View Task Feature**: 
    - Detailed task view screen
    - Shows task completion status
    - Edit and delete actions

### Code Quality Improvements

1. **Removed Print Statements**: Cleaned up all debug print statements
2. **Centralized Error Handling**: Single source of truth for error messages
3. **Type Safety**: Consistent use of domain entities across layers
4. **Import Organization**: Clean import structure following Flutter conventions
5. **Code Documentation**: Comments and documentation for complex logic

### Future Improvements

1. **Unit Test Coverage**: Expand test coverage for repositories and use cases
2. **Integration Tests**: Add widget and integration tests
3. **Dependency Injection**: Complete DI setup with build_runner
4. **Hive Integration**: Replace SharedPreferences with Hive for better performance
5. **Task Categories**: Add categories/tags for better organization
6. **Due Dates**: Add due dates and reminders
7. **Task Sharing**: Share tasks with other users
8. **Biometric Authentication**: Add fingerprint/face ID support
9. **Offline Queue**: Queue operations when offline and sync when online
10. **Task Sorting**: Sort tasks by date, priority, completion status

## API Integration

The app integrates with [DummyJSON APIs](https://dummyjson.com):

### Authentication
- **Login**: `POST /auth/login`
  - Request: `{ username, password }`
  - Response: User data with access token

### Task Operations
- **Get Tasks**: `GET /todos?limit=10&skip=0`
  - Returns paginated list of tasks
- **Add Task**: `POST /todos/add`
  - Request: `{ todo, completed, userId }`
  - Response: Created task
- **Update Task**: `PUT /todos/{id}`
  - Request: `{ todo?, completed?, userId? }`
  - Response: Updated task
- **Delete Task**: `DELETE /todos/{id}`
  - Deletes task by ID

### Error Handling
- Handles 404 errors gracefully (for locally created tasks)
- Network error fallback to cached data
- User-friendly error messages for all error types

## Dependencies

### Core Dependencies
- `flutter_bloc: ^9.1.1` - State management
- `equatable: ^2.0.5` - Value equality
- `freezed_annotation: ^3.1.0` - Immutable classes
- `go_router: ^13.0.0` - Navigation and routing
- `dio: ^5.4.0` - HTTP client
- `retrofit: ^4.0.3` - Type-safe HTTP client
- `json_annotation: ^4.8.1` - JSON serialization
- `flutter_secure_storage: ^9.0.0` - Secure storage
- `shared_preferences: ^2.2.2` - Local storage
- `flutter_screenutil: ^5.9.0` - Responsive design
- `google_fonts: ^6.1.0` - Custom fonts
- `injectable: ^2.4.0` - Dependency injection
- `get_it: ^7.6.4` - Service locator

### Dev Dependencies
- `build_runner: ^2.4.7` - Code generation
- `freezed: ^3.2.3` - Code generation for freezed
- `retrofit_generator: ^10.2.1` - Retrofit code generation
- `injectable_generator: ^2.6.0` - Injectable code generation
- `json_serializable: ^6.7.1` - JSON serialization code generation
- `mockito: ^5.4.4` - Mocking for tests
- `bloc_test: ^10.0.0` - BLoC testing utilities
- `flutter_lints: ^6.0.0` - Linting rules

## Code Generation

After cloning, run code generation:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This generates:
- JSON serialization code for models (`.g.dart` files)
- Freezed classes for BLoC events/states (`.freezed.dart` files)
- Retrofit API client code (`.g.dart` files)
- Injectable dependency injection code (`injection.config.dart`)

**Note**: Generated files are tracked in git for convenience, but should be regenerated after pulling changes.

## Project Structure

### Domain Layer (`lib/domain/`)
- **entities/**: Pure Dart business entities (`TaskEntity`, `UserEntity`)
- **exceptions/**: Domain-level exceptions (`LocalUpdateException`)
- **repositories/**: Repository interfaces (contracts)
- **usecases/**: Business logic use cases

### Data Layer (`lib/data/`)
- **datasources/**: Remote (API) and Local (Storage) data sources
- **mappers/**: Convert between Data models and Domain entities
- **models/**: JSON-serializable data models
- **network/**: API client configuration
- **repositories/**: Repository implementations
- **utils/**: Data layer utilities (storage helpers)

### Presentation Layer (`lib/presentation/`)
- **bloc/**: State management (BLoC/Cubit)
- **constants/**: UI constants (colors, dimensions, routes)
- **di/**: Dependency injection configuration
- **factories/**: UseCase factory for manual instantiation
- **router/**: Navigation configuration
- **screens/**: Screen widgets
- **utils/**: Presentation utilities (theme, text styles, error messages)
- **widgets/**: Reusable UI components


## License

This project is created for technical assessment purposes.

## Author

Built as a Flutter technical assessment demonstrating Clean Architecture, BLoC pattern, and modern Flutter development practices.
