// Copyright (c) 2024, Maximilian Sonntag. All rights reserved. Use of
// this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:bloc_ui_annotation/bloc_ui_annotation.dart';
import 'package:bloc_ui_generator/src/utils/supertype_matcher.dart';
import 'package:bloc_ui_generator/src/widget_generators/widget_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

class BlocUIGenerator extends GeneratorForAnnotation<GenerateBlocUI> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Annotated element is not a class: ${element.name}',
        element: element,
        todo: 'Use @GenerateBlocUI annotation on a class',
      );
    }

    final buffer = StringBuffer();

    buffer.writeln('// coverage:ignore-file');
    buffer.writeln();

    final supertype = element.supertype?.getDisplayString();
    if (supertype != null &&
        (SupertypeMatcher.isBloc(supertype) ||
            SupertypeMatcher.isCubit(supertype))) {
      final Set<String> selectorClasses = annotation
          .read('selectorClasses')
          .setValue
          .map((e) => e.toStringValue())
          .whereType<String>()
          .toSet();

      for (final generator in Generators.values) {
        WidgetGenerator.forType(
          generator: generator,
          buffer: buffer,
          blocElement: element,
          selectorClasses: selectorClasses,
        ).generateCode();
      }
    } else {
      throw InvalidGenerationSourceError(
          'Annotated class ${element.name} does not extend Bloc or Cubit '
          '– extends $supertype',
          element: element,
          todo:
              'Use @GenerateBlocUI annotation on a class that extends Bloc or Cubit');
    }

    return buffer.toString();
  }
}
