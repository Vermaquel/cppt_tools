import 'package:hooks_riverpod/hooks_riverpod.dart';

final errorCpptProvider =
    StateNotifierProvider<ErrorCpptNotifier, String>((ref) {
  return ErrorCpptNotifier();
});

class ErrorCpptNotifier extends StateNotifier<String> {
  ErrorCpptNotifier() : super("");

  void update(String msg) {
    state = msg;
  }
}
