# Instagram Clone
[![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-12.4-blue.svg)](https://developer.apple.com/xcode)
[![Platform](https://img.shields.io/badge/platforms-iOS%20%7C%20-green.svg)](https://github.com/sozman/instagram-clone-swiftUI.git)
[![MIT](https://img.shields.io/badge/licenses-MIT-red.svg)](https://opensource.org/licenses/MIT)

![Logo](images/instagram.png)

## Overview
A clone of the instagram app built with swiftUI and Vapor Framework for dummy datas

## Features:
* SwiftUI
* Declerative views
* Dummy Data API with VAPOR
* Dark Mode
* To navigate pages
* Combine

## Requirements
* iOS 13+
* Xcode 11.0+
* Swift 5.0+

## Clone the repository

`git clone https://github.com/sozman/instagram-clone-swiftUI.git`

## Build and Run

First of all you should run API target where is on the project. After that you should run InstagramClone target

![Build](images/buildandrun.png)

### API Error

* If you get an error which is Address already in use, you should kill the proccesse.

![Error](images/error.png)

1. get proccesse's PID
`lsof -i :8080 `
2. kill proccesse 
`kill PID `

![Terminal](images/terminal.png)


## Screenshots

### Home
| ![Home](images/home.png) | ![HomeDark](images/homedark.png) | 
|:---:|:---:|

### Search
| ![Search](images/search.png) | ![SearchDark](images/searchdark.png) | 
|:---:|:---:|

### Notification
| ![Notification](images/notification.png) | ![NotificationDark](images/notificationdark.png) | 
|:---:|:---:|

### Profile
| ![Profile](images/profile.png) | ![Profile Dark](images/profiledark.png) | 
|:---:|:---:|

## Author
Sinan Özman, sinanozman@icloud.com

## License
Instagram-clone-swiftUI is available under the MIT License, see LICENSE for more information.
