import 'package:appwrite/appwrite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../common.dart';
import '../auth/provider.dart';

part 'provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  bool build() => false;

  Future<String> updateProfileImage() async {
    try {
      state = true;
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        state = false;
        return '';
      }

      final user = ref.read(userStateProvider);
      if (user == null) {
        state = false;
        return '';
      }
      final String url = await ref.read(uploadFileProvider(image.path).future);
      final document = await ApiClient.database.updateDocument(
        databaseId: Env.appwriteDatabaseId,
        collectionId: Env.userCollectionId,
        documentId: user.documentId,
        data: {
          "image": url,
        },
      );
      ApiClient.account.updatePrefs(prefs: document.data);
      state = false;
      return url.toUrl;
    } on AppwriteException catch (e) {
      logger.e(e);
      showErrorNotice("Error", e.message ?? "Something went wrong");
    } catch (e) {
      logger.e(e);
    }
    state = false;
    return '';
  }
}
