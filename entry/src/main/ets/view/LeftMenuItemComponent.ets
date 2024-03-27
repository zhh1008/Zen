import { LeftMenuItemData } from '../common/bean/LeftMenuItemData';
import { CommonConstants } from '../common/constants/CommonConstants';
import { DrawerLayout } from './DrawerLayoutComponent';
@Component
export default struct LeftMenuItemComponent {
  private leftMenuListItems: Array<LeftMenuItemData> = [new LeftMenuItemData('情報'), new LeftMenuItemData('アカウント'), new LeftMenuItemData('ログアウト')];
  build() {
    Column() {
        Flex({justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.End, direction: FlexDirection.Column}) {
          Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center}) {
            Text('株式会社繕')
              .fontSize(30)
              .fontWeight(FontWeight.Bold)

            Text('XX XXX 様')
              .fontSize(20)
              .fontWeight(FontWeight.Normal)
          }
          .width('100%')
          .height('10%')

          List() {
            ForEach(this.leftMenuListItems, (item: LeftMenuItemData) => {
              ListItem() {
                // MinePageItemComponent({ itemTitle: item.title })

                Row() {
                  Column() {
                    Image($r("app.media.ic_registration_success"))
                      .objectFit(ImageFit.Contain)
                      .width(30)
                      .height(30)
                  }
                  .width('20%')
                  .justifyContent(FlexAlign.Start)

                  Column() {
                    Text(item.title)
                      .width(CommonConstants.MINE_PAGE_TEXT_WIDTH_PERCENT)
                      .height($r('app.float.item_text_height'))
                      .fontSize(25)
                      .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
                      .margin({left: 10})
                  }
                }
              }
            }, (item, index) => index + JSON.stringify(item))
          }
          .divider({
            strokeWidth: $r('app.float.divider_stroke_width'),
            color: $r('app.color.item_divider')
          })

          Text('Ver1.0')
            .fontSize(20)
            .fontWeight(FontWeight.Normal)
            .margin({right: 5, bottom: 5})
            .textAlign(TextAlign.End)
            .align(Alignment.BottomEnd)
            .flexGrow(1)
        }
        .height('90%')
    }
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}