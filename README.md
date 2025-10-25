# 🪙 Crypto Bazar

A modern Flutter application that provides **real-time cryptocurrency prices**, built using **Clean Architecture** and **BLOC state management** for scalability and maintainability.

---

## 🚀 Features

- 🔹 View **real-time prices** of popular cryptocurrencies  
- 🔹 **Search** for specific coins by name or symbol  
- 🔹 **Clean & modular architecture** (Domain, Data, Presentation layers)  
- 🔹 State management with **BLOC**
- 🔹 Error handling and sealed states  
- 🔹 Scalable with **Dependency Injection** support  

---

## 🧩 Architecture Overview

lib/
 ├── core/                  → Shared resources, constants, utilities
 ├── data/                  → Repositories, data sources (API, local)
 │    ├── datasources/
 │    ├── models/
 │    └── repositories/
 ├── domain/                → Entities, repositories, use cases
 │    ├── entities/
 │    ├── repositories/
 │    └── usecases/
 ├── presentation/          → UI (screens, widgets) + BLoC logic
 │    ├── blocs/
 │    ├── screens/
 │    └── widgets/
 └── main.dart              → App entry point

This structure strictly follows Clean Architecture principles:

Domain Layer: Business logic (use cases, entities)

Data Layer: Implementation of repositories and API handling

Presentation Layer: UI + BLOC + ViewModel (MVVM)


🛠️ Technologies Used

Flutter — cross-platform UI framework

Dart — main programming language

BLoC — reactive state management

Clean Architecture — separation of concerns

MVVM — View ↔ ViewModel binding pattern

HTTP / Dio — for API communication

Equatable — for cleaner state comparisons
