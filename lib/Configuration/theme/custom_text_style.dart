import 'package:lyriscope/Configuration/theme/theme_helper.dart';
import 'package:lyriscope/Core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w400,
      );
  // Headline text style
  static get headlineSmallRegular => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w400,
      );
}

extension on TextStyle {
  // ignore: unused_element
  TextStyle get breeSerif {

    
    return copyWith(
      fontFamily: 'BreeSerif',
    );
  }
}
