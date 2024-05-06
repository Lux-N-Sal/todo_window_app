enum ButtonPadding {
  small,
  medium,
  large;

  double getPadding() {
    switch (this) {
      case ButtonPadding.small:
        return 5;
      case ButtonPadding.medium:
        return 10;
      case ButtonPadding.large:
        return 15;
    }
  }
}
