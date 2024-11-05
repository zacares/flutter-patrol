import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:patrol_log/src/emojis.dart';

part 'log_entry.dart';
part 'step_entry.dart';
part 'test_entry.dart';

part 'entry.g.dart';

sealed class Entry with EquatableMixin {
  Entry({required this.timestamp, required this.type});

  // ignore: avoid_unused_constructor_parameters
  factory Entry.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson is not implemented');
  }

  final DateTime timestamp;
  final EntryType type;

  Map<String, dynamic> toJson();

  String pretty();

  @override
  String toString() => throw UnimplementedError('toString is not implemented');

  @override
  List<Object?> get props => [timestamp, type];
}

enum EntryType {
  @JsonValue('step')
  step,
  @JsonValue('test')
  test,
  @JsonValue('log')
  log;
}

/// The number of spaces used for indentation in the pretty print.
/// Used in LogEntry and StepEntry.
const indentation = '        ';
