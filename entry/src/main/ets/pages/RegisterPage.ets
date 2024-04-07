import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { CommonConstants } from '../common/constants/CommonConstants';

/**
 * Page shows registration successful.
 */
@Entry
@Component
struct RegisterPage {
  userName: string = '';
  password: string = '';
  passwordConfirm: string = '';
  userId1: string = '';
  userId2: string = '';
  userId3: string = '';

  build() {
    Column() {
      this.Title()

      this.background()
      Scroll() {
        Column() {

          Text('あなたのログインID')
            .width('80%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Start)
            .fontSize($r('app.float.register_success_text_font_size'))
            .fontColor($r('app.color.register_success_text_font'))
            .margin({ top: $r('app.float.register_success_text_margin_top') })

          Row() {
            TextInput({placeholder:'XXX'})
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
                this.userId1 = value;
                this.userName = this.userId1 + this.userId2 + this.userId3;
                if (value.length == 3) {
                  focusControl.requestFocus('regUserId2')
                }
              })
              .id("regUserId1")

            Text('ー')
              .width(10)
              .height($r('app.float.text_input_height'))
              .textAlign(TextAlign.Center)

            TextInput({placeholder:'XXXX'})
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
                this.userId2 = value;
                this.userName = this.userId1 + this.userId2 + this.userId3;
                if (value.length == 4) {
                  focusControl.requestFocus('regUserId3')
                }
              })
              .id("regUserId2")
              .onFocus(() => {
                sendEventByKey("regUserId2", 10, "")
              })

            Text('ー')
              .width(10)
              .height($r('app.float.text_input_height'))
              .textAlign(TextAlign.Center)

            TextInput({placeholder:'XXX'})
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
                this.userId3 = value;
                this.userName = this.userId1 + this.userId2 + this.userId3;
              })
              .id("regUserId3")
              .onFocus(() => {
                sendEventByKey("regUserId3", 10, "")
              })
          }.width('80%')

          Text('あなたのパスワード')
            .width('80%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Start)
            .fontSize($r('app.float.register_success_text_font_size'))
            .fontColor($r('app.color.register_success_text_font'))
            .margin({ top: $r('app.float.register_success_text_margin_top') })

          TextInput({placeholder: 'あなたのパスワード'})
            .width('80%')
            .height($r('app.float.text_input_height'))
            .placeholderColor($r('app.color.text_input_place_holder'))
            .placeholderFont({ size: $r('app.float.text_input_font_size') })
            .fontSize($r('app.float.text_input_font_size'))
            .backgroundColor($r('app.color.login_input_text_background'))
            .type(InputType.Password)
            .padding({ left: $r('app.float.password_padding_left') })
            .border({
              width: { bottom: $r('app.float.input_border_width') },
              color: $r('app.color.input_border_color'),
              radius: $r('app.float.input_border_radius')
            })
            .margin({ bottom: $r('app.float.input_margin_bottom') })
            .onChange((value: string) => {
              this.password = value
            })

          Text('あなたのパスワード（確認）')
            .width('80%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Start)
            .fontSize($r('app.float.register_success_text_font_size'))
            .fontColor($r('app.color.register_success_text_font'))
            .margin({ top: $r('app.float.register_success_text_margin_top') })

          TextInput({placeholder: 'あなたのパスワード（確認）'})
            .width('80%')
            .height($r('app.float.text_input_height'))
            .placeholderColor($r('app.color.text_input_place_holder'))
            .placeholderFont({ size: $r('app.float.text_input_font_size') })
            .fontSize($r('app.float.text_input_font_size'))
            .backgroundColor($r('app.color.login_input_text_background'))
            .type(InputType.Password)
            .padding({ left: $r('app.float.password_padding_left') })
            .border({
              width: { bottom: $r('app.float.input_border_width') },
              color: $r('app.color.input_border_color'),
              radius: $r('app.float.input_border_radius')
            })
            .margin({ bottom: $r('app.float.input_margin_bottom') })
            .onChange((value: string) => {
              this.passwordConfirm = value
            })
        }
        .width(CommonConstants.REGISTRATION_PAGE_WIDTH_PERCENT)
        .height(CommonConstants.REGISTRATION_PAGE_HEIGHT_PERCENT)
        .justifyContent(FlexAlign.Center)
      }
      .layoutWeight(CommonConstants.SCROLL_LAYOUT_WEIGHT)

      Button('すでにユーザー登録済の方はこちら')
        .width("90%")
        .height($r('app.float.login_btn_height'))
        .fontSize($r('app.float.text_input_font_size'))
        .fontWeight(CommonConstants.BUTTON_FONT_WEIGHT)
        .borderRadius($r('app.float.register_btn_border_radius'))
        .margin({ top: $r('app.float.register_btn_margin_top') })
        .fontColor($r('app.color.register_font_clickable'))
        .backgroundColor($r('app.color.register_btn_clickable'))
        .onClick(() => {
          router.pushUrl({
            url: CommonConstants.HOME_PAGE_URL
          });
        }).margin({bottom: 10})

      Button('ユーザー登録します')
        .width("90%")
        .height($r('app.float.login_btn_height'))
        .fontSize($r('app.float.text_input_font_size'))
        .fontWeight(CommonConstants.BUTTON_FONT_WEIGHT)
        .borderRadius($r('app.float.register_btn_border_radius'))
        .margin({ top: $r('app.float.register_btn_margin_top') })
        .fontColor($r('app.color.login_font_normal'))
        .backgroundColor($r('app.color.login_btn_enabled'))
        .onClick(() => {
          if (this.userName.length == 0) {
            promptAction.showToast({
              message: 'ユーザーIDを入力してください。',
              duration:5000,
            });
          } else if (this.password.length == 0) {
            promptAction.showToast({
              message: 'パスワードを入力してください。',
              duration:5000,
            });
          } else if (this.passwordConfirm.length == 0) {
            promptAction.showToast({
              message: 'パスワード確認を入力してください。',
              duration:5000,
            });
          } else if (this.password != this.passwordConfirm) {
            promptAction.showToast({
              message: 'パスワードとパスワード確認不一致です。',
              duration:5000,
            });
          }

        }).margin({bottom: 10})
    }
  }


  @Builder Title() {
    Flex() {
      Stack({alignContent: Alignment.Top}) {
        Image($r('app.media.logo'))
          .width('100vp')
          .height('50vp')
          .margin({
            top: 5
          })
      }
      .height('100%')
      .layoutWeight(2)

    }
    .width('100%')
    .height('10%')
    .backgroundColor('#FF0CA91A')
  }


  @Builder background() {
    Stack({alignContent: Alignment.Center}) {
      Image($r('app.media.background'))
        .width('150vp')
        .height('150vp')
        .margin({
          left: $r('app.float.image_margin_left'),
          right: $r('app.float.image_margin_right')
        })

      Text('ラクゼンユーザー登録')
        .fontSize($r('app.float.title_text_size'))
        .fontColor($r('app.color.title'))
        .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
    }
    .backgroundImage($r('app.color.login_page_background'))
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height('40%')
  }
}