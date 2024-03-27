import { CommonConstants } from '../common/constants/CommonConstants'

@Component
export struct SysBackgroundComponent {
  build() {
    Column() {
      Row() {
        this.Header()
      }.height("10%")
      Row() {
        this.Middle()
      }.height("80%")
      Row() {
        this.Bottom()
      }.height("10%")
    }
  }


  @Builder Header() {
    Stack({alignContent: Alignment.Center}) {
      Image($r('app.media.logo'))
        .width('100vp')
        .height('50vp')
        .margin({
          left: $r('app.float.image_margin_left'),
          right: $r('app.float.image_margin_right')
        })
    }
    .backgroundImage($r('app.color.login_page_background'))
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height('100%')
    .backgroundColor('#FF0CA91A')
  }


  @Builder Middle() {
    Stack({alignContent: Alignment.Center}) {
      Image($r('app.media.background'))
        .width('150vp')
        .height('150vp')
        .margin({
          left: $r('app.float.image_margin_left'),
          right: $r('app.float.image_margin_right')
        })
        .opacity(0.2)

      // Text('ログイン')
      //   .fontSize($r('app.float.title_text_size'))
      //   .fontColor($r('app.color.title'))
      //   .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
    }
    .backgroundImage($r('app.color.login_page_background'))
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height('100%')
  }


  @Builder Bottom() {
    Stack({alignContent: Alignment.BottomEnd}) {

      Text('Ver1.0')
        .fontSize($r('app.float.title_text_size'))
        .fontColor($r('app.color.login_font_normal'))
        .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
        .margin({bottom: 10, right: 10})
    }
    .backgroundImage($r('app.color.login_page_background'))
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height('100%')
    .backgroundColor('#FF0CA91A')
  }
}


@Component
export struct Header {
  build() {
    Stack({alignContent: Alignment.Center}) {
      Image($r('app.media.logo'))
        .width('100vp')
        .height('50vp')
        .margin({
          left: $r('app.float.image_margin_left'),
          right: $r('app.float.image_margin_right')
        })
    }
    .backgroundImage($r('app.color.login_page_background'))
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height('100%')
    .backgroundColor('#FF0CA91A')
  }
}


@Component
export struct Middle {
  build() {
    Stack({alignContent: Alignment.Center}) {
      Image($r('app.media.background'))
        .width('150vp')
        .height('150vp')
        .margin({
          left: $r('app.float.image_margin_left'),
          right: $r('app.float.image_margin_right')
        })
        .opacity(0.2)
    }
    .backgroundImage($r('app.color.login_page_background'))
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height('100%')
  }
}


@Component
export struct Bottom {
  build() {
    Stack({alignContent: Alignment.BottomEnd}) {

      Text('Ver1.0')
        .fontSize($r('app.float.title_text_size'))
        .fontColor($r('app.color.login_font_normal'))
        .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
        .margin({bottom: 10, right: 10})
    }
    .backgroundImage($r('app.color.login_page_background'))
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height('100%')
    .backgroundColor('#FF0CA91A')
  }
}