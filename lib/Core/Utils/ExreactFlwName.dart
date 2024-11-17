String extractFilename(String url) {
  // Parse the URL
  final uri = Uri.parse(url);

  // Extract the path from the URL
  final path = uri.path;

  // Split the path by '/' and get the last segment
  final segments = path.split('/');
  return segments.isNotEmpty ? segments.last : '';
}