// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// ignore_for_file: type=lint
class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone =
      GeneratedColumn<bool>('is_done', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_done" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eventDateTimeMeta =
      const VerificationMeta('eventDateTime');
  @override
  late final GeneratedColumn<DateTime> eventDateTime =
      GeneratedColumn<DateTime>('event_date_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, isDone, title, eventDateTime];
  @override
  String get aliasedName => _alias ?? 'notes';
  @override
  String get actualTableName => 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_done')) {
      context.handle(_isDoneMeta,
          isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta));
    } else if (isInserting) {
      context.missing(_isDoneMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('event_date_time')) {
      context.handle(
          _eventDateTimeMeta,
          eventDateTime.isAcceptableOrUnknown(
              data['event_date_time']!, _eventDateTimeMeta));
    } else if (isInserting) {
      context.missing(_eventDateTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_done'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      eventDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}event_date_time'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final int id;
  final bool isDone;
  final String title;
  final DateTime eventDateTime;
  const Note(
      {required this.id,
      required this.isDone,
      required this.title,
      required this.eventDateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_done'] = Variable<bool>(isDone);
    map['title'] = Variable<String>(title);
    map['event_date_time'] = Variable<DateTime>(eventDateTime);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      isDone: Value(isDone),
      title: Value(title),
      eventDateTime: Value(eventDateTime),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      title: serializer.fromJson<String>(json['title']),
      eventDateTime: serializer.fromJson<DateTime>(json['eventDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isDone': serializer.toJson<bool>(isDone),
      'title': serializer.toJson<String>(title),
      'eventDateTime': serializer.toJson<DateTime>(eventDateTime),
    };
  }

  Note copyWith(
          {int? id, bool? isDone, String? title, DateTime? eventDateTime}) =>
      Note(
        id: id ?? this.id,
        isDone: isDone ?? this.isDone,
        title: title ?? this.title,
        eventDateTime: eventDateTime ?? this.eventDateTime,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('isDone: $isDone, ')
          ..write('title: $title, ')
          ..write('eventDateTime: $eventDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isDone, title, eventDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.isDone == this.isDone &&
          other.title == this.title &&
          other.eventDateTime == this.eventDateTime);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<bool> isDone;
  final Value<String> title;
  final Value<DateTime> eventDateTime;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.isDone = const Value.absent(),
    this.title = const Value.absent(),
    this.eventDateTime = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required bool isDone,
    required String title,
    required DateTime eventDateTime,
  })  : isDone = Value(isDone),
        title = Value(title),
        eventDateTime = Value(eventDateTime);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<bool>? isDone,
    Expression<String>? title,
    Expression<DateTime>? eventDateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isDone != null) 'is_done': isDone,
      if (title != null) 'title': title,
      if (eventDateTime != null) 'event_date_time': eventDateTime,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isDone,
      Value<String>? title,
      Value<DateTime>? eventDateTime}) {
    return NotesCompanion(
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      title: title ?? this.title,
      eventDateTime: eventDateTime ?? this.eventDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (eventDateTime.present) {
      map['event_date_time'] = Variable<DateTime>(eventDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('isDone: $isDone, ')
          ..write('title: $title, ')
          ..write('eventDateTime: $eventDateTime')
          ..write(')'))
        .toString();
  }
}

class NotesViewData extends DataClass {
  final String title;
  const NotesViewData({required this.title});
  factory NotesViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotesViewData(
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
    };
  }

  NotesViewData copyWith({String? title}) => NotesViewData(
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('NotesViewData(')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => title.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotesViewData && other.title == this.title);
}

class $NotesViewView extends ViewInfo<$NotesViewView, NotesViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  $NotesViewView(this.attachedDatabase, [this._alias]);
  $NotesTable get notes => attachedDatabase.notes.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [title];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'notes_view';
  @override
  String? get createViewStmt => null;
  @override
  $NotesViewView get asDslTable => this;
  @override
  NotesViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotesViewData(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      generatedAs: GeneratedAs(notes.title, false), type: DriftSqlType.string);
  @override
  $NotesViewView createAlias(String alias) {
    return $NotesViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(notes)..addColumns($columns));
  @override
  Set<String> get readTables => const {'notes'};
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $NotesTable notes = $NotesTable(this);
  late final $NotesViewView notesView = $NotesViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notes, notesView];
}
