// ignore_for_file: unused_local_variable, avoid_multiple_declarations_per_line, omit_local_variable_types, prefer_final_locals, use_key_in_widget_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'codegen.g.dart';

/* SNIPPET START */
class User {
  late String firstName, lastName;
}

@riverpod
User example(ExampleRef ref) => User()
  ..firstName = 'John'
  ..lastName = 'Doe';

class ConsumerExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Invece di scrivere:
    // String name = ref.watch(provider).firstName!;
    // Possiamo scrivere:
    String name = ref.watch(exampleProvider.select((it) => it.firstName));
    // In questo modo il widget ascolterà solo i cambiamenti della proprietà "firstName".

    return Text('Hello $name');
  }
}
