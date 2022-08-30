import 'dart:async';

import 'package:flutter/material.dart';

class StreamListener<T> extends StatefulWidget {
  final Widget child;
  final Stream<T> stream;

  final void Function(T)? onData;
  final Function? onError;
  final void Function()? onDone;

  const StreamListener({
    super.key,
    required this.stream,
    required this.child,
    this.onData,
    this.onError,
    this.onDone,
  });

  @override
  State<StatefulWidget> createState() {
    return _StreamListenerState();
  }
}

class _StreamListenerState extends State<StreamListener> {
  late StreamSubscription _streamSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _streamSubscription = widget.stream
        .listen(widget.onData, onDone: widget.onDone, onError: widget.onError);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
