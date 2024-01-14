/// Ignore this class – placeholder to avoid dependency on `bloc`-package
abstract class Bloc<Event, State> {
  State state;

  Bloc(this.state);

  void on<Event>(void Function(Event event, State emit)) {}
}

typedef BuildContext = void;
typedef Key = void;
typedef BlocWidgetBuilder<S> = void Function(BuildContext context, S state);
typedef BlocWidgetSelector<S, T> = T Function(S state);
typedef BlocBuilderCondition<S> = bool Function(S previous, S current);

class BlocBuilder<Bloc, State> {
  final Key? key;
  final BlocWidgetBuilder<State> builder;
  final BlocBuilderCondition<State>? buildWhen;

  const BlocBuilder({
    this.key,
    required this.builder,
    this.buildWhen,
  });
}

class BlocListener<Bloc, State> {
  final Key? key;
  final BlocWidgetBuilder<State> listener;
  final BlocBuilderCondition<State>? listenWhen;
  final dynamic child;

  const BlocListener({
    this.key,
    required this.listener,
    this.listenWhen,
    this.child,
  });
}

class BlocConsumer<Bloc, State> {
  final Key? key;
  final BlocWidgetBuilder<State> builder;
  final BlocWidgetBuilder<State> listener;
  final BlocBuilderCondition<State>? buildWhen;
  final BlocBuilderCondition<State>? listenWhen;

  const BlocConsumer({
    this.key,
    required this.builder,
    required this.listener,
    this.buildWhen,
    this.listenWhen,
  });
}

class BlocSelector<Bloc, State, Target> {
  final Key? key;
  final BlocWidgetSelector<State, Target> selector;
  final BlocWidgetBuilder<Target> builder;

  const BlocSelector({
    this.key,
    required this.selector,
    required this.builder,
  });
}
