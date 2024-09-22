import 'package:flutter/material.dart';

class BaseWidgetContainer extends StatelessWidget {
  const BaseWidgetContainer({
    super.key,
    this.appBar,
    required this.body,
    this.canPop = true,
    this.onPopInvoked,
    this.resizeToAvoidBottomInset,
    this.scrollController,
    this.scrollPhysics,
    this.actvateScroll = false,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool? canPop;
  final Function(bool)? onPopInvoked;
  final bool? resizeToAvoidBottomInset;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final bool? actvateScroll;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop ?? true,
      onPopInvoked: onPopInvoked ?? (bool isPop) {
        if (isPop) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: appBar,
        body: actvateScroll ?? false
            ? SingleChildScrollView(
                controller: scrollController,
                physics: scrollPhysics ?? const NeverScrollableScrollPhysics(),
                child: body,
              )
            : body,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: Colors.white,
      ),
    );
  }
}