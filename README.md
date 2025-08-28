# 🛍️ Shoppe App

Shoppe App is a modern e-commerce Flutter application that provides a smooth shopping experience with a clean and intuitive interface.  
It allows users to browse products, manage their carts, and complete purchases with ease.

---

## ✨ Features

- 🛒 **Product Listing**: View a wide range of products with details.  
- 📂 **Categories**: Explore products organized into multiple categories.  
- 🔍 **Search Functionality**: Find products quickly using keyword search.  
- 🛍️ **Cart Management**: Add, remove, and manage items in your cart.  
- 👤 **User Authentication**: Login, register, and manage your profile.  
- ❤️ **Wishlist**: Save favorite products for later.  
- 📦 **Orders**: Track your orders history.  
- 🌙 **Dark Mode Support**: Toggle between light and dark themes.  
- 🔄 **Pull-to-Refresh**: Refresh product lists easily.  
- 📱 **Responsive UI**: Works across Android, iOS, and Web.

---

## 🛠️ Tech Stack

- **Flutter** — Cross-platform UI framework.  
- **Dart** — Programming language.  
- **REST API** — For fetching and managing app data.  
- **Bloc (Cubit)** — State management for predictable and reactive UI updates.  
- **Dio** — Networking and API handling.  
- **SharedPreferences / Hive** — Local caching and persistent storage.  
- **GetIt** — Dependency injection for scalable architecture.  
- **JSON Serialization** — Data parsing and mapping.  
- **Responsive Layout** — Adaptive UI for multiple screen sizes.

---

## 🏗️ Project Architecture

The project follows **Clean Architecture with a modular feature-based structure**.  
This ensures scalability, maintainability, and testability.

### 🔹 Layers
- **Core Layer**  
  Contains shared modules such as theming, networking, caching, constants, and dependency injection.  

- **Feature Layer**  
  Each feature (Auth, Products, Cart, Profile, etc.) has its own **data**, **logic**, and **ui** folders.  

---

## 📸 Screenshots  

| Splash | Onboarding | Sign In | Login |  
|--------|------------|---------|-------|  
| <img width="200" height="400" src="https://github.com/user-attachments/assets/3ce48727-2c69-45ba-ab78-39a0f69c18c7" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/7abc2fc2-5799-499c-aa8b-857eb21d46b2" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/25e5a239-d822-4519-9eb3-6ee0b9695941" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/b5013076-489e-456a-be07-a711c3bc7b60" /> |

| Success Login | Home | Search | Product |  
|---------------|------|--------|---------|  
| <img width="200" height="400" src="https://github.com/user-attachments/assets/e7c37ba0-3e9b-4782-a15a-05b124d0300c" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/7ce3ea60-df7d-4d87-9fed-72322d46c331" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/436a1040-89c7-4edd-9e57-3bd056e92b0e" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/1c8e6bbf-26db-427d-90eb-ae2f537afbcb" /> |

| Wishlist | Cart | Checkout | Payment |  
|----------|------|----------|---------|  
| <img width="200" height="400" src="https://github.com/user-attachments/assets/b4e3a981-cb67-4f75-babc-0f93e42be8b5" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/c6e5cf4c-b0b1-43c7-b8df-203a8cb1c87a" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/c5372526-1269-4e9e-b5eb-2f5f1535bc1d" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/7105cde6-0735-43cd-8285-ec99196114e3" /> |

| Payment Success | Profile |  
|-----------------|---------|  
| <img width="200" height="400" src="https://github.com/user-attachments/assets/db990a62-7e3d-45c8-b31c-0353e38d0cdf" /> | <img width="200" height="400" src="https://github.com/user-attachments/assets/d3473300-47a9-42a6-9457-a462ce39c319" /> |

---
