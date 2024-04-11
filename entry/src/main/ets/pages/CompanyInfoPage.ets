
import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger'

@Entry
@Component
export struct CompanyInfoPage {

  aboutToAppear() {
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {

      Flex({ direction: FlexDirection.Column }) {
        this.Title()
        Column() {
          Text("会社情報")
            .width('100%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Center)
            .fontSize('20fp')
            .fontColor($r('app.color.register_success_text_font'))
        }.height("5%")

        Scroll() {
          GridRow({
            columns: 1,
            gutter: { x: CommonConstants.GUTTER_X },
            breakpoints: { value: CommonConstants.BREAK_POINT }
          }) {
            GridCol({
              span: {
                sm: CommonConstants.PRIVACY_SPAN_SM,
                md: CommonConstants.PRIVACY_SPAN_MD,
                lg: CommonConstants.PRIVACY_SPAN_LG
              },
              offset: { lg: CommonConstants.OFFSET_TWO }
            }) {

              Column() {
                Text('所属企業ID')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                Text("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize('20fp')
                  .fontColor($r('app.color.register_success_text_font'))

                Text('代表者電話番号（契約者ID）')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                Text("123456")
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize('20fp')
                  .fontColor($r('app.color.register_success_text_font'))

                Text('ラクゼンご契約種別')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                Text("123456")
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize('20fp')
                  .fontColor($r('app.color.register_success_text_font'))

                Text('会社名')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                Text("123456")
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize('20fp')
                  .fontColor($r('app.color.register_success_text_font'))


                Text('代表者名')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                Text("123456")
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize('20fp')
                  .fontColor($r('app.color.register_success_text_font'))


                Text('会社住所')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                Text("123456")
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize('20fp')
                  .fontColor($r('app.color.register_success_text_font'))


                Text('会社電話番号')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                TextInput({ placeholder: 'XXX', text: '080' })
                  .width('80%')
                  .height($r('app.float.text_input_height'))
                  .placeholderColor($r('app.color.text_input_place_holder'))
                  .placeholderFont({ size: $r('app.float.text_input_font_size') })
                  .fontSize($r('app.float.text_input_font_size'))
                  .backgroundColor($r('app.color.login_input_text_background'))
                  .padding({ left: $r('app.float.password_padding_left') })
                  .type(InputType.Number)
                  .maxLength(3)
                  .border({
                    width: { bottom: $r('app.float.input_border_width') },
                    color: $r('app.color.input_border_color'),
                    radius: $r('app.float.input_border_radius')
                  })
                  .onChange((value: string) => {
                  })


                Text('代表者メールアドレス')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                Text("123456")
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize('20fp')
                  .fontColor($r('app.color.register_success_text_font'))


                Text('印影')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                Text("123456")
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize('20fp')
                  .fontColor($r('app.color.register_success_text_font'))


                Text('工種')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                TextArea()
                  .width('80%')
                  .height(100)
                  .textAlign(TextAlign.Start)
                  .fontSize('20fp')
                  .fontColor($r('app.color.register_success_text_font'))
                  .enabled(false)



                Text('建設業許可証')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                TextInput()
                  .width('80%')
                  .height($r('app.float.text_input_height'))
                  .placeholderColor($r('app.color.text_input_place_holder'))
                  .placeholderFont({ size: $r('app.float.text_input_font_size') })
                  .fontSize($r('app.float.text_input_font_size'))
                  .backgroundColor($r('app.color.login_input_text_background'))
                  .padding({ left: $r('app.float.password_padding_left') })
                  .type(InputType.Number)
                  .maxLength(3)
                  .border({
                    width: { bottom: $r('app.float.input_border_width') },
                    color: $r('app.color.input_border_color'),
                    radius: $r('app.float.input_border_radius')
                  })
                  .onChange((value: string) => {
                  })
                  .enabled(false)


                Text('健康保険')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                TextInput()
                  .width('80%')
                  .height($r('app.float.text_input_height'))
                  .placeholderColor($r('app.color.text_input_place_holder'))
                  .placeholderFont({ size: $r('app.float.text_input_font_size') })
                  .fontSize($r('app.float.text_input_font_size'))
                  .backgroundColor($r('app.color.login_input_text_background'))
                  .padding({ left: $r('app.float.password_padding_left') })
                  .type(InputType.Number)
                  .maxLength(3)
                  .border({
                    width: { bottom: $r('app.float.input_border_width') },
                    color: $r('app.color.input_border_color'),
                    radius: $r('app.float.input_border_radius')
                  })
                  .onChange((value: string) => {
                  })
                  .enabled(false)


                Text('厚生年金保険')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                TextInput()
                  .width('80%')
                  .height($r('app.float.text_input_height'))
                  .placeholderColor($r('app.color.text_input_place_holder'))
                  .placeholderFont({ size: $r('app.float.text_input_font_size') })
                  .fontSize($r('app.float.text_input_font_size'))
                  .backgroundColor($r('app.color.login_input_text_background'))
                  .padding({ left: $r('app.float.password_padding_left') })
                  .type(InputType.Number)
                  .maxLength(3)
                  .border({
                    width: { bottom: $r('app.float.input_border_width') },
                    color: $r('app.color.input_border_color'),
                    radius: $r('app.float.input_border_radius')
                  })
                  .onChange((value: string) => {
                  })
                  .enabled(false)


                Text('雇用保険')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                TextInput()
                  .width('80%')
                  .height($r('app.float.text_input_height'))
                  .placeholderColor($r('app.color.text_input_place_holder'))
                  .placeholderFont({ size: $r('app.float.text_input_font_size') })
                  .fontSize($r('app.float.text_input_font_size'))
                  .backgroundColor($r('app.color.login_input_text_background'))
                  .padding({ left: $r('app.float.password_padding_left') })
                  .type(InputType.Number)
                  .maxLength(3)
                  .border({
                    width: { bottom: $r('app.float.input_border_width') },
                    color: $r('app.color.input_border_color'),
                    radius: $r('app.float.input_border_radius')
                  })
                  .onChange((value: string) => {
                  })
                  .enabled(false)


                Text('工事用車輌情報')
                  .width('80%')
                  .height($r('app.float.register_success_text_height'))
                  .textAlign(TextAlign.Start)
                  .fontSize("12fp")
                  .fontColor($r('app.color.register_success_text_font'))
                  .margin({ top: $r('app.float.register_success_text_margin_top') })
                TextInput()
                  .width('80%')
                  .height($r('app.float.text_input_height'))
                  .placeholderColor($r('app.color.text_input_place_holder'))
                  .placeholderFont({ size: $r('app.float.text_input_font_size') })
                  .fontSize($r('app.float.text_input_font_size'))
                  .backgroundColor($r('app.color.login_input_text_background'))
                  .padding({ left: $r('app.float.password_padding_left') })
                  .type(InputType.Number)
                  .maxLength(3)
                  .border({
                    width: { bottom: $r('app.float.input_border_width') },
                    color: $r('app.color.input_border_color'),
                    radius: $r('app.float.input_border_radius')
                  })
                  .onChange((value: string) => {
                  })
                  .enabled(false)


                Row() {
                  TextInput({ placeholder: 'XXX', text: '080' })
                    .width('30%')
                    .height($r('app.float.text_input_height'))
                    .placeholderColor($r('app.color.text_input_place_holder'))
                    .placeholderFont({ size: $r('app.float.text_input_font_size') })
                    .fontSize($r('app.float.text_input_font_size'))
                    .backgroundColor($r('app.color.login_input_text_background'))
                    .padding({ left: $r('app.float.password_padding_left') })
                    .type(InputType.Number)
                    .maxLength(3)
                    .border({
                      width: { bottom: $r('app.float.input_border_width') },
                      color: $r('app.color.input_border_color'),
                      radius: $r('app.float.input_border_radius')
                    })
                    .margin({ bottom: $r('app.float.input_margin_bottom') })
                    .onChange((value: string) => {
                    })
                    .id("userId1")

                  Text('ー')
                    .width(10)
                    .height($r('app.float.text_input_height'))
                    .textAlign(TextAlign.Center)

                  TextInput({ placeholder: 'XXXX', text: '0000' })
                    .width('30%')
                    .height($r('app.float.text_input_height'))
                    .placeholderColor($r('app.color.text_input_place_holder'))
                    .placeholderFont({ size: $r('app.float.text_input_font_size') })
                    .fontSize($r('app.float.text_input_font_size'))
                    .backgroundColor($r('app.color.login_input_text_background'))
                    .padding({ left: $r('app.float.password_padding_left') })
                    .type(InputType.Number)
                    .maxLength(4)
                    .border({
                      width: { bottom: $r('app.float.input_border_width') },
                      color: $r('app.color.input_border_color'),
                      radius: $r('app.float.input_border_radius')
                    })
                    .margin({ bottom: $r('app.float.input_margin_bottom') })
                    .onChange((value: string) => {
                    })
                    .id("userId2")
                    .onFocus(() => {
                      sendEventByKey("userId2", 10, "")
                    })

                  Text('ー')
                    .width(10)
                    .height($r('app.float.text_input_height'))
                    .textAlign(TextAlign.Center)

                  TextInput({ placeholder: 'XXXX', text: '0001' })
                    .width('30%')
                    .height($r('app.float.text_input_height'))
                    .placeholderColor($r('app.color.text_input_place_holder'))
                    .placeholderFont({ size: $r('app.float.text_input_font_size') })
                    .fontSize($r('app.float.text_input_font_size'))
                    .backgroundColor($r('app.color.login_input_text_background'))
                    .padding({ left: $r('app.float.password_padding_left') })
                    .maxLength(4)
                    .type(InputType.Number)
                    .border({
                      width: { bottom: $r('app.float.input_border_width') },
                      color: $r('app.color.input_border_color'),
                      radius: $r('app.float.input_border_radius')
                    })
                    .margin({ bottom: $r('app.float.input_margin_bottom') })
                    .onChange((value: string) => {
                    })
                    .id("userId3")
                    .onFocus(() => {
                      sendEventByKey("userId3", 10, "")
                    })
                }.width('80%')
              }
            }
          }
        }
        .flexGrow(CommonConstants.FLEX_GROW)
      }
    }
    .backgroundColor("#DCDCDC")
  }

  @Builder Title() {
    Flex() {
      Stack({alignContent: Alignment.BottomEnd}) {
        Row() {
          Column() {
            Text("＜ホーム")
              .width('90%')
              .height('90%')
              .fontSize(18)
              .fontColor(Color.White)
              .align(Alignment.BottomStart)
              .onClick(() => {
                router.clear()
                Logger.debug("router=>", router.getLength().toString())
                router.pushUrl({url: CommonConstants.HOME_PAGE_URL})
              })
          }
          .width('50%')

          Column() {
            Text("保存")
              .width('90%')
              .height('90%')
              .fontSize(18)
              .fontColor(Color.White)
              .align(Alignment.BottomEnd)
              .textAlign(TextAlign.End)
              .onClick(() => {
                router.clear()
                Logger.debug("router=>", router.getLength().toString())
                router.pushUrl({url: CommonConstants.HOME_PAGE_URL})
              })
          }
          .width('50%')
        }
        .zIndex(2)

        Column() {
          Stack({alignContent: Alignment.Top}) {
            Image($r('app.media.logo'))
              .width('100vp')
              .height('50vp')
              .margin({
                top: 5
              })
          }
          .height('100%')
          .width('100%')
          .layoutWeight(2)
        }
        .align(Alignment.BottomStart)
      }
      .height('100%')
      .width('100%')
      // .border({width: 1})


    }
    .width('100%')
    .height('10%')
    .backgroundColor('#FF0CA91A')
  }
}