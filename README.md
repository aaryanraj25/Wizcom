# Wizcom - Flutter Product List App

## Overview
This Flutter app displays a product list where users can browse products, view details, and add items to a cart. The app includes a clean and responsive UI with essential features such as product listing, detail views, and a cart.

## Features
1. **Product Listing**
   - Displays a list of products with name, image, and price.
   - Includes a search bar to filter products by name.

2. **Product Details**
   - Navigates to a detailed view of the product with name, image, description, and price upon tapping.

3. **Cart**
   - Shows a cart icon with an item count.
   - Users can add products to the cart from the details page.
   - Provides a cart screen displaying items, quantities, and total price.
   - Allows removal of items from the cart.

4. **UI**
   - Designed with a clean, responsive, and user-friendly interface.

## Other Features 
- **State Management**: Utilizes state management solutions Provider.
- **Animations**: Incorporates animations to enhance user experience.
- **Testing**: Includes basic unit/widget tests.

## Setup Instructions
1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/Wizcom.git
 
2. **Navigate to the Project Directory**
   ```bash
   cd Wizcom

3. **Install Dependencies**
   ```bash
   flutter pub get

4. **Run the App**
   ```bash
   flutter run

5. **Run unit/widget tests using the command**
   ```bash
   flutter test

## Code Structure


lib/
├── main.dart
├── models/
│   ├── product.dart
│   └── cart_item.dart
├── views/
│   ├── screens/
│   │   ├── product_list_screen.dart
│   │   ├── product_detail_screen.dart
│   │   └── cart_screen.dart
│   └── widgets/
│       ├── product_list_item.dart
│       ├── search_bar.dart
│       ├── cart_icon.dart
│       └── cart_list_item.dart
├── controllers/
│   ├── product_controller.dart
│   └── cart_controller.dart
├── services/
│   └── data_service.dart
├── utils/
│   └── constants.dart
└── data/
    └── products.json

test/
├── widget_test.dart
└── unit/
    ├── product_controller_test.dart
    └── cart_controller_test.dart

assets/
└── images/

   
