// Copyright (c) 2024, Maximilian Sonntag. All rights reserved. Use of
// this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'package:bloc_ui_generator/src/widget_generators/widget_generator.dart';

/// Generator for `BuildContext` extension code
final class ContextExtensionsGenerator extends WidgetGenerator {
  ContextExtensionsGenerator({
    required super.buffer,
    required super.blocElement,
  });

  @override
  void generateCode() {
    buffer.writeln('extension ${blocName}ContextExtension on BuildContext {');
    buffer.writeln('  $blocName get read$blocName => read<$blocName>();');
    buffer.writeln('  $blocName get watch$blocName => watch<$blocName>();');
    buffer.writeln('  R select$blocName<R>(R Function($blocName value) selector) =>');
    buffer.writeln('    select<$blocName, R>(selector);');
    buffer.writeln('}');
  }

  String get blocName {
    if (blocElement.name3 != null) return blocElement.name3!;
    throw 'Unable to read Bloc name';
  }
}
