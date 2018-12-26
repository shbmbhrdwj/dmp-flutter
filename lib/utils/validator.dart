class Validator {
  List<String> list = List();
  String entityName;
  Map<String, Function> _rule = {};
  Validator({this.entityName = "Entity"}) {
    _rule = {
      Rules.MIN_LENTH: (String value, Map<String, dynamic> property) {
        var minLength = property["minLength"];
        if (value.length < minLength)
          return "$entityName should be more than $minLength characters";
        return null;
      },
      Rules.EMAIL: _validateEmail
    };
  }

  Validator add(String ruleName, String value,
      [Map<String, dynamic> property]) {
    list.add(_rule[ruleName](value, property));
    return this;
  }

  static String _validateEmail(String value, Map<String, dynamic> property) {
    if (value.isEmpty) {
      return 'Email should not be empty!';
    } else if (!value.contains('@')) {
      return "'@' symbol should be present in the username";
    }
    return null;
  }

  runRules() {
    for (var rule in list) {
      if (rule != null) return rule;
    }
    return null;
  }
}

class Rules {
  static const MIN_LENTH = "minLength";
  static const EMAIL = "email";
}
