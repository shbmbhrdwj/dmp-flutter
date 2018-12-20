// GENERATED CODE - DO NOT MODIFY BY HAND

part of category_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryResponse> _$categoryResponseSerializer =
    new _$CategoryResponseSerializer();

class _$CategoryResponseSerializer
    implements StructuredSerializer<CategoryResponse> {
  @override
  final Iterable<Type> types = const [CategoryResponse, _$CategoryResponse];
  @override
  final String wireName = 'CategoryResponse';

  @override
  Iterable serialize(Serializers serializers, CategoryResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Category)])),
    ];

    return result;
  }

  @override
  CategoryResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Category)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryResponse extends CategoryResponse {
  @override
  final int status;
  @override
  final String message;
  @override
  final BuiltList<Category> data;

  factory _$CategoryResponse([void updates(CategoryResponseBuilder b)]) =>
      (new CategoryResponseBuilder()..update(updates)).build();

  _$CategoryResponse._({this.status, this.message, this.data}) : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('CategoryResponse', 'status');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('CategoryResponse', 'message');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('CategoryResponse', 'data');
    }
  }

  @override
  CategoryResponse rebuild(void updates(CategoryResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryResponseBuilder toBuilder() =>
      new CategoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryResponse &&
        status == other.status &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, status.hashCode), message.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoryResponse')
          ..add('status', status)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class CategoryResponseBuilder
    implements Builder<CategoryResponse, CategoryResponseBuilder> {
  _$CategoryResponse _$v;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<Category> _data;
  ListBuilder<Category> get data =>
      _$this._data ??= new ListBuilder<Category>();
  set data(ListBuilder<Category> data) => _$this._data = data;

  CategoryResponseBuilder();

  CategoryResponseBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _message = _$v.message;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CategoryResponse;
  }

  @override
  void update(void updates(CategoryResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoryResponse build() {
    _$CategoryResponse _$result;
    try {
      _$result = _$v ??
          new _$CategoryResponse._(
              status: status, message: message, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CategoryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
