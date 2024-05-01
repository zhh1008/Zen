import Logger from './utils/Logger';

export class CommonUtils {

  textPickerDialog(sexArray: Resource, defaultValue: string, sexCallback: Function) {
    if (this.isEmpty(sexArray)) {
      Logger.error("CommonConstants.TAG_COMMON_UTILS", 'sex is null');
      return;
    }
    TextPickerDialog.show({
      range: sexArray,
      // selected: 0,
      value: defaultValue,
      onAccept: (result: TextPickerResult) => {
        sexCallback(result.value);
      },
      onCancel: () => {
        Logger.info("CommonConstants.TAG_COMMON_UTILS", 'TextPickerDialog onCancel');
      }
    });
  }

  datePickerDialog(defaultValue: string, dateCallback: Function) {
    DatePickerDialog.show({
      start: new Date("1926-1-1"),
      end: new Date("2046-1-1"),
      selected: new Date(defaultValue),
      lunar: false,
      onAccept: (value: DatePickerResult) => {
        let year: number = Number(value.year);
        let month: number = Number(value.month) + 1;
        let day: number = Number(value.day);
        let birthdate: string = this.getBirthDateValue(year, month, day);
        dateCallback(year, month, day);
      }
    });
  }

  /**
   * Check obj is empty
   *
   * @param {object} obj
   * @return {boolean} true(empty)
   */
  isEmpty(obj: object | string): boolean {
    return obj === undefined || obj === null || obj === '';
  }

  /**
   * Get default birth date
   *
   * @param {number} year year
   * @param {number} month month
   * @param {number} day day
   * @returns {string} return birth date
   */
  getBirthDateValue(year: number, month: number, day: number): string {
    let birthdate: string = `${year}年${month}` + `月${day}日`;
    return birthdate;
  }

}
export default new CommonUtils();