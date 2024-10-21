// Copyright (c) 2024, Maximilian Sonntag. All rights reserved. Use of
// this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'package:bloc_ui_generator/src/widget_generators/widget_generator.dart';

/// Generator for `BlocProvider` code
final class BlocProviderGenerator extends WidgetGenerator {
  BlocProviderGenerator({
    required super.buffer,
    required super.blocElement,
  });

  @override
  void generateCode() {
    buffer.writeln('class ${blocName}Provider extends BlocProvider<$blocName> {');
    buffer.writeln('  const ${blocName}Provider({');
    buffer.writeln('    required super.create,');
    buffer.writeln('    super.key,');
    buffer.writeln('    super.child,');
    buffer.writeln('    super.lazy = true,');
    buffer.writeln('  });');
    buffer.writeln('');
    buffer.writeln('  const ${blocName}Provider.value({');
    buffer.writeln('    required super.value,');
    buffer.writeln('    super.key,');
    buffer.writeln('    super.child,');
    buffer.writeln('  }) : super.value();');
    buffer.writeln('}');
  }

  String get blocName => blocElement.name;
}
