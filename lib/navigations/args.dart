// root
class RootArgs {
  final int index;
  final bool update;

  RootArgs({this.index, this.update});
}

// page modify
class ModifyArgs {
  final String title;
  final String index;

  ModifyArgs({ this.title, this.index });
}

// page topic
class TopicArgs {
  final String title;
  final String id;
  
  TopicArgs({this.title, this.id});
}

// page comment
class CommentArgs {
  final String id;

  CommentArgs({ this.id });
}

// page 
class ChangeGroupArgs {
  final List<String> groups;

  ChangeGroupArgs({ this.groups });
}

// pages
class GroupInfoArgs {
  final String name;

  GroupInfoArgs({this.name});
}

// member
class MemberArgs {
  final String name;

  MemberArgs({this.name});
}
