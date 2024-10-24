// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// BlocUIGenerator
// **************************************************************************

class CounterBlocBuilder extends BlocBuilder<CounterBloc, int> {
  const CounterBlocBuilder({
    super.key,
    required super.builder,
    super.buildWhen,
    super.bloc,
  });
}

class CounterBlocListener extends BlocListener<CounterBloc, int> {
  const CounterBlocListener({
    super.key,
    required super.listener,
    super.bloc,
    super.listenWhen,
    super.child,
  });
}

class CounterBlocConsumer extends BlocConsumer<CounterBloc, int> {
  const CounterBlocConsumer({
    super.key,
    required super.builder,
    required super.listener,
    super.bloc,
    super.buildWhen,
    super.listenWhen,
  });
}

class CounterBlocStringSelector extends BlocSelector<CounterBloc, int, String> {
  const CounterBlocStringSelector({
    super.key,
    required super.selector,
    required super.builder,
    super.bloc,
  });
}

class CounterBlocDoubleSelector extends BlocSelector<CounterBloc, int, double> {
  const CounterBlocDoubleSelector({
    super.key,
    required super.selector,
    required super.builder,
    super.bloc,
  });
}

class CounterProvider extends BlocProvider<CounterBloc> {
  const CounterProvider({
    required super.create,
    super.key,
    super.child,
    super.lazy = true,
  });

  const CounterProvider.value({
    required super.value,
    super.key,
    super.child,
  }) : super.value();
}

extension CounterBlocContextExtension on BuildContext {
  CounterBloc get readTestBloc => read<CounterBloc>();
  CounterBloc get watchTestBloc => watch<CounterBloc>();
  R selectTestBloc<R>(R Function(CounterBloc value) selector) =>
      select<CounterBloc, R>(selector);
}
