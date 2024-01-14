// Ignore this import and use the commented ones instead –
// just avoiding dependency on bloc-package here
import 'utils/bloc_classes.dart';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:bloc_ui_annotation/bloc_ui_annotation.dart';

part 'example_bloc.g.dart';

@GenerateBlocUI(
  selectorClasses: {'String', 'double'},
)
class CounterBloc extends Bloc<int, int> {
  CounterBloc() : super(0) {
    on<int>((event, emit) {
      // TODO: implement event handler
    });
  }
}
