<a href="https://pub.dev/packages/bloc_ui_generator">
	<img src="https://img.shields.io/pub/v/bloc_ui_generator" alt="Pub Package Version"/>
</a>

Provides [Dart Build System] builders for typed `BlocBuilder`s, 
`BlocListener`s, `BlocConsumer`s, `BlocSelector`s and `BlocProvider`s, as well as `BuildContext` 
extensions fur `read`, `watch` and `select`.

The builders generate code when they find members annotated with classes defined
in [package:bloc_ui_annotation].

- To generate UI code for a class that extends `Bloc` or `Cubit`, annotate 
  it with `GenerateBlocUI`. You can provide the argument `selectorClasses` 
  to `GenerateBlocUI` to configure which `BlocSelector` output types should be 
  generated.


## Setup

To configure your project, you need to add [bloc_ui_annotation] as a dependency 
to your pubspec.yaml file, as well as `bloc_ui_generator` as a 
development dependency:

```yaml
dependencies:
  bloc_ui_annotation: 

dev_dependencies:
  bloc_ui_generator:
```

## Example

Given a library `example.dart` with a `CounterBloc` class extending `Bloc`, 
annotated with `GenerateBlocUI`:

```dart
import 'package:bloc_ui_annotation/bloc_ui_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'example.g.dart';

@GenerateBlocUI(
  selectorClasses: {'String'},
)
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
```

Building created the corresponding part `example.g.dart`:

```dart
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

class CounterBlocStringSelector
    extends BlocSelector<CounterBloc, int, String> {
  const CounterBlocStringSelector({
    super.key,
    required super.selector,
    required super.builder,
    super.bloc,
  });
}

class CounterBlocProvider extends BlocProvider<CounterBloc> {
  const CounterBlocProvider({
    required super.create,
    super.key,
    super.child,
    super.lazy = true,
  });

  const CounterBlocProvider.value({
    required super.value,
    super.key,
    super.child,
  }) : super.value();
}

extension CounterBlocContextExtension on BuildContext {
  CounterBloc get readTestBloc => read<CounterBloc>();
  CounterBloc get watchTestBloc => watch<CounterBloc>();
  R selectCounterBloc<R>(R Function(CounterBloc value) selector) =>
          select<CounterBloc, R>(selector);
}
```

# Running the code generator

Once you have added the annotations to your code you then need to run the code
generator to generate the missing `.g.dart` generated dart files.

Run `dart run build_runner build` in the package directory.

# Annotation values

The only annotation required to use this package is `GenerateBlocUI`. When
applied to a class (in a correctly configured package), typed `BlocBuilder`, 
`BlocListener`, `BlocConsumer`, `BlocProvider` and `BuildContext` extension code 
will be generated when you build. 
Additionally, you can provide a `Set<String>` to the `selectorClasses` 
parameter of `GenerateBlocUI`, to generate one or more `BlocSelector`s as well.

## Bloc definition

Note that any `Bloc`s or `Cubit`s names must extend `Bloc` or `Cubit`, e.g. 
`TestBloc extends Bloc<A, B>` or `TestCubit extends Cubit<A>`. If an annotated 
class does not extend one of these classes, an error will be thrown when 
running code generation.

## Selector generation

`BlocSelector`s will be generated once the `selectorClasses` parameter is 
provided with at least one value. You can add multiple `String`s to the `Set`, 
each leading to the generation of another `BlocSelector`.

Please note that the code generation does simply use the given value 
without any checks or referencing the actual type. This means, that renaming 
classes does not automatically adapt the corresponding `BlocSelector`, even 
after re-running code generation.

[dart build system]: https://github.com/dart-lang/build
[bloc_ui_annotation]: https://pub.dev/packages/bloc_ui_annotation
[package:bloc_ui_annotation]: https://pub.dev/packages/bloc_ui_annotation