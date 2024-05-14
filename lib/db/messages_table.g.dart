// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_table.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors

extension GetMessagesCollection on Isar {
  IsarCollection<int, Messages> get messages => this.collection();
}

const MessagesSchema = IsarCollectionSchema(
  schema:
      '{"name":"Messages","idName":"id","properties":[{"name":"title","type":"String"},{"name":"messages","type":"ObjectList","target":"MessageModele"}]}',
  converter: IsarObjectConverter<int, Messages>(
    serialize: serializeMessages,
    deserialize: deserializeMessages,
    deserializeProperty: deserializeMessagesProp,
  ),
  embeddedSchemas: [MessageModeleSchema],
  hash: (2454900250197134892 * 31 + messageModeleSchemaHash),
);

@isarProtected
int serializeMessages(IsarWriter writer, Messages object) {
  IsarCore.writeString(writer, 1, IsarCore.toNativeString(object.title));
  {
    final list = object.messages;
    final listWriter = IsarCore.beginList(writer, 2, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeMessageModele(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.id;
}

@isarProtected
Messages deserializeMessages(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _title;
  _title = IsarCore.readString(reader, 1) ?? '';
  final List<MessageModele> _messages;
  {
    final length = IsarCore.readList(reader, 2, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _messages = const <MessageModele>[];
      } else {
        final list = List<MessageModele>.filled(
            length,
            MessageModele(
              messageContent: '',
              messageRole: roleMess.user,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = MessageModele(
                messageContent: '',
                messageRole: roleMess.user,
              );
            } else {
              final embedded = deserializeMessageModele(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _messages = list;
      }
    }
  }
  final object = Messages(
    _id,
    _title,
    _messages,
  );
  return object;
}

@isarProtected
dynamic deserializeMessagesProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      {
        final length = IsarCore.readList(reader, 2, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <MessageModele>[];
          } else {
            final list = List<MessageModele>.filled(
                length,
                MessageModele(
                  messageContent: '',
                  messageRole: roleMess.user,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = MessageModele(
                    messageContent: '',
                    messageRole: roleMess.user,
                  );
                } else {
                  final embedded = deserializeMessageModele(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _MessagesUpdate {
  bool call({
    required int id,
    String? title,
  });
}

class _MessagesUpdateImpl implements _MessagesUpdate {
  const _MessagesUpdateImpl(this.collection);

  final IsarCollection<int, Messages> collection;

  @override
  bool call({
    required int id,
    Object? title = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (title != ignore) 1: title as String?,
        }) >
        0;
  }
}

sealed class _MessagesUpdateAll {
  int call({
    required List<int> id,
    String? title,
  });
}

class _MessagesUpdateAllImpl implements _MessagesUpdateAll {
  const _MessagesUpdateAllImpl(this.collection);

  final IsarCollection<int, Messages> collection;

  @override
  int call({
    required List<int> id,
    Object? title = ignore,
  }) {
    return collection.updateProperties(id, {
      if (title != ignore) 1: title as String?,
    });
  }
}

extension MessagesUpdate on IsarCollection<int, Messages> {
  _MessagesUpdate get update => _MessagesUpdateImpl(this);

  _MessagesUpdateAll get updateAll => _MessagesUpdateAllImpl(this);
}

sealed class _MessagesQueryUpdate {
  int call({
    String? title,
  });
}

class _MessagesQueryUpdateImpl implements _MessagesQueryUpdate {
  const _MessagesQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Messages> query;
  final int? limit;

  @override
  int call({
    Object? title = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (title != ignore) 1: title as String?,
    });
  }
}

extension MessagesQueryUpdate on IsarQuery<Messages> {
  _MessagesQueryUpdate get updateFirst =>
      _MessagesQueryUpdateImpl(this, limit: 1);

  _MessagesQueryUpdate get updateAll => _MessagesQueryUpdateImpl(this);
}

extension MessagesQueryFilter
    on QueryBuilder<Messages, Messages, QFilterCondition> {
  QueryBuilder<Messages, Messages, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition>
      titleGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition>
      titleLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> messagesIsEmpty() {
    return not().messagesIsNotEmpty();
  }

  QueryBuilder<Messages, Messages, QAfterFilterCondition> messagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 2, value: null),
      );
    });
  }
}

extension MessagesQueryObject
    on QueryBuilder<Messages, Messages, QFilterCondition> {}

extension MessagesQuerySortBy on QueryBuilder<Messages, Messages, QSortBy> {
  QueryBuilder<Messages, Messages, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Messages, Messages, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Messages, Messages, QAfterSortBy> sortByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Messages, Messages, QAfterSortBy> sortByTitleDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension MessagesQuerySortThenBy
    on QueryBuilder<Messages, Messages, QSortThenBy> {
  QueryBuilder<Messages, Messages, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Messages, Messages, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Messages, Messages, QAfterSortBy> thenByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Messages, Messages, QAfterSortBy> thenByTitleDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension MessagesQueryWhereDistinct
    on QueryBuilder<Messages, Messages, QDistinct> {
  QueryBuilder<Messages, Messages, QAfterDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }
}

extension MessagesQueryProperty1
    on QueryBuilder<Messages, Messages, QProperty> {
  QueryBuilder<Messages, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Messages, String, QAfterProperty> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Messages, List<MessageModele>, QAfterProperty>
      messagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension MessagesQueryProperty2<R>
    on QueryBuilder<Messages, R, QAfterProperty> {
  QueryBuilder<Messages, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Messages, (R, String), QAfterProperty> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Messages, (R, List<MessageModele>), QAfterProperty>
      messagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension MessagesQueryProperty3<R1, R2>
    on QueryBuilder<Messages, (R1, R2), QAfterProperty> {
  QueryBuilder<Messages, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Messages, (R1, R2, String), QOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Messages, (R1, R2, List<MessageModele>), QOperations>
      messagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors

const messageModeleSchemaHash = 2845774081126242856;
const MessageModeleSchema = IsarSchema(
  schema:
      '{"name":"MessageModele","idName":null,"embedded":true,"properties":[{"name":"messageContent","type":"String"},{"name":"messageRole","type":"Byte","enumMap":{"user":0,"AI":1}}]}',
  converter: IsarObjectConverter<void, MessageModele>(
    serialize: serializeMessageModele,
    deserialize: deserializeMessageModele,
  ),
);

@isarProtected
int serializeMessageModele(IsarWriter writer, MessageModele object) {
  IsarCore.writeString(
      writer, 1, IsarCore.toNativeString(object.messageContent));
  IsarCore.writeByte(writer, 2, object.messageRole.index);
  return 0;
}

@isarProtected
MessageModele deserializeMessageModele(IsarReader reader) {
  final String _messageContent;
  _messageContent = IsarCore.readString(reader, 1) ?? '';
  final roleMess _messageRole;
  {
    final value = IsarCore.readByte(reader, 2);
    if (value == 0) {
      _messageRole = roleMess.user;
    } else {
      _messageRole = _messageModeleMessageRole[value] ?? roleMess.user;
    }
  }
  final object = MessageModele(
    messageContent: _messageContent,
    messageRole: _messageRole,
  );
  return object;
}

const _messageModeleMessageRole = {
  0: roleMess.user,
  1: roleMess.AI,
};

extension MessageModeleQueryFilter
    on QueryBuilder<MessageModele, MessageModele, QFilterCondition> {
  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageRoleEqualTo(
    roleMess value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageRoleGreaterThan(
    roleMess value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageRoleGreaterThanOrEqualTo(
    roleMess value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageRoleLessThan(
    roleMess value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageRoleLessThanOrEqualTo(
    roleMess value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MessageModele, MessageModele, QAfterFilterCondition>
      messageRoleBetween(
    roleMess lower,
    roleMess upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension MessageModeleQueryObject
    on QueryBuilder<MessageModele, MessageModele, QFilterCondition> {}
