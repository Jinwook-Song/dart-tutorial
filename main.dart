enum WordProperties { term, definition }

typedef Word = Map<WordProperties, String>;

class WordDictionary {
  List<Word> wordDictionary = [];

  void add({
    required String term,
    required String definition,
  }) {
    if (get(term: term) != null) return;
    final Word word = {
      WordProperties.term: term,
      WordProperties.definition: definition
    };
    wordDictionary.add(word);
    return;
  }

  Word? get({required String term}) {
    try {
      return wordDictionary.firstWhere(
        (word) => word[WordProperties.term] == term,
      );
    } catch (e) {
      return null;
    }
  }

  void delete({required String term}) {
    wordDictionary.removeWhere((word) => word[WordProperties.term] == term);
    return;
  }

  void update({
    required String term,
    required String definition,
  }) {
    final word = get(term: term);
    if (word != null) {
      word[WordProperties.definition] = definition;
    }
    return;
  }

  void showAll() {
    wordDictionary.forEach((word) {
      print(word[WordProperties.term]);
    });
  }

  int count() {
    return wordDictionary.length;
  }

  void upsert({
    required String term,
    required String definition,
  }) {
    var word = get(term: term);
    if (word != null) {
      update(term: term, definition: definition);
    } else {
      add(term: term, definition: definition);
    }
  }

  bool exists({required String term}) {
    final index =
        wordDictionary.indexWhere((word) => word[WordProperties.term] == term);

    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  void bulkAdd({required List<Map<WordProperties, String>> words}) {
    words.forEach((word) {
      add(
        term: word[WordProperties.term]!,
        definition: word[WordProperties.term]!,
      );
    });
    return;
  }

  void bulkDelete({required List<String> words}) {
    words.forEach((word) {
      delete(term: word);
    });

    return;
  }
}

void main() {
  final dictionary = WordDictionary();
  dictionary.add(term: 'jinwook', definition: 'song');

  dictionary.bulkAdd(words: [
    {WordProperties.term: "김치", WordProperties.definition: "대박이네~"},
    {WordProperties.term: "아파트", WordProperties.definition: "비싸네~"}
  ]);

  dictionary.delete(term: '김치');

  dictionary.update(term: '아파트', definition: '싸네~');

  dictionary.bulkDelete(words: ['jinwook']);

  dictionary.upsert(term: 'nico', definition: 'sexy');
  dictionary.upsert(term: 'nico', definition: 'nice');

  print(dictionary.count());

  print(dictionary.wordDictionary);
}
