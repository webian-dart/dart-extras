
import 'package:dart_extras/dart_extras.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    group("Results should", () {
        test("be able to make new instances", (){
            Failed();
            Failure();
            FailureOf();
            ResultedInError("some error");
            ResultedInErrorOf();
            ResultedInErrorWith("value");
            Succeeded();
            SuccessOf("value");
        });
        
        test("be not successful, has not error, is emty and is pending when is an empty result", () {
            final result = Result.empty(isPending: true);
            expect(result.wasSuccessful, false);
            expect(result.error, "");
            expect(result.isEmpty, true);
            expect(result.isPending, true);
            final result2 = Result.empty(isPending: false);
            expect(result2.isPending, false);
        });
        
        test("be cloned properly", () {
            final errorResult = ResultedInError("some error");
            final cloneErrorResult = Result.clone(errorResult);
            expect(cloneErrorResult, isNot(errorResult));
            expect(cloneErrorResult.error, "some error");
            expect(cloneErrorResult.wasSuccessful, false);
            final success = Result.success();
            final cloneSuccess = Result.clone(success);
            expect(cloneSuccess, isNot(success));
            expect(cloneSuccess.wasSuccessful, true);
        });
    });
}
