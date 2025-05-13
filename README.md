# BetterFileImporter

## What does this Package do?
Simple! It adds a new view modifier, very similar to .fileImporter, that lets you pick files.
The cool part? It even works with enterprise certificates, like the ones from [WSF](https://wsfteam.xyz).

And it keeps things super straightforward:
You get an array of URLs. That’s it.
No more result.get() nonsense just to access your files!

## Installation
### Using Xcode's built-in Package Manager 
Go to File > Add Package Dependencies...

then, in the Search-Bar enter: 

```https://github.com/timi2506/BetterFileImporter.git``` 

and press "Add Package" and make sure to link it to your target.
<img width="362" alt="Screenshot 2025-03-04 at 11 16 34" src="https://github.com/user-attachments/assets/8b3672b9-9345-4d6b-9b0d-26d03bd189c7" />

## Usage
### Examples
**.betterFileImporter** *View Modifier*
```swift
some View {}

        .betterFileImporter(isPresented: Binding<Bool>, allowedContentTypes: [UTType], allowsMultipleSelection: Bool?, presentationType: BetterFileImporterPresentationType?, onDocumentsPicked: @escaping ([URL]) -> Void)
```
- **isPresented** *Required*
    - Binding Bool that is used to hide/show the FilePicker
- **allowedContentTypes** *Required*
    - The File Types the user is allowed to pick
- **allowsMultipleSelection** *Optional*
    - Defines Whether the user is allowed to pick multiple Files - defaults to false
- **presentationType** *Optional*
    - The Presentation Type the File Picker should be presented in - defaults to sheet
- **onDocumentsPicked** *Required*
    - The Action to run once the user has finished picking Files, passes in Array of URLs

***Optional*** means this value can be safely omitted 

***Required*** means you NEED to define this value and it can't be nil

  
**BetterFileImporterPresentationType** *Enum*
- The BetterFileImporterPresentationType Enum has 2 types:
- **fullscreen** 
    - Uses .fullscreenCover to display the File Picker in Fullscreen
- **sheet**
    - Uses .sheet to display the File Picker in a Semi-Fullscreen Sheet

  
## Issues or Questions

If you have any issues or questions feel free to open an [issue](https://github.com/timi2506/BottomDrawer/issues/new/choose) or contact me on [Twitter](https://x.com/timi2506)

## Requirements
- iOS 15+


## Credits 
[@khcrysalis](https://github.com/khcrysalis/) and their project [Feather](https://github.com/khcrysalis/Feather)
