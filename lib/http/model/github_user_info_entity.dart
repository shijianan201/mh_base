import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/github_user_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class GithubUserInfoEntity {
  late String login;
  late int id;
  @JSONField(name: "node_id")
  late String nodeId;
  @JSONField(name: "avatar_url")
  late String avatarUrl;
  @JSONField(name: "gravatar_id")
  late String gravatarId;
  late String url;
  @JSONField(name: "html_url")
  late String htmlUrl;
  @JSONField(name: "followers_url")
  late String followersUrl;
  @JSONField(name: "following_url")
  late String followingUrl;
  @JSONField(name: "gists_url")
  late String gistsUrl;
  @JSONField(name: "starred_url")
  late String starredUrl;
  @JSONField(name: "subscriptions_url")
  late String subscriptionsUrl;
  @JSONField(name: "organizations_url")
  late String organizationsUrl;
  @JSONField(name: "repos_url")
  late String reposUrl;
  @JSONField(name: "events_url")
  late String eventsUrl;
  @JSONField(name: "received_events_url")
  late String receivedEventsUrl;
  late String type;
  @JSONField(name: "site_admin")
  late bool siteAdmin;
  late String name;
  dynamic company;
  late String blog;
  late String location;
  dynamic email;
  dynamic hireable;
  late String bio;
  @JSONField(name: "twitter_username")
  dynamic twitterUsername;
  @JSONField(name: "public_repos")
  late int publicRepos;
  @JSONField(name: "public_gists")
  late int publicGists;
  late int followers;
  late int following;
  @JSONField(name: "created_at")
  late String createdAt;
  @JSONField(name: "updated_at")
  late String updatedAt;

  GithubUserInfoEntity();

  factory GithubUserInfoEntity.fromJson(Map<String, dynamic> json) =>
      $GithubUserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $GithubUserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
