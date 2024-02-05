enum Sizep {
  medium, //normal size text
  bold, //only bold text
  boldMedium, //bold with medium
  boldLarge, //bold with large
  extraLarge //extra large
}

enum Alignp {
  left, //ESC_ALIGN_LEFT
  center, //ESC_ALIGN_CENTER
  right, //ESC_ALIGN_RIGHT
}

extension PrintSize on Sizep {
  int get val {
    switch (this) {
      case Sizep.medium:
        return 0;
      case Sizep.bold:
        return 1;
      case Sizep.boldMedium:
        return 2;
      case Sizep.boldLarge:
        return 3;
      case Sizep.extraLarge:
        return 4;
      default:
        return 0;
    }
  }
}

extension PrintAlign on Alignp {
  int get val {
    switch (this) {
      case Alignp.left:
        return 0;
      case Alignp.center:
        return 1;
      case Alignp.right:
        return 2;
      default:
        return 0;
    }
  }
}
