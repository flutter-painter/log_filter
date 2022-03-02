import 'dart:io';

void main(List<String> arguments) {
  final filteredLines = filterLines();
  writeFile(filteredLines.join());
}

List<String> filterLines() {
  File file = File('./assets/fake_log.txt');
  List<String> lines = file.readAsLinesSync();
  final filteredLines = <String>[];

  for (final l in lines) {
    if (l.contains('record : Operation')) {
      filteredLines.add(l);
    }
  }
  return filteredLines;
}

writeFile(String string) {
  final file = File('log_filtered.txt');

  file.writeAsStringSync(string, mode: FileMode.append);
}

// TODO use the regex
String filter(String rawString) =>
    rawString.replaceAll(RegExp(r"[^a-zA-Z]"), "");
