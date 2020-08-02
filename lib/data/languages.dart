class Language {
  final String code;
  final String title;

  Language({
    this.code,
    this.title,
  });
}

final List<Language> languages = [
  Language(
    code: 'mn',
    title: 'Mongolia (MN)',
  ),
  Language(
    code: 'en',
    title: 'English (US)',
  ),
];
