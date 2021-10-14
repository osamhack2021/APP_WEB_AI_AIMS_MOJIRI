class Validator {
  String? validateDognum(String value) {
    if (value.isEmpty) {
      return '군번을 입력해주세요.';
    }
    return null;
  }

  String? validateUnitnum(String value) {
    if (value.isEmpty) {
      return '군번을 입력해주세요.';
    } else {
      return '';
    }
  }
}
