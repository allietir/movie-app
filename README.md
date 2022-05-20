# Movie App

I am choosing to write this documentation in first-person voice so that you can see my thought processes on some things. There is some overall information here in the README as well as some comments in each file. This project was written in Flutter 2.10.5 and tested on a Pixel_3a_XL android emulator. I do not own a personal iOS device so I was unable to run and test it on iOS. This app may only run successfully on Android. I chose to use BLoC state management for this project. I also used auto formatting on save with the Dart standard line length of 80, so I apologize for any weird formatting.

## How To Run The App

Assuming that Flutter is installed and all checks for `flutter doctor` have passed, here are some directions for running the app.

**Using Visual Studio Code:**

1. Clone this repository to your local machine.
2. Open the project folder in Visual Studio Code.
3. Generate an api key from http://www.omdbapi.com/apikey.aspx or use the provided one in the coding exercise PDF.
4. In the project folder, navigate to the file lib\service\movie_api.dart
5. Uncomment the line `static const apiKey = 'apiKey here';`, insert your api key, and save.
6. In the lower right area of Visual Studio Code, select the device you want this app to run on.
7. Run the app from the menu using Run > Start Debugging or press F5.

**Using Android Studio**

1. Clone this repository to your local machine.
2. Open the project folder in Android Studio.
3. Generate an api key from http://www.omdbapi.com/apikey.aspx or use the provided one in the coding exercise PDF.
4. In the project folder, navigate to the file lib\service\movie_api.dart
5. Uncomment the line `static const apiKey = 'apiKey here';`, insert your api key, and save.
6. In the upper toolbar of Android Studio, select the device you want this app to run on from the dropdown menu.
7. The main.dart configuration should be selected by default. If not, make sure it is selected.
8. Run the app by pressing the green play button or from the menu using Run > Run 'main.dart'

**Using the command line:**

1. Clone this repository to your local machine.
2. Navigate to the project folder using `cd`
3. Generate an api key from http://www.omdbapi.com/apikey.aspx or use the provided one in the coding exercise PDF.
4. In the project folder, navigate to the file lib\service\movie_api.dart and open it in a text editor.
5. Uncomment the line `static const apiKey = 'apiKey here';`, insert your api key, and save.
6. Check that your device is connected using `flutter devices`
7. Run the app using `flutter run`

## Packages

The following external packages were used:

- [http](https://pub.dev/packages/http) - a library for making HTTP requests.
- [rxdart](https://pub.dev/packages/rxdart) - extends the capabilities of streams, which are used for BLoC.
- [shared_preferences](https://pub.dev/packages/shared_preferences) - used to persist settings for sorting movies by year
- [url_launcher](https://pub.dev/packages/url_launcher) - used for launching a URL

## Time Constraints

It was suggested that I take 2-3 hours to complete this. I wanted to add the "optional" and "bonus" specifications so truthfully I ended up taking closer to 5 hours before wrapping up the documentation and without writing any tests. I also implemented very simple error handling and recognize it could be done with more complexity. I am happy to follow-up about how I write tests for this app and answer any questions.
