import { CommonConstants } from '../common/constants/CommonConstants';
import deviceInfo from '@ohos.deviceInfo';
import router from '@ohos.router';
import preferenceUtil from '../common/utils/PreferencesUtil';
import promptAction from '@ohos.promptAction';
import { ApiResult } from '../common/http/ApiResult';
import { loginApi } from '../api/LoginApi';
import Logger from '../common/utils/Logger';
import { imageApi } from '../api/ImageApi';
import { ImageDLRequest } from '../api/request/ImageDLRequest';
import image from '@ohos.multimedia.image';


@Component
export struct LoginPage {
  @Link isLogged: boolean;
  @StorageProp('isMinHeight') isMinHeight: boolean = false;
  @State userName: string = '';
  @State password: string = '';
  userId1: string = '';
  userId2: string = '';
  userId3: string = '';

  aboutToAppear() {
    Logger.debug("=========deviceType:" + deviceInfo.deviceType)
    Logger.debug("=========manufacture:" + deviceInfo.manufacture)
    Logger.debug("=========brand:" + deviceInfo.brand)
    Logger.debug("=========osFullName:" + deviceInfo.osFullName)
    Logger.debug("=========sdkApiVersion:" + deviceInfo.sdkApiVersion)
    Logger.debug("=========versionId:" + deviceInfo.versionId)
    Logger.debug("=========udid:" + deviceInfo.udid)
    Logger.debug("=========hardwareModel:" + deviceInfo.hardwareModel)
    Logger.debug("=========productSeries:" + deviceInfo.productSeries)
  }

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
            TextInput({placeholder:'XXX', text:'080'})
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
                  focusControl.requestFocus('userId2')
                }
              })
              .id("userId1")

            Text('ー')
              .width(10)
              .height($r('app.float.text_input_height'))
              .textAlign(TextAlign.Center)

            TextInput({placeholder:'XXXX', text:'0000'})
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
                  focusControl.requestFocus('userId3')
                }
              })
              .id("userId2")
              .onFocus(() => {
                setTimeout(() => {
                  sendEventByKey("userId2", 10, "")
                }, 100)
              })

            Text('ー')
              .width(10)
              .height($r('app.float.text_input_height'))
              .textAlign(TextAlign.Center)

            TextInput({placeholder:'XXXX', text:'0001'})
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
                this.userId3 = value;
                this.userName = this.userId1 + this.userId2 + this.userId3;
              })
              .id("userId3")
              .onFocus(() => {
                setTimeout(() => {
                  sendEventByKey("userId3", 10, "")
                }, 100)
              })
          }.width('80%')

          Text('パスワード')
            .width('80%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Start)
            .fontSize($r('app.float.register_success_text_font_size'))
            .fontColor($r('app.color.register_success_text_font'))
            .margin({ top: $r('app.float.register_success_text_margin_top') })

          TextInput({placeholder: 'パスワード', 'text': "1234"})
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
              this.password = value;
            })

          Text('IDまたはパスワードを忘れた方はこちら')
            .width('80%')
            .height($r('app.float.jump_mine_page_text_height'))
            .textAlign(TextAlign.Start)
            .fontSize($r('app.float.jump_text_font_size'))
            .fontColor($r('app.color.jump_text_font'))
            .onClick(() => {
              router.replaceUrl({
                url: CommonConstants.MINE_PAGE_URL
              });
            }).margin({bottom: '10%'})
        }
        .width(CommonConstants.REGISTRATION_PAGE_WIDTH_PERCENT)
        .height(CommonConstants.REGISTRATION_PAGE_HEIGHT_PERCENT)
        .justifyContent(FlexAlign.Center)
      }
      .layoutWeight(CommonConstants.SCROLL_LAYOUT_WEIGHT)

      Button('ユーザー登録し直しの方はこちら')
        .width('90%')
        .height($r('app.float.login_btn_height'))
        .fontSize($r('app.float.text_input_font_size'))
        .fontWeight(CommonConstants.BUTTON_FONT_WEIGHT)
        .borderRadius($r('app.float.register_btn_border_radius'))
        .margin({ top: $r('app.float.register_btn_margin_top') })
        .fontColor($r('app.color.register_font_clickable'))
        .backgroundColor($r('app.color.register_btn_clickable'))
        .onClick(() => {
          router.pushUrl({
            url: CommonConstants.REGISTER_PAGE_URL
          });
        }).margin({bottom: 10})

      Button('ログイン')
        .width('90%')
        .height($r('app.float.login_btn_height'))
        .fontSize($r('app.float.text_input_font_size'))
        .fontWeight(CommonConstants.BUTTON_FONT_WEIGHT)
        .borderRadius($r('app.float.register_btn_border_radius'))
        .margin({ top: $r('app.float.register_btn_margin_top') })
        .fontColor($r('app.color.login_font_normal'))
        .backgroundColor($r('app.color.login_btn_enabled'))
        .onClick(() => {
          if (!isLoginButtonClickable(this.userName, this.password)) {
            promptAction.showToast({
              message: 'ユーザー名またはパスワードを入力してください。',
              duration:5000,
            });
          } else {
            loginApi.login(this.userName, this.password).then((result: ApiResult) => {
              if (result.code == 200) {
                Logger.info("LoginPage", JSON.stringify(result.data))
                preferenceUtil.set("token", "Bearer " + result.data.token)
                preferenceUtil.set("userName", result.data.name)
                preferenceUtil.set("isLogged", true)
                this.isLogged = true;
              } else {
                promptAction.showToast({
                  message: 'ユーザー名またはパスワードが不正です。',
                  duration:5000,
                });
              }
            })
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

      Text('ログイン')
        .fontSize($r('app.float.title_text_size'))
        .fontColor($r('app.color.title'))
        .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
    }
    .backgroundImage($r('app.color.login_page_background'))
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height('40%')
  }
}

/**
 * Calculate login button clickable by the input of username and password.
 *
 * @return {boolean} isLoginButtonClickable.
 */
function isLoginButtonClickable(userName: string, password: string): boolean {
  return userName !== '' && password !== '';
}