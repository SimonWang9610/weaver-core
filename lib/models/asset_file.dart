class AssetFile {
  final String id;
  final String name;
  final String path;
  final String type;
  final int size;
  final List<int> bytes;

  AssetFile({
    required this.id,
    required this.name,
    required this.path,
    required this.type,
    required this.size,
    required this.bytes,
  });
}
