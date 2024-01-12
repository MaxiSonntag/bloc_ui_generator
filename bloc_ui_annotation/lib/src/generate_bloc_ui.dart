// Copyright (c) 2024, Maximilian Sonntag. All rights reserved. Use of
// this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/// An annotation used to specify a class to generate code for.
class GenerateBlocUI {
  /// Defines classes for which `BlocSelector`s should be generated. If empty,
  /// no `BlocSelector`s are generated at all.
  final Set<String> selectorClasses;

  const GenerateBlocUI({
    this.selectorClasses = const <String>{},
  });
}
