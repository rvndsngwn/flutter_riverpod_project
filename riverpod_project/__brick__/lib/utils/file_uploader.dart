import 'package:appwrite/appwrite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';

import '../common.dart';

part 'file_uploader.g.dart';

@riverpod
Future<String> uploadFile(UploadFileRef ref, path) async {
  try {
    final file = await ApiClient.storage.createFile(
      bucketId: Env.storageBucketId,
      file: InputFile.fromPath(path: path),
      fileId: ID.unique(),
    );
    return file.$id;
  } catch (e) {
    logger.e(e);
    return '';
  }
}

extension AppwriteIdToUrl on String {
  String get toUrl =>
      '${Env.appwriteEndpoint}/storage/buckets/${Env.storageBucketId}/files/$this/view?project=${Env.appwriteProjectId}';
}
