class PngAssetGraphic {
  final String path;
  final String name;

  const PngAssetGraphic({
    required this.name,
  })  : assert(name.length > 0),
        path = 'assets/png/$name.png';
}

class SvgAssetGraphic {
  final String path;

  const SvgAssetGraphic(String name)
      : assert(name.length > 0),
        path = 'assets/svgs/$name.svg';
}
