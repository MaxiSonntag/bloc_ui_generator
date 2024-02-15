// Copyright (c) 2024, Maximilian Sonntag. All rights reserved. Use of
// this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

abstract class SupertypeMatcher {
  /// Matches the [supertype] against a regular expression to determine if
  /// it's a `Bloc`
  static bool isBloc(String supertype) {
    final blocRegex = RegExp(r'Bloc<\w+, \w+\??>');

    return blocRegex.firstMatch(supertype) != null;
  }

  /// Matches the [supertype] against a regular expression to determine if
  /// it's a `Cubit`
  static bool isCubit(String supertype) {
    final cubitRegex = RegExp(r'Cubit<\w+\??>');

    return cubitRegex.firstMatch(supertype) != null;
  }
}
