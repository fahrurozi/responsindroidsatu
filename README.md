
<!-- PROJECT LOGO -->
<br />
<p align="center">
    <img src="assets/images/logo.png" alt="Logo" width="80" height="100">
  </a>

  <h3 align="center">Seth C Mobile App</h3>

  <p align="center">
    <a href="https://youtu.be/nMipBSv4ch8">View Demo</a>

  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project
![WhatsApp Image 2021-03-30 at 23 27 55](https://user-images.githubusercontent.com/74372891/113023215-9cbf0200-91af-11eb-8c03-f8c6026b0cf2.jpeg)

SETH C  is in the form of a mobile application. The purpose is as an information channel (regarding covid 19), interaction of the user with the covid testing result,  and also extra features including test types that a specific hospital provides,  information on the specific certificate needed on entering a specific area, the previous certificate made for the user. 

### Built With
In developing this app, we use three google products
* [Flutter](https://flutter.dev/)
* [Google Maps](https://www.google.com/maps)
* [Google Cloud Platform](https://cloud.google.com/)

### Prerequisites

Before installing the code, We need to install flutter in the editor

#### Visual Studio Code 

Install the extension of Flutter on Visual Studio Code
1. Open Visual Studio Code
2. Click on the **Extensions** or **Ctrl+Shift+X**
3. In the search bar type flutter
  ```sh
  flutter
  ```
4. Select **Flutter** by the Author **Dart Code**
5. Click on **Install**
6. Click on **Reload**

Create Flutter App using Visual Studio Code
1. Open the command palette in **View > Command Palette** or **F1** or **Ctrl+Shift+P**
2. In the search bar type flutter
  ```sh
  flutter
  ```
3. Select with the arrow keys on the keyboard **Flutter: New Project** and press **Enter**
4. Enter the **name of the Flutter project**
5. Select the folder to create Flutter project
6. The project folder will be opened and all the necessary files and folders will be created



#### Android Studio 

Install the Flutter Plugin on Android Studio
1. In the window **Welcome to Android Studio** click on **Configure** and then on **Plugins**
2. In the search bar type in **flutter** and click on **Search in repositories**
3. Click on the one that says **Flutter**, Then click on **Install, Accept** and **Yes**
4. Now click on **Restart Android Studio**, then on **OK**, and on **Restart**
5. Android Studio will open again

Add the Android SDK to Flutter
1. Again open the **Environment variables**
2. And in the **System variables** click on **New**
3. In **Variable name** type **ANDROID_HOME**
4. Click on **Browse directory** and select the path to download the Android SDK:
   ```sh
   C:\Users\<YOUR_WINDOWS_USERNAME>\Android\SDK
   ```
5. Now click on **Ok** in the 3 windows to save changes
6. Press the **Windows key** and in the search bar type **cmd** and select the **Command Prompt**
7. Type the command **flutter doctor** and press **Enter**
8. You will notice that you need to accept Android licenses, so type the following command and press **Enter**:
     ```sh
       flutter doctor --android-licenses
     ```
9. Now you will be asked if **you agree each license**, in which you must type **Y** and press **Enter** for each license
10. When you have accepted all the licenses you will get **All SDK package licenses** accepted and close the Command Prompt

Create Flutter App using Android Studio
1. In the **Welcome to Android Studio** window click on **Start a new Flutter Project**
2. Select **Flutter Application** and click on **Next**, it will open **Configure the new Flutter application**
3. In **Project name** enter the name of the project, which should go in the **lowercase_with_underscores**
4. In **Flutter SDK path** enter 
    ```sh
   C:\flutter
   ```
5. In **Project location** enter the location where you want to create the project
6. In **Description** enter a brief description of the project
7. Now click on **Next**, and it will open **Set the package name**
8. In **Company’s domain** enter a domain of yours or any unique identifier you want, which will be used to generate the **Package name**
9. The **Package name** will be auto-generated with the **Project name** and the **Company’s domain**, which is used to identify your app in the Play Store, although if you do not like it auto-genre you can edit it
10. In **Platform channel language** choose if you want your app Flutter support Kotlin for the Android code and Swift for the iOS code, in case you want to also code native code for each platform
11. Click on **Finish** and it will create all the folders and files of your project Flutter




<!-- USAGE EXAMPLES -->
## Usage

Create an Android Virtual Device (AVD)
1. Open Android Studio
2. Select **File > Open > SethCMobileApp**
3. Install flutter imports
```sh
flutter pub get
```
4. Create virtual device by opening **AVD Manager**
5. Click **Create Virtual Device**
7. In **Select Hardware** page, choose virtual device by **Category > Phone** and select desired size. Then, click **Next**
9. In **System Image** page, select **Q** (or your desired system image). If you see **Download** next to the system image, you need to click it to download the system image. You must be connected to the internet to download it.
11. In **Verify Configuration** page, change AVD properties as needed, then click **Finish**


Run code on AVD
1. Open **AVD Manager**
2. On **Actions** column, click the green triangle button to launch
4. Wait until emulator appears on your screen
5. Run the code on emulator by clicking **Run > Run 'main.dart'**
7. Wait for the application to run
8. The app is ready to use
<br />
<p align="left">
  <img src="assets/images/Screenshot 2021-03-31 004454.png" alt="Login Page" width="356" height="713"><img>
  </a>
</p>


<!-- CONTACT -->
## Contact

Project Link: https://github.com/delkirawan/SethCMobileApp

