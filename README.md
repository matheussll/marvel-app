# Marvel-App

An iOS application that show all Marvel characters and its details.


### Libraries
- Alamofire
- Kingfisher
- GSKStretchyHeaderView


### Architecture

This project uses the Model-View-ViewModel-Coordinator (MVVM-C) architecture.


### Tests

This project has 36% code coverage.


### Initial Setup

In order to properly run this project, first, we need to open the Info.plist file, that is inside `/Marvel/Resources` folder.

Once opened, we must edit two fields into the plist:
`MarvelPublicKey` and `MarvelPrivateKey`
You can get both [HERE](https://developer.marvel.com/)

After editing the Info.plist, we need to install the project's dependencies, and, for this, we need Carthage (you can skip this step if you already have it installed):

```sh
$ brew install carthage
```

After installing Carthage, we just need to run:

```sh
$ carthage update --platform iOS
```

And that's all, the project should build just fine now!