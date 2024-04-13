class StringUtils {
  isNullOrEmpty(str?: string) {
    return str == null || str.length == 0;
  }
}

export default new StringUtils()