// Copyright (c) 2024, Maximilian Sonntag. All rights reserved. Use of
// this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'package:bloc_ui_generator/src/utils/supertype_matcher.dart';
import 'package:bloc_ui_generator/src/widget_generators/widget_generator.dart';

/// Generator for `BlocListener` code
final class BlocListenerGenerator extends WidgetGenerator {
  BlocListenerGenerator({
    required super.buffer,
    required super.blocElement,
  });

  @override
  void generateCode() {
    buffer.writeln(
      'class ${blocName}Listener extends BlocListener<$blocName, $blocElementState> {',
    );
    buffer.writeln('  const ${blocElement.name}Listener({');
    buffer.writeln('    super.key,');
    buffer.writeln('    required super.listener,');
    buffer.writeln('    super.bloc,');
    buffer.writeln('    super.listenWhen,');
    buffer.writeln('    super.child,');
    buffer.writeln('  });');
    buffer.writeln('}');
  }

  String get blocName => blocElement.name;

  String get blocElementState {
    final supertype =
        blocElement.supertype!.getDisplayString(withNullability: true);

    if (SupertypeMatcher.isBloc(supertype)) {
      final regex = RegExp(r'Bloc<\w+, (\w+\??)>');
      final match = regex.firstMatch(supertype);

      if (match != null) {
        return match.group(1)!;
      }
    } else if (SupertypeMatcher.isCubit(supertype)) {
      final regex = RegExp(r'Cubit<(\w+\??)>');
      final match = regex.firstMatch(supertype);

      if (match != null) {
        return match.group(1)!;
      }
    }

    throw 'Could not extract state from supertype $supertype of ${blocElement.name}';
  }
}
