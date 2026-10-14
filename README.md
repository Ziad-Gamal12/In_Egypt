<div align="center">
<img src="assets/icons/AppIcon.png" alt="In Egypt icon" width="96" />
<br/>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/images/AppLogo-light.svg">
  <img src="assets/images/AppLogo.svg" alt="In Egypt" width="170" />
</picture>>

# In Egypt — Smart Tourism & Landmark Booking App

**A cross-platform Flutter tourism application for discovering Egypt's historical landmarks, resorts, and hidden gems—featuring interactive maps, multi-step trip booking, Fawaterak & BNPL payments (Valu / Souhoola), and QR digital tickets.**

[https://img.shields.io/badge/Flutter-Cross--Platform-02569B?logo=flutter&logoColor=white]
[https://img.shields.io/badge/Dart-3.4%2B-0175C2?logo=dart&logoColor=white]
[https://img.shields.io/badge/State-BLoC%20%2F%20Cubit-FFD22E?logoColor=black]
[https://img.shields.io/badge/Architecture-Clean%20Architecture-2E7D32]
[https://img.shields.io/badge/Firebase-Auth%20%7C%20Firestore%20%7C%20Storage-FFCA28?logo=firebase&logoColor=black]
[https://img.shields.io/badge/Supabase-Edge%20Functions-3ECF8E?logo=supabase&logoColor=white]
[https://img.shields.io/badge/Payments-Fawaterak%20%7C%20Valu%20%7C%20Souhoola-00A8E8]

[**Companion Admin Panel Repo**](https://github.com/Ziad-Gamal12/In-Egypt-Admin-Panel) · [**Live Admin Dashboard**](https://inegyptadminpanel.vercel.app/)

</div>

## 📖 Overview

**In Egypt** (`in_egypt`) is a modern mobile travel companion designed to make exploring and booking destinations across Egypt effortless. Travelers can browse curated historical sites, beaches, and resorts, inspect interactive map locations and community reviews, reserve trips with flexible payment options, and receive instant QR-code digital passes.

- **End-to-End Traveler Experience:** Covers **21 screen views across 19 declarative `GoRouter` routes**, spanning onboarding, social authentication, destination discovery, checkout, QR ticket generation, and wishlist management.
- **Flexible Payment Gateway Integration:** Integrates **Fawaterak** via `Dio` and `WebView` to support credit/debit cards alongside **Valu** and **Souhoola** Buy Now, Pay Later (BNPL) installment plans.
- **Connected Back-Office Ecosystem:** Works in tandem with the [**In Egypt Admin Panel**](https://github.com/Ziad-Gamal12/In-Egypt-Admin-Panel) ([Live Demo](https://inegyptadminpanel.vercel.app/)), where operations staff manage destinations, track weekly trends, oversee reservations, and scan traveler QR tickets on-site.

## 📱 Screenshots

| Onboarding | Authentication | Home Feed |
| :---: | :---: | :---: |
| <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/onboarding.png?raw=true" alt="Onboarding" width="220" /> | <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/auth.png?raw=true" alt="Authentication" width="220" /> | <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/home.png?raw=true" alt="Home Feed" width="220" /> |

| Place Details & Map | Trip Booking & Checkout | My Trips & QR Tickets |
| :---: | :---: | :---: |
| <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/placeDetails.png?raw=true" alt="Place Details" width="220" /> | <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/booking.png?raw=true" alt="Booking Flow" width="220" /> | <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/bookings.png?raw=true" alt="My Trips" width="220" /> |

| Saved Wishlist | User Profile | Personal Details |
| :---: | :---: | :---: |
| <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/wishlist.png?raw=true" alt="Wishlist" width="220" /> | <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/profile.png?raw=true" alt="Profile" width="220" /> | <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/profileDetails.png?raw=true" alt="Profile Details" width="220" /> |

| Adaptive Light & Dark Modes |
| :---: |
| <img src="https://github.com/Ziad-Gamal12/In_Egypt/blob/main/Screenshots/lightAndDarkModes.png?raw=true" alt="Light and Dark Modes" width="680" /> |

## ✨ Key Features

- **Curated Destination Discovery (`Home`):** Browse Egypt's historical landmarks, beaches, museums, and resorts by category (`CategoryPlacesView`), or explore dedicated feeds for top-rated (`MorePopularPlacesView`) and newly added (`MoreNewestPlacesView`) destinations.
- **Rich Place Details & Interactive Maps:** Inspect high-resolution photo galleries, ticket pricing, exact geographic coordinates rendered on interactive maps (`flutter_map` & `latlong2`), and verified traveler reviews (`PlaceDetailsView`).
- **Community Ratings & Serverless Aggregation:** Submit star ratings and written reviews for visited landmarks, triggering the **`update-rating` Supabase Edge Function** to recalculate destination ratings.
- **Multi-Step Trip Booking (`Book`):** Select check-in dates (`date_picker_plus`), trip duration, guest count, and contact details through a guided reservation flow (`BookPlaceView`).
- **Fawaterak & BNPL Checkout:** Query available payment methods dynamically and process transactions via credit/debit cards, **Valu**, or **Souhoola** installment plans inside an integrated `CustomWebView` with automated redirect-status detection.
- **QR-Code Digital Tickets (`Trips`):** Automatically generate and upload a unique QR code (`qr_flutter`) upon booking confirmation (`BookedSuccessView`). Travelers can search their reservations (`MyTripsView`) and present scannable digital passes (`MyTripDetailsView`) with live statuses (`pending`, `accepted`, `upcoming`).
- **Paginated Wishlist (`Wishlist`):** Bookmark favorite landmarks to a personal Firestore subcollection (`Users/{uid}/wishlist`) with search and paginated browsing.
- **Multi-Provider Authentication (`Auth`):** Sign in or register via **Email & Password**, **Google** (`google_sign_in`), **Facebook** (`flutter_facebook_auth`), or **Apple** (`sign_in_with_apple`), complete with email verification and password reset (`CustomResetPasswordView`).
- **Profile, FAQ & Theme Customization (`Profile`):** Update personal details, browse the built-in FAQ (`QuestionsAndAnswersView`), review About Us and Terms, and switch between **Arabic/English** and **Light/Dark** themes.

## 🛠 Tech Stack

| Category | Packages & Technologies |
| :--- | :--- |
| **Framework & SDK** | Flutter (Android, iOS, Web, Desktop scaffolding), Dart `>=3.4.0 <4.0.0` |
| **State Management** | `flutter_bloc ^9.1.1`, `provider ^6.1.5` |
| **Dependency Injection** | `get_it ^8.0.3` |
| **Navigation & Routing** | `go_router ^15.1.3` (19 declarative routes) |
| **Backend & Serverless** | `firebase_core ^4.0.0`, `firebase_auth ^6.0.2`, `cloud_firestore ^6.0.0`, `firebase_storage ^13.0.0`, `supabase_flutter ^2.10.0` |
| **Payments & Checkout** | **Fawaterak Payment Gateway** via `dio ^5.9.0` & `webview_flutter ^4.13.0` (Cards, Valu, Souhoola) |
| **Maps & Geolocation** | `flutter_map ^8.2.1`, `latlong2 ^0.9.1` |
| **QR & Media** | `qr_flutter ^4.1.0`, `image_picker ^1.1.2`, `cached_network_image ^3.4.1`, `svg_flutter ^0.0.1` |
| **UI & Animations** | `flutter_animate ^4.5.2`, `lottie ^3.3.1`, `skeletonizer ^2.1.0+1`, `glass ^2.0.0+2`, `liquid_glass ^0.0.2`, `date_picker_plus ^4.2.0`, `expansion_widget ^0.1.0`, `awesome_snackbar_content ^0.1.6`, `font_awesome_flutter ^10.8.0` |
| **Social Auth Providers** | `google_sign_in ^7.0.0`, `flutter_facebook_auth ^7.1.2`, `sign_in_with_apple ^7.0.1` |
| **Local Storage** | `shared_preferences ^2.5.3` |
| **Localization & Functional** | `flutter_localizations`, `intl` (Arabic & English ARB files), `dartz ^0.10.1` |
| **Dev & Testing** | `flutter_test`, `flutter_lints ^5.0.0`, `flutter_launcher_icons ^0.14.4` |

## 🏗 Architecture

The application follows a **feature-first Clean Architecture** structure (`presentation`, `domain`, `data`) powered by **BLoC / Cubit** state management and **GetIt** dependency injection. Shared entities, payment models, repositories, and service abstractions are centralized under `lib/core/`.

~~~mermaid
flowchart LR
    UI[Presentation Layer<br/>BookPlaceView & CustomWebView] --> Logic[State Management<br/>PaymentCubit & BookingBloc]
    Logic --> Repo[Domain / Data<br/>PaymentRepoImpl & BookingsRepoImp]
    Repo --> Fawaterak[(Fawaterak API<br/>via DioService)]
    Repo --> Firebase[(Cloud Firestore &<br/>Firebase Storage)]
    Repo --> Supabase[(Supabase Edge Function<br/>update-rating)]
~~~

### Example Workflow: End-to-End Trip Booking & Fawaterak Checkout
1. **Payment Method Discovery:** `BookPlaceView` initializes `PaymentCubit` and `BookingBloc`. `PaymentCubit` calls `PaymentRepoImpl`, which uses `DioService` to fetch available payment options from the Fawaterak API.
2. **Invoice Initiation:** Upon selecting a payment method (Card, Valu, or Souhoola), `PaymentRepoImpl` posts the customer, booking, and cart payload to Fawaterak and receives a checkout redirect URL.
3. **WebView Verification:** `CustomBookPaymentPageViewItem` opens the checkout URL inside `CustomWebView`, which monitors navigation hosts for payment success or failure callbacks and dispatches the result to `BookingBloc`.
4. **QR Ticket Generation & Persistence:** On payment confirmation, `BookingBloc` triggers `BookingsRepoImp` to generate a unique booking QR code (`qr_flutter`), upload the QR image to **Firebase Storage**, and persist the reservation document in Firestore's `Bookings` collection.

### Folder Structure

~~~text
lib/
├── core/
│   ├── Cubits/
│   │   └── theme_cubit/                     # Light/Dark mode state persisted via SharedPreferences
│   ├── Entities/
│   │   ├── PaymentMethodsEntities/          # Fawaterak payment method domain entities
│   │   ├── PaymentMethodsResponsesEntities/ # Invoice & checkout response entities
│   │   ├── PaymentRequestEntities/          # Customer & cart request entities
│   │   ├── BookingEntity.dart
│   │   ├── PlaceEntity.dart
│   │   └── PlaceReviewEntity.dart
│   ├── errors/                              # Custom Failure classes and exception handling
│   ├── helpers/                             # UI helpers, validators, and formatters
│   ├── models/                              # Shared data models and JSON serialization
│   ├── services/                            # FirebaseAuth, Firestore, Storage, Dio, and GetIt setup
│   ├── utils/                               # GoRouter (App_router.dart), BackEndkeys, themes, styles
│   └── widgets/                             # Reusable buttons, place cards, and custom inputs
├── Features/
│   ├── Auth/                                # Email, Google, Facebook, Apple sign-in & password reset
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── Book/                                # Multi-step reservation, Fawaterak checkout & QR creation
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── Home/                                # Categories, popular/newest feeds, search, maps & reviews
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── Onboarding/                          # Interactive onboarding walkthrough
│   │   ├── Domain/
│   │   └── Presentation/
│   ├── Profile/                             # Personal details, FAQ, About Us, Terms & theme toggle
│   │   ├── Domain/
│   │   └── Presentation/
│   ├── Splash/                              # Startup session check & initial routing
│   │   └── presentation/
│   ├── Trips/                               # User bookings list, search, status tracking & QR ticket view
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── Wishlist/                            # Saved places subcollection with search & pagination
│       ├── data/
│       ├── domain/
│       └── presentation/
├── generated/                               # Auto-generated localization delegates
├── l10n/                                    # intl_ar.arb and intl_en.arb translation sources
├── constant.dart                            # Brand colors and API configuration constants
├── firebase_options.dart                    # Platform-specific Firebase configuration
└── main.dart                                # App bootstrap, DI registration & provider setup
~~~

## 🧭 Declarative Navigation (`GoRouter`)

Configured in `lib/core/utils/App_router.dart`, the app defines **19 routes** covering the complete traveler journey:

| Route Path | Screen Widget | Purpose |
| :--- | :--- | :--- |
| `/` | `SplashView` | Startup screen; checks onboarding and authentication state |
| `/OnBoardingView` | `OnBoardingView` | First-launch introduction to Egypt's landmarks and app features |
| `/sign-in` | `SignInView` | Email/password and social login (Google, Facebook, Apple) |
| `/sign-up` | `SignUpView` | New traveler account registration |
| `/CustomResetPasswordView` | `CustomResetPasswordView` | Password recovery flow via Firebase Auth |
| `/HomeView` | `HomeView` | Main shell hosting Home, Wishlist, Trips, and Profile navigation |
| `/PlaceDetailsView` | `PlaceDetailsView` | Landmark gallery, description, interactive map, and reviews |
| `/CategoryPlacesView` | `CategoryPlacesView` | Filtered destination listing by category (Historical, Beaches, etc.) |
| `/MorePopularPlacesView` | `MorePopularPlacesView` | Full directory of top-rated destinations |
| `/MoreNewestPlacesView` | `MoreNewestPlacesView` | Full directory of recently added destinations |
| `/BookPlace` | `BookPlaceView` | Multi-step reservation form and Fawaterak payment method selector |
| `/CustomWebView` | `CustomWebView` | In-app checkout browser with redirect callback detection |
| `/BookedSuccessView` | `BookedSuccessView` | Booking confirmation screen with generated QR ticket |
| `/MyTripsView` | `MyTripsView` | Searchable list of the traveler's past and upcoming bookings |
| `/MyTripDetailsView` | `MyTripDetailsView` | Detailed reservation breakdown, live status, and scannable QR pass |
| `/PersonalDetailsView` | `PersonalDetailsView` | Profile editing and account information management |
| `/QuestionsAndAnswersView` | `QuestionsAndAnswersView` | Expandable in-app FAQ guide |
| `/AboutUsView` | `AboutUsView` | Platform mission and overview |
| `/TermsAndConditionsView` | `TermsAndConditionsView` | User terms, privacy, and booking policies |

## ☁️ Backend & Cloud Services

### Cloud Firestore Schema
| Top-Level Collection | Subcollection | Description |
| :--- | :--- | :--- |
| `Users` | `wishlist` | Traveler profile records (`User` role) and bookmarked destination IDs |
| `Places` | `reviews` | Destination metadata, coordinates, pricing, images, and traveler reviews |
| `Bookings` | — | Confirmed trip reservations, guest details, statuses, and QR ticket URLs |

### Supabase Edge Functions & Firebase Storage
- **Supabase Edge Function (`update-rating`):** Invoked when a traveler submits a place review to recalculate and update the destination's aggregate rating.
- **Firebase Storage:** Hosts destination photo galleries and generated booking QR-code PNGs.

## 🎨 Theming & Localization

- **Typography:** Uses the **Cairo** font family (`Regular`, `Medium`, `SemiBold`, `Bold`) from `assets/fonts/cairo-font/`.
- **Brand Palette:** Primary Egyptian Gold (`#FFD22E`) paired with adaptive Light and Dark surface themes, Dual-mode SVG logos (`AppLogo.svg` & `AppLogoDarkMode.svg`), and glassmorphic UI accents (`glass`, `liquid_glass`).
- **Theme Persistence:** Managed by `ThemeCubit` and persisted locally using `SharedPreferences` (`isDark`).
- **Bilingual Support:** Full **Arabic (`ar` — default RTL)** and **English (`en`)** localization powered by Flutter's `l10n` (`lib/l10n/intl_ar.arb`, `lib/l10n/intl_en.arb`).

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) with Dart `>=3.4.0 <4.0.0`
- A configured **Firebase** project (Authentication, Cloud Firestore, Firebase Storage)
- A **Supabase** project (for the `update-rating` Edge Function)
- A **Fawaterak** account / API token (for payment gateway testing)

### Installation & Configuration

1. **Clone the repository**
   ~~~bash
   git clone https://github.com/Ziad-Gamal12/In_Egypt.git
   cd In_Egypt
   ~~~

2. **Install dependencies**
   ~~~bash
   flutter pub get
   ~~~

3. **Configure Firebase**
   - Generate `lib/firebase_options.dart` via `flutterfire configure`, or add your platform configuration files:
     - Android: `android/app/google-services.json`
     - iOS: `ios/Runner/GoogleService-Info.plist`

4. **Configure Service Keys (`lib/constant.dart`)**
   - Set your Supabase and Fawaterak configuration constants in `lib/constant.dart`:
     ~~~text
     supaBaseUrl
     supaBaseAnonKey
     fawaterkTestaccessToken
     ~~~
   > **Security Note:** Never commit production payment tokens or private keys to public version control.

5. **Run the app**
   ~~~bash
   flutter run
   ~~~

### Build & Test Commands

~~~bash
# Run widget & unit tests
flutter test

# Analyze code quality
flutter analyze

# Build release packages
flutter build apk
flutter build appbundle
flutter build ios
~~~

## 👤 Author

**Ziad Gamal** — Flutter Developer

- **LinkedIn:** [linkedin.com/in/ziad-gamal-54b052375](https://www.linkedin.com/in/ziad-gamal-54b052375/)
- **GitHub:** [@Ziad-Gamal12](https://github.com/Ziad-Gamal12)
- **Email:** [ziadgamal.work@gmail.com](mailto:ziadgamal.work@gmail.com)
