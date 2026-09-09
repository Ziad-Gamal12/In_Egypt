 In Egypt

Your companion for discovering Egypt — landmarks, beaches, and hidden gems, all in one app.

In Egypt is a tourism app built to make exploring Egypt simple and enjoyable. It brings together historical sites, resorts, and beaches in one place — with details, photos, ratings, and map locations — so you can discover, book, and experience Egypt like a local, without the hassle.

 Screenshots
Onboarding	Auth	Home
Show Image	Show Image	Show Image
Place Details	Booking	My Trips
Show Image	Show Image	Show Image
Wishlist	Profile	Profile Details
Show Image	Show Image	Show Image
Light & Dark Modes
Show Image

✨ Features
🔍 Discover Places — Browse Egypt's historical sites, resorts, and beaches, organized by category (historical places, resorts, and more)
⭐ Top-Rated & Newest — See top-rated and newly added places on the home screen at a glance
📍 Place Details — View descriptions, photo galleries, exact map location, ratings, and reviews for every place
📝 Book a Trip — Reserve a place directly in the app: enter your name, contact info, number of people, and trip duration
💳 Flexible Payments — Pay securely via credit/debit cards, or split payments with Valu and Souhoola installment plans
🎫 Digital Tickets — Every booking generates a QR-code ticket with a live status (pending, accepted, upcoming)
🧳 My Trips — Track and search all your bookings and their statuses in one place
❤️ Wishlist — Save your favorite places and revisit them anytime
⭐ Ratings & Reviews — Rate places and read other travelers' reviews before booking
👤 Profile Management — Edit personal info, change password, and manage your account
🌗 Dark & Light Mode — Full theme support for comfortable viewing anytime
🌍 Multi-language Support
🔐 Authentication — Sign up/in with Email & Password, Google, or Facebook, with password recovery support
❓ In-app FAQ — Quick answers to common questions about using the app

🛠️ Tech Stack
Framework: Flutter (Dart)
Backend: Firebase (Auth, Firestore/Database, firebase_options.dart configured)
Localization: Built-in multi-language support (l10n)
Payments: Card payments, Valu & Souhoola (Buy Now, Pay Later)
Maps: Interactive location maps on place details

🏗️ Architecture

The project follows a feature-first structure, separating each screen/flow into its own module under Features/, with shared logic in core/.

lib/
├── Features/
│   ├── Auth/
│   ├── Book/
│   ├── Home/
│   ├── Onboarding/
│   ├── Profile/
│   ├── Splash/
│   ├── Trips/
│   └── Wishlist/
├── core/
├── generated/
├── l10n/
├── constant.dart
├── firebase_options.dart
└── main.dart

🚀 Getting Started
Prerequisites
Flutter SDK installed
A configured Firebase project
Installation
Clone the repository
bash
   git clone https://github.com/Ziad-Gamal12/In_Egypt.git
   cd In_Egypt
Install dependencies
bash
   flutter pub get
Set up Firebase
Add your google-services.json (Android) to android/app/
Add your GoogleService-Info.plist (iOS) to ios/Runner/
Make sure lib/firebase_options.dart matches your Firebase project configuration
Run the app
bash
   flutter run
   
👤 Author

Ziad Gamal

GitHub: @Ziad-Gamal12
LinkedIn: ziad-gamal-54b052375
<p align="center">Built with ❤️ using Flutter — showcasing the beauty of Egypt</p>
