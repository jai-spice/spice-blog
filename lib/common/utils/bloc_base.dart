// E : to be the type of EVENT/ACTION that is passed to the bloc
// S : to be the type of STATE that the bloc "emits".
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spice_blog/common/observable/observable.dart';

// we want a function signature which allows us to create onEventHandlers

typedef EventHandler<E> = FutureOr<void> Function(E);

/// [Bloc] class facilitates us with State and Event Observables to make reactive UI
/// [on] method is used to create EventHandlers.
/// UI ---sends event --> Event sink ----> Event Handler Subscription --- invokes EventHandler()--->
/// emit(NEW_STATE) --- UI listens to state stream ---> UI refreshes.
abstract class Bloc<Event, State> {
  late final Observable<State> _stateObservable;
  late final Observable<Event> _eventObservable = Observable();

  final List<Type> _handlerTypes = [];

  @protected
  on<E extends Event>(EventHandler<E> handler) {
    // Ensures that only one event handler exists at any given moment for an Event E
    if (_handlerTypes.any((type) => type == E)) {
      throw 'Handler for event $E already exists';
    }
    _handlerTypes.add(E);

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

  @protected
  void emitDone() {
    _stateObservable.complete();
  }

  @protected
  void emitError(Object error, [StackTrace? stackTrace]) {
    _stateObservable.addError(error, stackTrace);
  }

  @mustCallSuper
  void dispose() {
    _stateObservable.dispose();
    _eventObservable.dispose();
  }
}
