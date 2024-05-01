class StringUtils {
  isNullOrEmpty(str?: string) {
    return str == null || str.length == 0;
  }

  convertSexByCode(code: string) {
    if (code = '01') {
      return '男';
    } else if (code = '02') {
      return '女';
    }
    return '';
  }

  convertRelationshipByCode(code: string) {
    if (code = '01') {
      return '配偶者';
    } else if (code = '02') {
      return '親';
    } else if (code = '03') {
      return '子';
    }
    return '';
  }

}

export default new StringUtils()