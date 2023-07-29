// ignore_for_file: one_member_abstracts

typedef PlayersIds = List<String>;

abstract class ShareRepo {
  Future<void> share(PlayersIds playersIds);
}
