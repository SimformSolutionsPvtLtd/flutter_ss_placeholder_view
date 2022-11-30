# SSPlaceholderView

[![Build](https://github.com/SimformSolutionsPvtLtd/flutter_showcaseview/workflows/Build/badge.svg?branch=master)](https://github.com/SimformSolutionsPvtLtd/flutter_showcaseview/actions) [![ssplaceholderview](https://img.shields.io/pub/v/showcaseview?label=showcaseview)](https://pub.dev/packages/showcaseview)

A Flutter package allows you to add placeholder content while loading or empty items.

## Preview

<img src="https://github.com/SimformSolutionsPvtLtd/flutter_ss_placeholder_view/blob/master/preview/placeholderview.gif" width="400" height="711">

## Installing

1. Add dependencies to `pubspec.yaml`

   Get the latest version in the 'Installing' tab
   on [pub.dev](https://pub.dev/packages/calendar_view/install)

    ```yaml
    dependencies:
        ss_placeholder_view: <latest-version>
    ```

2. Run pub get.

   ```shell
   flutter pub get
   ```

3. Import package.

    ```dart
    import 'package:ss_placeholder_view/ssplaceholderview.dart';
    ```

## Implementation

1. SSPlaceholder.

    ```dart
    SSPlaceholder(
          state: placeholderState,
          child: Widget,
          showPlaceHolder: true,
          placeHolderImageConfig: PlaceHolderImageConfig(
            extraPadding: const EdgeInsets.only(bottom: 10),
            placeholderImage: placeholderImage,
            placeholderWidget: placeholderWidget,
            animationName: 'walk',
          ),
          loadingConfig: LoadingConfig(
            loadingTitle: 'Loading Title',
            loadingSubtitle: 'Loading subtitle',
            loadingWidgetName: LoaderName.hourGlass,
            loadingWidget: LoadingWidget,
            loadingColor: const Color(0xffee5366),
            loadingSize: 40,
            isLoadingOnTop: false,
          ),
          emptyErrorConfig: EmptyErrorConfig(
            emptyTitle: 'No Data Found',
            emptySubtitle: 'Try again..!',
            errorTitle: 'Error...',
            errorSubtitle:
                'An error occurred while loading data. Please retry.',
          ),
          buttonConfig: ButtonConfig(
            buttonColor: const Color(0xffee5366),
            buttonText: 'Refresh',
            buttonWidth: 120,
            buttonHeight: 64,
            hideButton: false,
            buttonTextStyle: const TextStyle(
              fontSize: 18,
              fontFamily: 'RobotoMono',
              color: Colors.white,
            ),
          ),
          titleTextStyle: const TextStyle(
            fontSize: 25,
            fontFamily: 'BebasNeue',
          ),
          subTitleTextStyle: const TextStyle(
            fontSize: 20,
            fontFamily: 'BebasNeue',
          ),                    
          onButtonClick: VoidCallback,
    )
    ```

2. For loader change :
    - Use SpinKit loader name: e.g `LoaderName.hourGlass`
    - LoaderName is Enum in which all SpinKit Loader name added.

## How to use

Check out the **example** app in the [example](example) directory or the 'Example' tab on
pub.dartlang.org for a more complete example.

Methods defined by `SSPlaceholder` class:
| Config class | Name | Parameters | Description | Default Value |
|--------------|------|------------|-------------| --------------|
| `PlaceHolderState` |
| | state | PlaceHolder state (idle,loading,success,error) | none |
| `PlaceHolderImageConfig` |
|| placeholderImage | String | placeholder Image | none |
|| placeholderWidget | Widget | custom placeholder | none |
|| darkPlaceholderImage | String | dark placeholder Image | none |
|| extraPadding | EdgeInsets | dark placeholder Image | none |
|| animationName | String | if flare animation used then animation name | none |
| `ButtonConfig` |
|| buttonText | String | refresh button text | none |
|| buttonWidth | double | refresh button width | 120 |
|| buttonHeight | double | refresh button width | 64 |
|| buttonColor | Color | refresh button color | Colors.blueGrey |
|| buttonTextColor | Color | refresh button text color | Colors.white |
|| hideButton | bool | refresh button should visible or not | false |
|| buttonTextStyle | TextStyle | button text style | false |
| `LoadingConfig` |
|| loadingTitle | String | loading title when state is loading | Hold On! |
|| loadingSubtitle | String | loading sub title when state is loading | This could take a while to load |
|| loadingWidgetName | LoaderName | loadingWidgetName based on LoaderName enum | LoaderName.threeBounce |
|| loadingWidget | Widget | loadingWidget e.g.CircularProgressIndicator() | none |
|| loadingColor | Color | loadingColor for SpinKit indicators | none |
|| loadingSize | double | loadingSize for SpinKit indicators | 32 |
|| isLoadingOnTop | bool | loadingWidget is on top of title or below title | false |
| `ErrorConfig` |
|| errorTitle | String | error title when state is error | Oops |
|| errorSubtitle | String | error sub title when state is error | Something went wrong! |
|| emptyTitle | String | empty title when state is success | Unavailable |
|| emptySubtitle | String | empty sub title when state is success | No Data Found|
| `common` |
|| child | Widget | Replace PlaceHolder with your widget | none |
|| showPlaceHolder | bool | PlaceHolder visibility | none |
|| titleTextStyle | TextStyle | Title textStyle | TextStyle(fontSize: 20, letterSpacing: 0.4, fontWeight: FontWeight.bold) |
|| subTitleTextStyle | TextStyle | Subtitle textStyle | TextStyle(fontSize: 14, letterSpacing: 0.4) |
|| onButtonClick | VoidCallback | On click of button | none ||

## Other Library used:

* __[spinkit](https://pub.dev/packages/flutter_spinkit)__
* __[svg](https://pub.dev/packages/flutter_svg)__

## Awesome Mobile Libraries
- Check out our other available [awesome mobile libraries](https://github.com/SimformSolutionsPvtLtd/Awesome-Mobile-Libraries)

## License

```text
MIT License

Copyright (c) 2021 Simform Solutions

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
```