import 'package:flutter/cupertino.dart';
import '../../domain/loading_status/loading_status.dart';

class LoadingWidget extends StatelessWidget {
  final LoadingStatus status;
  final Widget? loadingWidget;
  final Widget child;
  final Widget? failureWidget;
  final void Function()? onErrorAction;

  const LoadingWidget({
    super.key,
    required this.status,
    required this.child,
    this.loadingWidget,
    this.failureWidget,
    this.onErrorAction,
  });

  @override
  Widget build(BuildContext context) {
    return status.map(
      initial: (_) => Container(),
      loading: (_) => loadingWidget ?? const Center(child: CupertinoActivityIndicator()),
      success: (_) => child,
      failure: (f) =>
          failureWidget ??
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                f.message,
                textAlign: TextAlign.center,
              ),
            ),
          ),
    );
  }
}
