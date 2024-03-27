/**
 * Basic list item data bean.
 */
export class LeftMenuItemData {

  /**
   * Indicates list item title.
   */
  title: Resource;

  /**
   * Indicates list item summary.
   */
  summary: Resource;

  constructor(title) {
    this.title = title;
  }
}