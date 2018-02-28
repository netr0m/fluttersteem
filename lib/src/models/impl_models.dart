import 'package:owl/annotation/json.dart';

@JsonClass()
class SteemResponse {
  SteemException meta;
  SteemResponsePagination pagination;

  @JsonField(native: true)
  dynamic data;

  SteemResponse({this.meta, this.pagination, this.data: const {}});
  factory SteemResponse.fromJson(Map map) =>
      SteemResponseMapper.parse(map);
  Map<String, dynamic> toJson() => SteemResponseMapper.map(this);
}

@JsonClass()
class SteemException implements Exception {
  String error;

  @JsonField(key: 'error_description')
  String errorDescription;

  SteemException({this.error, this.errorDescription});
  factory SteemException.fromJson(Map map) =>
      SteemExceptionMapper.parse(map);
  Map<String, dynamic> toJson() => SteemExceptionMapper.map(this);

  @override
  String toString() {
    return '$error: $errorDescription';
  }
}

@JsonClass()
class SteemResponsePagination {
  @JsonField(key: 'entry_id')
  String entryId;

  SteemResponsePagination({this.entryId});
  factory SteemResponsePagination.fromJson(Map map) =>
      SteemResponsePaginationMapper.parse(map);
  Map<String, dynamic> toJson() => SteemResponsePaginationMapper.map(this);
}

@JsonClass()
class SteemAuthException implements Exception {
  String error;

  @JsonField(key: 'error_description')
  String errorDescription;

  SteemAuthException({this.error, this.errorDescription});
  factory SteemAuthException.fromJson(Map map) =>
      SteemAuthExceptionMapper.parse(map);
  Map<String, dynamic> toJson() => SteemAuthExceptionMapper.map(this);
}