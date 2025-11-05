// ignore_for_file: avoid_shadowing_type_parameters, avoid_types_as_parameter_names
// Ignore this class – placeholder to avoid dependency on `bloc`-package

abstract class Bloc<Event, State> {
  State state;

  Bloc(this.state);

  void on<Event>(void Function(Event event, State emit) function) {}
}

abstract class BuildContext {
  T read<T>();
  T watch<T>();
  R select<T, R>(R Function(T value) selector);
}

typedef Widget = void;
typedef Key = void;
typedef BlocWidgetBuilder<S> = void Function(BuildContext context, S state);
typedef BlocWidgetSelector<S, T> = T Function(S state);
typedef BlocBuilderCondition<S> = bool Function(S previous, S current);


class BlocBuilder<Bloc, State> {
  final Key? key;
  final BlocWidgetBuilder<State> builder;
  final BlocBuilderCondition<State>? buildWhen;
  final Bloc? bloc;

  const BlocBuilder({
    this.key,
    required this.builder,
    this.buildWhen,
    this.bloc,
  });
}

class BlocListener<Bloc, State> {
  final Key? key;
  final BlocWidgetBuilder<State> listener;
  final BlocBuilderCondition<State>? listenWhen;
  final Bloc? bloc;
  final dynamic child;

  const BlocListener({
    this.key,
    required this.listener,
    this.listenWhen,
    this.child,
    this.bloc,
  });
}

class BlocConsumer<Bloc, State> {
  final Key? key;
  final BlocWidgetBuilder<State> builder;
  final BlocWidgetBuilder<State> listener;
  final BlocBuilderCondition<State>? buildWhen;
  final BlocBuilderCondition<State>? listenWhen;
  final Bloc? bloc;

  const BlocConsumer({
    this.key,
    required this.builder,
    required this.listener,
    this.buildWhen,
    this.listenWhen,
    this.bloc,
  });
}

class BlocSelector<Bloc, State, Target> {
  final Key? key;
  final BlocWidgetSelector<State, Target> selector;
  final BlocWidgetBuilder<Target> builder;
  final Bloc? bloc;

  const BlocSelector({
    this.key,
    required this.selector,
    required this.builder,
    this.bloc,
  });
}

class BlocProvider<T> {
  final Widget? child;
  final bool lazy;
  // ignore: unused_field
  final T Function(BuildContext context)? _create;
  // ignore: unused_field
  final T? _value;

  const BlocProvider({
    required T Function(BuildContext context) create,
    Key? key,
    this.child,
    this.lazy = true,
  })  : _create = create,
        _value = null;

  const BlocProvider.value({
    required T value,
    Key? key,
    this.child,
  })  : _value = value,
        _create = null,
        lazy = true;
}
