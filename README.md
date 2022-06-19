<!-- # Home-Poker-Table -->

<h1 align="center">
    <!-- <img alt="Home Poker Table" title="Home Poker Table" src="https://github.com/san-ghun/Home-Poker-Table/blob/main/docs/images/180.png" width="180"> -->
    <!-- <img alt="Home Poker Table" title="Home Poker Table" src="docs/images/180.png" width="180"> -->
    <a href="https://apps.apple.com/app/home-poker-table/id1629143360?itscg=30200&amp;itsct=apps_box_appicon" style="width: 170px; height: 170px; border-radius: 22%; overflow: hidden; display: inline-block; vertical-align: middle;"><img src="docs/images/180.png" alt="Home Poker Table" style="width: 170px; height: 170px; border-radius: 22%; overflow: hidden; display: inline-block; vertical-align: middle;"></a>
    <br>
    Home Poker Table
</h1>

<h4 align="center">
    Don't fight for coins, play for fun!
</h4>

<p align="center">
    <img src="https://img.shields.io/badge/swift-5.6.1-blue.svg" />
    <img src="https://img.shields.io/badge/xcode-13.4.1-green.svg" />
    <img src="https://img.shields.io/badge/ios->13.4-yellow.svg" />
    <img src="https://img.shields.io/badge/licence-MIT-lightgrey.svg" />
    <br>
    <br>
    <a href="https://apps.apple.com/app/home-poker-table/id1629143360" target="_blank">
        <img src = "https://devimages-cdn.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store.svg"> 
    </a>
    <a href="https://apps.apple.com/kr/app/home-poker-table/id1629143360" target="_blank">
        <img src = "https://devimages-cdn.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store-kr.svg"> 
    </a>
</p>
<br>

> -. First personal app development project.    
> -. One-person production, released on App Store.    
> -. A simple chip calculator to have fun with friends and family.

<br>

\**Following contents are aimed for coders and developers, if you are not interested in those topics, please check more information on [Web Page for Home-Poker-Table](https://san-ghun.github.io/Home-Poker-Table/) or [App Store for Home-Poker-Table](https://apps.apple.com/app/home-poker-table/id1629143360). Thanks!* :)


## Table of contents
- [About Home-Poker-Table](#about-home-poker-table)
- [Features](#features)
- [Folder Structure](#folder-structure)
- [Version History](#version-history)
- [What I Learned](#what-i-learned)
    - [From start to release](#from-start-to-release)
- [Future Work](#future-work)
- [License](#license)


## About Home-Poker-Table

<p align="center">
<img src="docs/images/screenshots/0.png" width="130" />
<img src="docs/images/screenshots/1.png" width="130" />
<img src="docs/images/screenshots/2.png" width="130" />
<img src="docs/images/screenshots/3.png" width="130" />
<img src="docs/images/screenshots/4.png" width="130" />
<img src="docs/images/screenshots/5.png" width="130" />
</p>

- Home-Poker-Table is a simple score calculator app built for people who want to enjoy playing cards games, such as, poker with friends and family, casually.
- Home-Poker-Table is aimed to replace coins and chips or, sometimes, for pen and paper, with only one smart phone, as simple as possible.
- With only one smart phone, installing the Home-Poker-Table, maximum 8 people can play in a game.
- With the goal of experiencing whole process from the start of the project to the launch, not only development, but also planning and design were carried out directly.
- Develop with `UIKit` using `storyboard`, in MVC pattern.

<details>
<summary>Captions for screenshots</summary>

> - **Main view**    
    "How To" instruction equipted on view.    
    Two parameters to set up the new game.    
    - Asset for players & Number of players.    

> - **Asset setting view**    
    Setting the amount of asset for players.    
    Min. 5 to Max. 10,000    

> - **Game view of initial play**    
    8 players with asset of 1,000, for each.    
    

> - **Game view of on-going play 1**    
    A tap on player's cell turn on the selection highlight on player's cell.    
    Able to raise the bet by tapping chip button on bottom.    
    Able to raise and bet depends on current asset of player.    

> - **Alert controller for Big raise or All-in**    
    For bigger raise or All-in, long-press on any of chip button.    
    Player can input the amout of asset or select All-in.    
    Even if player put wrong value of raise in input, the app adjust the result.    

> - **Game view of on-going play 2**    
    Player's raise value will be shown on the digit of left bottom of player cell.    
    Player's raise value should be bet by tapping on the Bet button.    
    If not, the player's raise value will not be add to pot.    
    Also, an alert will show up when the player try to switch player or tap the Win button.    

</details>


## Features

- Simple interface with three view-controllers, built with UIKit.
- Support for various iOS versions from iOS 13.4 to iOS 15.
- No external packages to install or add, during development.
- Long-press on chip button to pop up alert controller with text input for big raise or All-in.
- Protections for player mistakes with alert controller.
- Maximum 8 people playable with one device.


## Folder Structure

```
.
├── HomePokerTable.xcodeproj
├── HomePokerTable
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   ├── AppIcon.appiconset
│   │   ├── cards.imagest
│   │   ├── chip005.imagest
│   │   ├── chip010.imagest
│   │   ├── chip050.imagest
│   │   ├── chip100.imagest
│   │   └── icon.imageset
│   ├── Menu
│   ├── Models
│   ├── Play
│   └── Storyboards
│       └── Base.lproj
└── docs
    ├── assets
    │   ├── css
    │   ├── js
    │   ├── sass
    │   └── webfonts
    └── images
        └── screenshots
```


## Version History

- Plan to update continuously.
- latest update: v1.0.0

> - v1.0.0: Release on App Store, 18 June 2022.
> - start: Initial commit, 18 April 2022.


<!-- ## App Analysis -->


## What I Learned

#### From start to release

> - **Period**: 18 April 2022 - 17 June 2022 (60 days)
> - **Time Taken**: 70 hours (Design + Development + Release)

- Planning
    - How to decide minimum requirements for app.
    - How to decide the iOS deployment target.
    - How to decide which tools are right for current project environment.
    - How to build and optimize the time table.
    - How to meet the deadline for progress.

- Design
    - How to make AppIcon.
    - How to design with wireframe.
    - How to choose a color palette.
    - How to design an app.
    - How to use the Figma.

- Development
    - How to manage the project with `Git`.
    - How to manage the Github repository, using branch.
    - How to build UI with `UIKit` using `storyboard`.
    - How to deal with the `Auto layout` and constraints.
    - How to mix storyboard with programmatic implementation.
    - Power of `computed properties` and when to use them.
    - Better understanding of `MVC` pattern and how to implement it.
    - Better understanding of `Delegate` pattern and how to implement it.
    - Better understanding of `UIPickerView` and how to use it.
    - Better understanding of `UICollectionView` with `UICollectionViewLayout`.

- App Release & Marketing
    - How to make landing page for the app.
    - How to deal with the Privacy Policy.
    - How to upload app build to the App Store Connect.
    - How to fill the form of App Store Connect.
    - How to deal with App Review.

- etc.
    - Designing was the most difficult part, both in UI and code structure.
    - Found out that I am not good at color selection in designing. So, I got help from my friend.
    - It was difficult to maintain motivation with one-person production.
    - Apple App Store Review do not allow simulated gambling apps submitted by individual developers.
    - Not this app, but definitely have to try to develop and release a paid app or a Admob equipped app, in future.
    
    
<!-- - During my production, the Google was like the Jesus who is there for me when I am in trouble, and the Apple Developer Documentation was like the Holy Spirit who enpower me to do more things than I could. Lol. Thanks LORD! -->


## Future Work
- [ ] keep on refactoring
- [ ] add documentation
- [ ] support for iPadOS
- [ ] add unit test
- [ ] add ui test
- [ ] add sound effect
- [ ] add visual effect
- [ ] add editor mode
- [ ] add setting page
- [ ] build with swiftui


## License

The MIT License (MIT)

Copyright (c) 2022 Sanghun Park

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
