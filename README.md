# Weather App

A professional Weather App built using Flutter that provides dynamic weather information. The app includes a search feature to look up weather by country. The UI dynamically updates based on the current weather conditions using container images, all powered by API calls and the Provider package for state management.

## Features

- **Search Functionality:** Users can search for a country to get the current weather information.
- **Dynamic UI:** The app updates the background container images based on the weather conditions (e.g., sunny, rainy, cloudy, etc.).
- **Error Handling:** Displays an error image or message when a country is not found or there is an issue fetching data.
- **API Integration:** Real-time weather data fetched via an external API.
- **State Management:** Efficiently managed app state using the **Provider** package.



## Screenshots

<img src="https://github.com/user-attachments/assets/266a0927-dfe6-4ff3-86b3-6c40dfdd5a84" width="300px">
<img src="https://github.com/user-attachments/assets/2f76ed5d-c392-4021-9c78-9d2a7bc29618" width="300px">
<img src="https://github.com/user-attachments/assets/cf873c62-0eb7-4e02-b65a-f59d977f8c89" width="300px">
<img src="https://github.com/user-attachments/assets/2857cd75-8f14-4883-8800-fdabc051c5c5" width="300px">
<img src="https://github.com/user-attachments/assets/99d0ad7c-b176-4fcb-84b0-d535f40ece02" width="300px">
<img src="https://github.com/user-attachments/assets/629e5c94-2f22-4652-8ba0-d2e5a8d5d031" width="300px">
<img src="https://github.com/user-attachments/assets/a9d450bb-e5a1-429d-bafb-12ddc1f3e218" width="300px">

## Screen Recording*

https://github.com/user-attachments/assets/eee175b6-02c1-46b4-ac9f-cae8d684d1c0


## Tech Stack

- **Flutter**: Cross-platform framework for building the UI.
- **Provider**: State management solution for handling app state efficiently.
- **HTTP**: For API calls to fetch real-time weather data.

## Prerequisites

- Flutter SDK installed
- Basic understanding of Dart and Flutter

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/weather_app.git
   cd weather_app
## How It Works

### Search Functionality
- The user enters a country name.
- The app fetches weather data using the API.
- If the country exists, it dynamically displays the weather information.
- If the country is not found, an error image or message is displayed.

### Dynamic UI
- The app updates the container image dynamically based on the weather condition:
  - **Sunny**: Displays a bright and clear background.
  - **Rainy**: Displays a rain-themed background.
  - **Cloudy**: Displays a cloudy background.

### State Management
- The **Provider** package is used to manage the app state efficiently:
  - Ensures seamless updates of weather data across the UI.
  - Improves performance by reducing unnecessary rebuilds.

### Demo
- Enter a country name in the search bar.
- View the weather details and a dynamic background image.
- See an error image if the country is invalid or an issue occurs.
