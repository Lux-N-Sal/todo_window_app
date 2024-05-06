enum IconSize {
  small,
  medium,
  large;

  double getSize() {
    switch (this) {
      case IconSize.small:
        return 16;
      case IconSize.medium:
        return 20;
      case IconSize.large:
        return 24;
    }
  }
}
