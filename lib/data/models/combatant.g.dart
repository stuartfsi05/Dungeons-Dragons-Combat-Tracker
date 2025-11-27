// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combatant.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCombatantCollection on Isar {
  IsarCollection<Combatant> get combatants => this.collection();
}

const CombatantSchema = CollectionSchema(
  name: r'Combatant',
  id: -8016044981967854124,
  properties: {
    r'armorClass': PropertySchema(
      id: 0,
      name: r'armorClass',
      type: IsarType.long,
    ),
    r'combatId': PropertySchema(
      id: 1,
      name: r'combatId',
      type: IsarType.long,
    ),
    r'conditions': PropertySchema(
      id: 2,
      name: r'conditions',
      type: IsarType.stringList,
    ),
    r'hpCurrent': PropertySchema(
      id: 3,
      name: r'hpCurrent',
      type: IsarType.long,
    ),
    r'hpMax': PropertySchema(
      id: 4,
      name: r'hpMax',
      type: IsarType.long,
    ),
    r'hpTemp': PropertySchema(
      id: 5,
      name: r'hpTemp',
      type: IsarType.long,
    ),
    r'initiative': PropertySchema(
      id: 6,
      name: r'initiative',
      type: IsarType.long,
    ),
    r'isPlayer': PropertySchema(
      id: 7,
      name: r'isPlayer',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _combatantEstimateSize,
  serialize: _combatantSerialize,
  deserialize: _combatantDeserialize,
  deserializeProp: _combatantDeserializeProp,
  idName: r'id',
  indexes: {
    r'combatId': IndexSchema(
      id: 4342258587633876970,
      name: r'combatId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'combatId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'initiative': IndexSchema(
      id: 6412160096044455165,
      name: r'initiative',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'initiative',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _combatantGetId,
  getLinks: _combatantGetLinks,
  attach: _combatantAttach,
  version: '3.1.0+1',
);

int _combatantEstimateSize(
  Combatant object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.conditions.length * 3;
  {
    for (var i = 0; i < object.conditions.length; i++) {
      final value = object.conditions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _combatantSerialize(
  Combatant object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.armorClass);
  writer.writeLong(offsets[1], object.combatId);
  writer.writeStringList(offsets[2], object.conditions);
  writer.writeLong(offsets[3], object.hpCurrent);
  writer.writeLong(offsets[4], object.hpMax);
  writer.writeLong(offsets[5], object.hpTemp);
  writer.writeLong(offsets[6], object.initiative);
  writer.writeBool(offsets[7], object.isPlayer);
  writer.writeString(offsets[8], object.name);
}

Combatant _combatantDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Combatant();
  object.armorClass = reader.readLong(offsets[0]);
  object.combatId = reader.readLong(offsets[1]);
  object.conditions = reader.readStringList(offsets[2]) ?? [];
  object.hpCurrent = reader.readLong(offsets[3]);
  object.hpMax = reader.readLong(offsets[4]);
  object.hpTemp = reader.readLong(offsets[5]);
  object.id = id;
  object.initiative = reader.readLong(offsets[6]);
  object.isPlayer = reader.readBool(offsets[7]);
  object.name = reader.readString(offsets[8]);
  return object;
}

P _combatantDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _combatantGetId(Combatant object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _combatantGetLinks(Combatant object) {
  return [];
}

void _combatantAttach(IsarCollection<dynamic> col, Id id, Combatant object) {
  object.id = id;
}

extension CombatantQueryWhereSort
    on QueryBuilder<Combatant, Combatant, QWhere> {
  QueryBuilder<Combatant, Combatant, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhere> anyCombatId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'combatId'),
      );
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhere> anyInitiative() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'initiative'),
      );
    });
  }
}

extension CombatantQueryWhere
    on QueryBuilder<Combatant, Combatant, QWhereClause> {
  QueryBuilder<Combatant, Combatant, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> combatIdEqualTo(
      int combatId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'combatId',
        value: [combatId],
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> combatIdNotEqualTo(
      int combatId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'combatId',
              lower: [],
              upper: [combatId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'combatId',
              lower: [combatId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'combatId',
              lower: [combatId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'combatId',
              lower: [],
              upper: [combatId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> combatIdGreaterThan(
    int combatId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'combatId',
        lower: [combatId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> combatIdLessThan(
    int combatId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'combatId',
        lower: [],
        upper: [combatId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> combatIdBetween(
    int lowerCombatId,
    int upperCombatId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'combatId',
        lower: [lowerCombatId],
        includeLower: includeLower,
        upper: [upperCombatId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> initiativeEqualTo(
      int initiative) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'initiative',
        value: [initiative],
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> initiativeNotEqualTo(
      int initiative) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'initiative',
              lower: [],
              upper: [initiative],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'initiative',
              lower: [initiative],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'initiative',
              lower: [initiative],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'initiative',
              lower: [],
              upper: [initiative],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> initiativeGreaterThan(
    int initiative, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'initiative',
        lower: [initiative],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> initiativeLessThan(
    int initiative, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'initiative',
        lower: [],
        upper: [initiative],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterWhereClause> initiativeBetween(
    int lowerInitiative,
    int upperInitiative, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'initiative',
        lower: [lowerInitiative],
        includeLower: includeLower,
        upper: [upperInitiative],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CombatantQueryFilter
    on QueryBuilder<Combatant, Combatant, QFilterCondition> {
  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> armorClassEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'armorClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      armorClassGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'armorClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> armorClassLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'armorClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> armorClassBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'armorClass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> combatIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'combatId',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> combatIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'combatId',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> combatIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'combatId',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> combatIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'combatId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conditions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'conditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'conditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'conditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'conditions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conditions',
        value: '',
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'conditions',
        value: '',
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      conditionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpCurrentEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hpCurrent',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      hpCurrentGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hpCurrent',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpCurrentLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hpCurrent',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpCurrentBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hpCurrent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpMaxEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hpMax',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpMaxGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hpMax',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpMaxLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hpMax',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpMaxBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hpMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpTempEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hpTemp',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpTempGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hpTemp',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpTempLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hpTemp',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> hpTempBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hpTemp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> initiativeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initiative',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition>
      initiativeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initiative',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> initiativeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initiative',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> initiativeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initiative',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> isPlayerEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPlayer',
        value: value,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension CombatantQueryObject
    on QueryBuilder<Combatant, Combatant, QFilterCondition> {}

extension CombatantQueryLinks
    on QueryBuilder<Combatant, Combatant, QFilterCondition> {}

extension CombatantQuerySortBy on QueryBuilder<Combatant, Combatant, QSortBy> {
  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByArmorClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'armorClass', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByArmorClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'armorClass', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByCombatId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'combatId', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByCombatIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'combatId', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByHpCurrent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpCurrent', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByHpCurrentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpCurrent', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByHpMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpMax', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByHpMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpMax', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByHpTemp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpTemp', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByHpTempDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpTemp', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByInitiative() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiative', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByInitiativeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiative', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByIsPlayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayer', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByIsPlayerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayer', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension CombatantQuerySortThenBy
    on QueryBuilder<Combatant, Combatant, QSortThenBy> {
  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByArmorClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'armorClass', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByArmorClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'armorClass', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByCombatId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'combatId', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByCombatIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'combatId', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByHpCurrent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpCurrent', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByHpCurrentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpCurrent', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByHpMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpMax', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByHpMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpMax', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByHpTemp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpTemp', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByHpTempDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpTemp', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByInitiative() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiative', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByInitiativeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiative', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByIsPlayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayer', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByIsPlayerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayer', Sort.desc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Combatant, Combatant, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension CombatantQueryWhereDistinct
    on QueryBuilder<Combatant, Combatant, QDistinct> {
  QueryBuilder<Combatant, Combatant, QDistinct> distinctByArmorClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'armorClass');
    });
  }

  QueryBuilder<Combatant, Combatant, QDistinct> distinctByCombatId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'combatId');
    });
  }

  QueryBuilder<Combatant, Combatant, QDistinct> distinctByConditions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'conditions');
    });
  }

  QueryBuilder<Combatant, Combatant, QDistinct> distinctByHpCurrent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hpCurrent');
    });
  }

  QueryBuilder<Combatant, Combatant, QDistinct> distinctByHpMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hpMax');
    });
  }

  QueryBuilder<Combatant, Combatant, QDistinct> distinctByHpTemp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hpTemp');
    });
  }

  QueryBuilder<Combatant, Combatant, QDistinct> distinctByInitiative() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initiative');
    });
  }

  QueryBuilder<Combatant, Combatant, QDistinct> distinctByIsPlayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPlayer');
    });
  }

  QueryBuilder<Combatant, Combatant, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension CombatantQueryProperty
    on QueryBuilder<Combatant, Combatant, QQueryProperty> {
  QueryBuilder<Combatant, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Combatant, int, QQueryOperations> armorClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'armorClass');
    });
  }

  QueryBuilder<Combatant, int, QQueryOperations> combatIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'combatId');
    });
  }

  QueryBuilder<Combatant, List<String>, QQueryOperations> conditionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'conditions');
    });
  }

  QueryBuilder<Combatant, int, QQueryOperations> hpCurrentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hpCurrent');
    });
  }

  QueryBuilder<Combatant, int, QQueryOperations> hpMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hpMax');
    });
  }

  QueryBuilder<Combatant, int, QQueryOperations> hpTempProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hpTemp');
    });
  }

  QueryBuilder<Combatant, int, QQueryOperations> initiativeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initiative');
    });
  }

  QueryBuilder<Combatant, bool, QQueryOperations> isPlayerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPlayer');
    });
  }

  QueryBuilder<Combatant, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
