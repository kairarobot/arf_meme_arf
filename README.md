# Make Meme

### iOS, Swift

<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/mit-license-brightgreen.svg" alt="mit license"></a>

A simple meme generator consisting of two views (main and detail). The application follows the framework of MVC (model view controller).

##### Model: 
* Meme.swift

##### Views: 
* MemeView.swift
* ResultsView.swift
* MemeView.xib
* ResultsVie.xib
* Main.storyboard

##### Controllers:
* MemeViewController.swift
* ResultsViewController.swift

The user is first presented the view of `MemeView.swift` which is incorporated within the navigation controller of `Main.storyboard`. User input is stored into model `Meme.swift` via the controller `MemeViewController.swift`. Once the user is satisfied with the content,the meme is generated and the next view appears `ResultsView.swift`. From the controller `ResultsViewController.swift` the user can user gesture recognizers to change the size(pinch) of the text or move(pan) the text around.

<div align="middle">
<img src="https://github.com/kairaygun/make_meme/blob/master/images/makeme_preview1.png" width="150px">
<img src="https://github.com/kairaygun/make_meme/blob/master/images/makeme_preview2.png" width="150px">
</div>
