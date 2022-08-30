// E : to be the type of EVENT/ACTION that is passed to the bloc
// S : to be the type of STATE that the bloc "emits".
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spice_blog/common/observable/observable.dart';

// we want a function signature which allows us to create onEventHandlers

typedef EventHandler<E> = FutureOr<void> Function(E);

abstract class Bloc<Event, State> {
  late final Observable<State> _stateObservable;
  late final Observable<Event> _eventObservable = Observable();

  final List<_Handler<Event>> _handlers = [];

  on<E extends Event>(EventHandler<E> handler) {
    // Ensures that only one event handler exists at any given moment for an Event E
    if (_handlers.any((e) => e.type == E)) {
      throw 'Handler for event $E already exists';
    }
    _handlers.add(_Handler(type: E, isType: (dynamic e) => e is E));

    // Filters out events that are of the type E and listens to them
    _eventObservable.obs$.where((event) => event is E).listen((event) {
      handler(event as E);
    });
  }

  Bloc(State initialState) {
    _stateObservable = Observable.seeded(initialState);
  }

  ValueStream<State> get stream => _stateObservable.obs$;

  State get state => stream.value;

  void add(Event event) {
    _eventObservable.addValue(event);
  }

  @protected
  void emit(State state) {
    _stateObservable.addValue(state);
  }

  @mustCallSuper
  void dispose() {
    _stateObservable.dispose();
    _eventObservable.dispose();
  }
}

/// Helper Class to assert type of event handlers passed
class _Handler<T> {
  final Type type;
  final bool Function(dynamic) isType;

  _Handler({
    required this.type,
    required this.isType,
  });
}
