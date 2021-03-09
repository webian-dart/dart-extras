import 'package:dart_extras/src/list_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("List Extensions Should", () {
    group("Give us a list with no nulls when", () {
      List<String?>? list;

      test("the list is not initialized and is still null", () {
        expect(list.noNulls().length, 0);
      });

      test("it is a empty list", () {
        list = <String?>[];
        expect(list.noNulls().length, 0);
      });

      test("it is a list with nulls", () {
        list = <String?>[null, null, null];
        expect(list.noNulls().length, 0);
      });

      test("it has some nulls but we get none of those back", () {
        list = <String?>[null, "hello"];
        expect(list.noNulls().length, 1);

        expect(list.noNulls().first, "hello");
      });
    });
  });
}
