// Copyright (c) 2024, Maximilian Sonntag. All rights reserved. Use of
// this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'package:bloc_ui_generator/src/utils/extensions.dart';
import 'package:bloc_ui_generator/src/utils/supertype_matcher.dart';
import 'package:bloc_ui_generator/src/widget_generators/widget_generator.dart';

/// Generator for `BlocSelector` code
final class BlocSelectorGenerator extends WidgetGenerator {
  final Set<String> selectorClasses;

  BlocSelectorGenerator({
    required super.buffer,
    required super.blocElement,
    required this.selectorClasses,
  });

  @override
  void generateCode() {
    for (final selectorClass in selectorClasses) {
      buffer.writeln(
        'class $blocName${selectorClass.capitalize()}Selector extends BlocSelector<$blocName, $blocElementState, $selectorClass> {',
      );
      buffer
          .writeln('  const $blocName${selectorClass.capitalize()}Selector({');
      buffer.writeln('    super.key,');
      buffer.writeln('    required super.selector,');
      buffer.writeln('    required super.builder,');
      buffer.writeln('  });');
      buffer.writeln('}');
    }
  }

  String get blocName => blocElement.name;

  String get blocElementState {
    final supertype =
        blocElement.supertype!.getDisplayString(withNullability: false);

    if (SupertypeMatcher.isBloc(supertype)) {
      final regex = RegExp(r'Bloc<\w+, (\w+)>');
      final match = regex.firstMatch(supertype);

      if (match != null) {
        return match.group(1)!;
      }
    } else if (SupertypeMatcher.isCubit(supertype)) {
      final regex = RegExp(r'Cubit<(\w+)>');
      final match = regex.firstMatch(supertype);

      if (match != null) {
        return match.group(1)!;
      }
    }

    throw 'Could not extract state from supertype $supertype of ${blocElement.name}';
  }
}
