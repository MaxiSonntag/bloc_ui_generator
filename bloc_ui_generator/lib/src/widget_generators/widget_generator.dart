// Copyright (c) 2024, Maximilian Sonntag. All rights reserved. Use of
// this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:bloc_ui_generator/src/widget_generators/bloc_builder_generator.dart';
import 'package:bloc_ui_generator/src/widget_generators/bloc_consumer_generator.dart';
import 'package:bloc_ui_generator/src/widget_generators/bloc_listener_generator.dart';
import 'package:bloc_ui_generator/src/widget_generators/bloc_selector_generator.dart';
import 'package:bloc_ui_generator/src/widget_generators/context_extension_generator.dart';

abstract base class WidgetGenerator {
  final StringBuffer buffer;
  final ClassElement blocElement;

  WidgetGenerator({
    required this.buffer,
    required this.blocElement,
  });

  /// Returns the corresponding generator for the given [generator].
  ///
  /// * [buffer] is the [StringBuffer] the generated code will be added to.
  /// * [blocElement] is the [ClassElement] for which code will be generated –
  /// it's extending `Bloc` or `Cubit`.
  /// * [selectorClasses] define the classes for which `BlocSelector`s should
  /// be generated for. Only used for [Generators.selector].
  factory WidgetGenerator.forType({
    required Generators generator,
    required StringBuffer buffer,
    required ClassElement blocElement,
    Set<String> selectorClasses = const <String>{},
  }) =>
      switch (generator) {
        Generators.builder => BlocBuilderGenerator(
            buffer: buffer,
            blocElement: blocElement,
          ),
        Generators.listener => BlocListenerGenerator(
            buffer: buffer,
            blocElement: blocElement,
          ),
        Generators.consumer => BlocConsumerGenerator(
            buffer: buffer,
            blocElement: blocElement,
          ),
        Generators.selector => BlocSelectorGenerator(
            buffer: buffer,
            blocElement: blocElement,
            selectorClasses: selectorClasses,
          ),
        Generators.contextExtensions => ContextExtensionsGenerator(
            buffer: buffer,
            blocElement: blocElement,
          ),
      };

  void generateCode();
}

/// The types of generators used for UI code generation
enum Generators {
  builder,
  listener,
  consumer,
  selector,
  contextExtensions,
}
