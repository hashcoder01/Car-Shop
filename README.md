# Car Shop Rakoo 🏎️

**Car Shop** is a professional-grade Flutter e-commerce application dedicated to the automotive industry. It provides a seamless platform for users to browse, search, and purchase car parts, accessories, and services. The app is designed with a modern UI/UX, catering to both individual customers and business entities through a dedicated business registration flow.

---

## 🚀 Features Implemented

### 🔐 Robust Authentication & Onboarding
*   **User Onboarding:** Interactive walkthrough and splash screens to guide new users.
*   **Comprehensive Signup:** Support for standard user registration and specialized **Business Registration** (including license upload UI).
*   **Secure Access:** OTP-based verification, password recovery (Forgot/New Password), and login systems.

### 📦 Advanced Product Catalog
*   **Dynamic Home Screen:** Features auto-scrolling animated banners for promotions and categories.
*   **Smart Search:** Search products by name or **chassis number** for precise part matching.
*   **Categorization:** Dedicated sections for *Featured Products* and *Latest Arrivals*.
*   **Detailed Views:** In-depth product descriptions, pricing in AED, and technical specifications.

### 🛒 Shopping & Order Management
*   **Intuitive Cart:** Efficient cart management with easy item adjustment.
*   **Order Tracking:** View order history, active orders, and detailed status updates.
*   **Order Completion:** A clear flow from cart to successful order placement.

### 💳 Payments & Logistics
*   **Address Book:** Manage multiple shipping addresses with ease.
*   **Payment Integration UI:** Support for multiple card types including Visa, MasterCard, Discover, and American Express.
*   **Card Management:** Add, save, and search through registered payment cards.

### 🌐 Localization & Customization
*   **Dual Language:** Full support for **English and Arabic** languages.
*   **Personalization:** User profile management, settings, and privacy policy access.

---

## 🛠️ Technologies and Packages Used

*   **Framework:** [Flutter](https://flutter.dev/) (3.11.5+)
*   **Language:** [Dart](https://dart.dev/)
*   **UI Components:** Material Design 3
*   **Key Dependencies:**
    *   `dotted_border`: Used for professional file/license upload interfaces.
    *   `cupertino_icons`: For high-quality iOS-style iconography.
    *   `flutter_lints`: Ensuring code quality and consistency.

---

## 🏗️ App Architecture

The project follows a clean, modular structure for scalability:

```text
lib/
├── Screens/          # 30+ UI Screens (Auth, Shop, Profile, Payments)
├── Widgets/          # Reusable UI components (Buttons, Drawers, TextFields)
└── main.dart         # App entry point & configuration
```

### Key Screens
*   `HomeScreen`: Central hub with product discovery and navigation.
*   `RegisterBusiness`: Specialized B2B onboarding flow.
*   `ProductDetailScreen`: Detailed specifications for automotive parts.
*   `CartScreen` & `ExtraCart`: Robust shopping cart logic.
*   `LanguageScreen`: Localization toggle.

---

## ⚙️ Installation Guide

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/hashcoder01/Car-Shop.git
    ```
2.  **Navigate to the project folder:**
    ```bash
    cd car
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the application:**
    ```bash
    flutter run
    ```

---

## 📖 Usage Instructions

1.  **Select Language:** Start by choosing between English or Arabic on the startup screen.
2.  **Browse/Search:** Use the home screen to find featured parts or use the search bar for specific chassis numbers.
3.  **Business Account:** If you are a vendor, use the "Register Business" option in the signup flow to upload your license.
4.  **Checkout:** Add items to your cart, set your delivery address, and proceed to the secure payment simulation.

---



## 🔮 Future Enhancements

*   **Real-time Tracking:** Live GPS tracking for parts delivery.
*   **AI Part Identification:** Use the camera to identify car parts via AI.
*   **Payment Gateway Integration:** Integration with Stripe or PayPal for live transactions.
*   **Chat Support:** In-app customer support for part inquiries.

---

## 👨‍💻 Author

**Hash Coder**
*   Project: Car Shop
*   Role: Flutter Developer

---
*Developed with ❤️ for the automotive community.*
