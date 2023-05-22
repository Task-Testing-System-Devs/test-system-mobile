enum ProgrammingLanguage {
  cpp('C++', '.cpp', '52'),
  python('Python 3', '.py', '23');

  final String name;
  final String fileExtension;
  final String value;

  const ProgrammingLanguage(this.name, this.fileExtension, this.value);
}
