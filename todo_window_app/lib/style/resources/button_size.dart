enum ButtonSize {
  tiny20,
  small,
  small40,
  small50,
  medium,
  medium70,
  large,
  large110,
  veryLarge,
  superLarge,
  ultraLarge,
  infinity;

  double getSize() {
    switch (this) {
      case ButtonSize.tiny20:
        return 20;
      case ButtonSize.small:
        return 30;
      case ButtonSize.small40:
        return 40;
      case ButtonSize.small50:
        return 50;
      case ButtonSize.medium:
        return 60;
      case ButtonSize.medium70:
        return 70;
      case ButtonSize.large:
        return 100;
      case ButtonSize.large110:
        return 110;
      case ButtonSize.veryLarge:
        return 130;
      case ButtonSize.superLarge:
        return 250;
      case ButtonSize.ultraLarge:
        return 300;
      case ButtonSize.infinity:
        return double.infinity;
    }
  }
}
