/// String 类的扩展，用于处理图片路径
extension ImageExt on String {
  /// 获取 png 图片的路径
  ///
  /// 返回值: '$this.png'
  String get png {
    return '$this.png';
  }

  /// 获取 jpg 图片的路径
  ///
  /// 返回值: '$this.jpg'
  String get jpg {
    return '$this.jpg';
  }

  /// 获取 webP 图片的路径
  ///
  /// 返回值: '$this.webP'
  String get webP {
    return '$this.webP';
  }

  /// 获取 svg 图片的路径
  ///
  /// 返回值: '$this.svg'
  String get svg {
    return '$this.svg';
  }
}
