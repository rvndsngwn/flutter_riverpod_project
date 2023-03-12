import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils_widget/utils_widget.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.v('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    logger.v("Dispose ${provider.name ?? provider.runtimeType}");
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e(
      "${provider.name ?? provider.runtimeType}",
      error.toString(),
      stackTrace,
    );
  }

  // @override
  // void didAddProvider(
  //   ProviderBase<Object?> provider,
  //   Object? value,
  //   ProviderContainer container,
  // ) {
  //   logger.v("Add ${provider.name ?? provider.runtimeType}");
  // }
}
