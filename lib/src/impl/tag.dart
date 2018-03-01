import '../api/tag.dart';
import '../requestor.dart';
import 'dart:async';
import 'package:fluttersteem/src/models/models.dart';

class SteemTagsApiImpl implements SteemTagsApi {
  static const String _trendingRoot = '/get_trending_tags';
  static const String _authorTagsRoot = '/get_tags_used_by_author';
  static const int _limit = 10;
  final Requestor requestor;

  SteemTagsApiImpl(this.requestor);

  @override
  Future<List<Tag>> getTrendingTags({int limit}) {
    Map<String, String> queryParameters = {};

    if (limit != null) queryParameters['limit'] = limit.toString();
    if (limit == null) queryParameters['limit'] = _limit.toString();

    return requestor
        .request('$_trendingRoot?', queryParameters: queryParameters)
        .then((r) {
      return r.data.map((m) => new Tag.fromJson(m)).toList();
    });
  }

  @override
  Future<List<dynamic>> getTagsUsedByAuthor(String author) {
    return requestor
        .request('$_authorTagsRoot')
        .then((r) {
      return r.data.map((m) => new Tag.fromJson(m)).toList();
    });
  }
}