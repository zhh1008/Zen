@Component
export struct CommonTitleBarComponent {
  public attribute: CommonTitleBarAttribute;

  build() {
    Flex() {
      Stack({alignContent: Alignment.BottomStart}) {
        Image($r('app.media.menu'))
          .width('40vp')
          .height('40vp')
          .margin({
            left: 10,
            bottom: 10
          })
          .onClick(() => {
            this.attribute.menuCallback?.call(this)
          })
      }
      .height('100%')
      .padding({left: 15})
      .layoutWeight(1)

      Stack({alignContent: Alignment.Top}) {
        Image($r('app.media.logo'))
          .width('100vp')
          .height('50vp')
          .margin({
            top: 5
          })

        Text(this.attribute.title_text)
          .fontSize(16)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.Center)
          .align(Alignment.BottomEnd)
          .height('90%')
      }
      .height('100%')
      .layoutWeight(2)

      Stack({ alignContent: Alignment.BottomEnd }) {
        Text(this.attribute.extra_text)
          .fontSize(20)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.End)
          .align(Alignment.BottomEnd)
          .margin( {bottom: 10})
          .onClick(() => {
            this.attribute.extraCallback?.call(this)
          })
      }
      .padding({ right: 5})
      .height('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('10%')
    .backgroundColor(this.attribute.bg_color)
  }
}

class CommonTitleBarAttribute {
  public bg_color: string = "";
  public title_text: string = "";
  public extra_text: string = "";
  public menuCallback:() => void;
  public extraCallback:() => void;
}