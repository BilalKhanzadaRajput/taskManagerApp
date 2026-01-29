import 'package:injectable/injectable.dart';
import '../../models/task_model.dart';
import '../../utils/local_storage_helper.dart';

/// Data source for local storage operations
@Injectable()
class LocalStorageDataSource {
  Future<void> saveTasks(List<TaskModel> tasks) async {
    await LocalStorageHelper.saveTasks(tasks);
  }

  Future<List<TaskModel>?> getCachedTasks() async {
    return await LocalStorageHelper.getCachedTasks();
  }
}
