# Shopping List
Coding Sample Project for Chunky Tofu Studios

![Flutter](https://img.shields.io/badge/Flutter-3.35.0-blue?style=plastic&logo=flutter) ![Android Studio](https://img.shields.io/badge/Android_SDK-33.0.0-green?style=plastic&logo=Android)


---

## Table of Contents
- [Video](#video)
- [Getting Started](#getting-started)
- [Architecture](#architecture)
- [State Management](#state-management)
- [Trade-Offs and Decisions](#trade-offs-and-decisions)
- [Estimated Time Spent](#estimated-time-spent)
- [Screenshots](#screenshots)

---

## Demo Video
[View Demo Video](https://github.com/user-attachments/assets/09aadd44-588f-40ac-9a6d-fe007f899ea6)

---

## Getting Started
This project uses **Flutter 3.35.0**.  

<details>
  <summary>(Optional) FVM Setup</summary>

```bash
fvm install 3.35.0
fvm use 3.35.0
fvm global 3.35.0
```

</details>

```bash
# Project Setup
flutter pub get

# Run build_runner to generate code generated files
dart run build_runner build --delete-conflicting-outputs
```

After running the commands, you can launch the project in VS Code with the Mobile configuration already set up.

**Build APK**
To build a release APK, run:

```bash
flutter build apk --release --no-tree-shake-icons --target lib/main.dart -v
```

This will generate a release-ready APK in the `build/app/outputs/flutter-apk/` directory.

-------

### Architecture
The app follows **clean architecture** with a **feature-first folder structure**, ensuring a clear separation of concerns.


- **Feature-First Structure:** Each feature contains its own UI, domain, and data components, keeping related code together.  
- **Clean Architecture Principles:** Business logic is decoupled from the UI, so the core functionality remains independent of presentation changes.  
- **Code Generation:** Reduces boilerplate for models, JSON serialization, and other repetitive tasks.  
- **Dependency Injection:** Promotes modularity, testability, and easier management of dependencies.

This setup ensures the app is **robust, maintainable, and ready for growth**, following industry best practices.

-------

## State Management
The project uses the **BLoC (Business Logic Component) pattern** along with **Cubits** to manage state efficiently, ensuring a clear separation between UI and business logic.

It comprises the following:
- `HomeShoppingItemBloc`
    - Handles retrieval and management of shopping items, following clean architecture principles. It loads data from JSON and transforms it for use in the UI.
- `HomeShoppingCategoryCubit`
    - Manages the state of shopping categories, allowing dynamic filtering and selection of categories.
- `HomeShoppingCartCubit` 
    - Maintains the shopping cart state, including item additions, removals, quantity updates, and total price calculation.

The decision to use **BLoC and Cubits** was driven by several key considerations:

1. **Separation of Concerns**: By decoupling UI from business logic, components remain modular and easier to maintain.
2. **Predictable State Changes**: BLoC ensures that state transitions are explicit and controlled, reducing unexpected behaviors.
3. **Testability**: Each BLoC and Cubit can be tested independently from the UI, improving code quality and reliability.
4. **Scalability**: This architecture supports feature expansion without introducing tightly coupled code.
5. **Consistency**: Using a standardized state management approach ensures consistency across the app, making onboarding new developers easier.

This approach provides a maintainable and robust foundation for the shopping list app, balancing performance, clarity, and scalability.

-------

## Trade-Offs and Decisions
Key design and user experience decisions were made to balance usability, clarity, and instruction compliance:

- **Price Placement:** Although the instructions specified the price should be pinned at the top, it was intentionally placed at the bottom for better readability and visual clarity.
- **Search Functionality:** Implemented a search feature to allow users to quickly find specific items, improving navigation and efficiency within the app.  
- **Shopping List Summary:** Added a summary section to give users a quick overview of their selected items, quantities, and total cost.  
- **“Start Over” Option:** Included a feature to reset the shopping list, providing users with an easy way to clear selections and begin again, enhancing usability.

These trade-offs reflect thoughtful consideration of user experience while adhering as closely as possible to the project requirements.

------

## Estimated Time Spent
The project timeline is summarized as follows:

| Phase       | Duration       | Notes                                   |
|------------|---------------|----------------------------------------|
| 🎨 Design     | < 1 day       | Wireframes and UI/UX in Figma          |
| ⚙️ Development| < 1 day       | Implementation using Flutter with BLoC  |

------

## Screenshots



