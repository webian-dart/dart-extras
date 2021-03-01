import '../results/task_result.dart';
import './simple_task.dart';

abstract class AsyncTask<T extends TaskResult> extends SimpleTask<Future<T>> {
  Future<T> execute();
}
