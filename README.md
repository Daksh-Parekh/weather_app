# Weather App

A professional Weather App built using Flutter that provides dynamic weather information. The app includes a search feature to look up weather by country. The UI dynamically updates based on the current weather conditions using container images, all powered by API calls and the Provider package for state management.

## Features

- **Search Functionality:** Users can search for a country to get the current weather information.
- **Dynamic UI:** The app updates the background container images based on the weather conditions (e.g., sunny, rainy, cloudy, etc.).
- **Error Handling:** Displays an error image or message when a country is not found or there is an issue fetching data.
- **API Integration:** Real-time weather data fetched via an external API.
- **State Management:** Efficiently managed app state using the **Provider** package.

## Screenshots

| Weather Display | Error Display |
|-----------------|---------------|
|<img src="https://github.com/user-attachments/assets/cdd747b4-e561-4ca3-b5e5-689e690c6558" width="300px">|<img src="https://github.com/user-attachments/assets/213a538f-42d9-440c-b197-173bc3af77a6" width="300px">|
|<img src="https://github.com/user-attachments/assets/44b75ca4-400d-4cfc-9f18-d9784db5334a" width="300px">|<img src="https://github.com/user-attachments/assets/37d4361d-468d-4683-9d1f-a5c65b358cd8" width="300px">|

## Screen Recording*

https://github.com/user-attachments/assets/d15e5bc5-4401-4d7b-b7d6-609519bffb31

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
