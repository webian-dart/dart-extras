import 'dart:isolate';

class ResourceResolver {
  static Future<Uri> resolveUri(String path) async {
    final uri = Uri.parse(path);
    if (uri.scheme == 'package') {
      return await Isolate.resolvePackageUri(uri).then((resolvedUri) {
        if (resolvedUri == null) {
          throw ArgumentError.value(uri, 'uri', 'Unknown package');
        }
        return resolvedUri;
      });
    }
    return Future<Uri>.value(Uri.base.resolveUri(uri));
  }
}
