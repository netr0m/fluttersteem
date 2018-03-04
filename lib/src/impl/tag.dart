import 'dart:async';

import 'package:fluttersteem/src/models/models.dart';

import '../api/tag.dart';
import '../requestor.dart';

class SteemTagsApiImpl implements SteemTagsApi {
  static const String _trendingRoot = '/get_trending_tags';
  static const String _authorTagsRoot = '/get_tags_used_by_author';
  static const int _limit = 10;
  final Requestor requestor;

  SteemTagsApiImpl(this.requestor);

  @override
  Future<List<Tag>> getTrendingTags({int limit}) {
    var req = '$_trendingRoot?';

    if (limit != null) req += '&limit=$limit';
    if (limit == null) req += '&limit=10';

    return requestor
        .request('$req')
        .then((r) {
      return r.data.map((m) => new Tag.fromJson(m)).toList();
    });
  }

  @override
  Future<List<dynamic>> getTagsUsedByAuthor(String author) {
    return requestor
        .request('$_authorTagsRoot?&author=$author')
        .then((r) {
      return r.data.map((m) => new Tag.fromJson(m)).toList();
    });
  }
}