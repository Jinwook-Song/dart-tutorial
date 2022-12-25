# Dart

| 프로젝트 기간 | 22.11.17 ~                                    |
| ------------- | --------------------------------------------- |
| 프로젝트 목적 | Learn dart for flutter                        |
| Github        | https://github.com/Jinwook-Song/dart-tutorial |

---

```dart
Dart
Dart는 모든 플랫폼에서 빠른 앱을 위한 클라이언트 최적화 언어입니다.
1. UI 최적화용
(사용자 인터페이스 생성 요구에 특화된 프로그래밍 언어로 개발)
2. 생산적인 개발
(핫 리로드를 사용하여 실행 중인 앱에서 즉시 결과 확인)
3. 모든 플랫폼에서 빠름
(모바일, 데스크톱 및 백엔드용 ARM 및 x64 머신 코드로 컴파일합니다. 또는 웹용 JavaScript로 컴파일)
https://dart.dev/

Flutter 프레임워크는 인기 있는 다중 플랫폼 UI 툴킷으로 Dart 플랫폼으로 구동되며 iOS, Android, macOS, Windows, Linux 및 웹에서 실행되는 UI 경험을 빌드하기 위한 도구 및 UI 라이브러리를 제공합니다.
```

```dart
Dart의 컴파일러 기술을 사용하면 다양한 방식으로 코드를 실행할 수 있습니다.

기본 플랫폼: 모바일 및 데스크톱 장치를 대상으로 하는 앱의 경우 Dart에는 JIT(Just-In-Time) 컴파일 기능이 있는 Dart VM과 기계 코드 생성을 위한 AOT(Ahead-of-Time) 컴파일러가 모두 포함되어 있습니다.

웹 플랫폼: 웹을 대상으로 하는 앱의 경우 Dart는 개발 또는 프로덕션 목적으로 컴파일할 수 있습니다. 웹 컴파일러는 Dart를 JavaScript로 변환합니다.

https://dart.dev/overview
```

---

### Variables

- [x] var

  ```dart
  void main() {
    var name = 'jw';
    String name_2 = 'nico';

    // 함수나 메소드 내부에 지역변수를 선언할 때는 var를 사용하고
    // class에서 변수나 property를 선언할 때는 타입을 지정해준다.
  }
  ```

- [x] dynamic
  ```dart
  void main() {
    dynamic name;
    if (name is String) {
      // String method
    }
    if (name is int) {
      // int method
    }
  }
  ```
- [x] null safety

  ```dart
  void main() {
    // null safety는 개발자가 null 값을 참조할 수 없게 하는 것
    // String뒤에 ?를 붙여줌으로서 name이 String 또는 null이 될 수 있다고 명시해준 것
    // 기본적으로 모든 변수는 non-nullable(null이 될 수 없음)

    String? name; // could be null
    name = null;

    // check 1
    if (name != null) {
      name.isNotEmpty;
    }
    // check 2
    name?.isNotEmpty;
  }
  ```

- [x] final
  ```dart
  void main() {
    // javascript const
    final name = 'jw';
  }
  ```
- [x] late

  ```dart
  void main() {
    // late는 final 혹은 var 앞에 붙이는 수식어
    // late는 초기 데이터 없이 선언 가능
    // late 변수를 만들고, API에 요청을 보낸 뒤에 API에서 값을 보내주면
    // 그 응답값을 late변수에 넣어 사용
    late final name;
    name = 'jw';

    // error
    name = 'nico';
  }
  ```

- [x] const

  ```dart
  // const는 compoile-time constant를 만들어 준다.
  // const와 fianl의 가장 큰 차이점은 컴파일이 되는 시점에 그 값을 알 수 있는지 없는지의 차이다.

  // 예를 들어 fetchApi를 하는 변수는 컴파일하는 시점에 그 변수를 알 수가 없다.
  ```

Recap

```
final: 값을 재할당하지 못하는 변수를 만듦
dynamic type: 어떤 타입의 데이터가 들어올 지 모를 때 사용함
const: 컴파일 할 때 값을 알고 있는 변수
final: 런타임 중에 만들어질 수 있는 변수
late: final, var, String같은 것들 앞에 써줄 수 있는 수식어로서 어떤 데이터가 올 지 모를 때 사용한다.
```

---

### Built-in types

- [x] Basic type
  ```dart
  void main() {
    // 아래 타입을 포함한 거의 대부분의 타입들이 객체로 이루어져 있다. (함수도 객체)
    String name = 'nico';
    bool alive = true;
    int age = 12;
    double money = 13.56;
  }
  ```
- [x] List

  ```dart
  void main() {
    var numbers = [1, 2, 3, 4, 5, 6, 7];
    List<int> numbers_2 = [1, 2, 3, 4, 5, 6, 7];
    numbers_2.add(13);

    // collection if
    var giveNumber = true;
    var numbers_3 = [
      1,
      2,
      3,
      if (giveNumber) 4,
    ];

    //  collection for
    var newNumber = [for (var num in numbers) '✅ $num'];
    print(newNumber);
  }
  ```

- [x] Map
  ```dart
  void main() {
    var gifts = {
      // Key: Value
      'first': 'partridge',
      'second': 'turtledoves',
      'fifth': 'golden rings'
    };
    // Map 생성자를 사용하여 동일한 객체를 만들 수 있습니다.
    var gifts2 = Map();
    gifts2['first'] = 'partridge';
    gifts2['second'] = 'turtledoves';
    gifts2['fifth'] = 'golden rings';
  }
  ```
- [x] Set
  ```dart
  void main() {
    // sets => items are always unique
    // lists => items are not always unique
  }
  ```

---

### Functions

- [x] Define
  ```dart
  void main() {
    plus(13, 22);
    sayHello('jw');
  }

  num plus(num a, num b) => a + b;

  String sayHello(String name) {
    return 'hello $name';
  }
  ```
- [x] named parameter
  ```dart
  void main() {
    print(sayHello(
      name: "jw",
      age: 10,
    ));
  }

  String sayHello({
    required String name,
    required int age,
    String country = "Korea",
  }) {
    return "${name} / ${age} / ${country}";
  }
  ```
- [x] optional positional parameter
  ```dart
  void main() {
    print(sayHello(
      "jw",
      10,
    ));
  }

  String sayHello(String name, int age, [String? country]) {
    return 'Hello ${name}, You are ${age} from the ${country}';
  }
  ```
- [x] QQ operator
  ```dart
  void main() {
    print(capitalizeName('jw'));

    String? name;
    name ??= 'nico';
    print(name);
  }

  String capitalizeName(String? name) => name?.toUpperCase() ?? "";
  ```
- [x] typedef
  ```dart
  void main() {
    print(reverseList([1, 2, 3, 4]));
  }

  typedef ListOfInts = List<int>;

  ListOfInts reverseList(ListOfInts list) {
    var reversed = list.reversed;
    return reversed.toList();
  }
  ```
