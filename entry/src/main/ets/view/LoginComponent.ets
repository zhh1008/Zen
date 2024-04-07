// import deviceInfo from '@ohos.deviceInfo';
// import router from '@ohos.router';
// import promptAction from '@ohos.promptAction';
// import { CommonConstants } from '../common/constants/CommonConstants';
// import httpPost from '../common/utils/HttpUtil';
// import { PrivacyStatementComponent } from './PrivacyStatementComponent';
// import preferenceUtils from '../common/utils/PreferencesUtil';
//
// import { ApiResult } from '../common/http/ApiResult';
// import { loginApi } from '../api/LoginApi';
//
// /**
//  * Login page component.
//  */
// @Component
// export struct LoginComponent {
//   @Link isLogged: boolean;
//   @StorageProp('isMinHeight') isMinHeight: boolean = false;
//   @State userName: string = '';
//   @State password: string = '';
//
//   aboutToAppear() {
//     console.info("=========deviceType:" + deviceInfo.deviceType)
//     console.info("=========manufacture:" + deviceInfo.manufacture)
//     console.info("=========brand:" + deviceInfo.brand)
//     console.info("=========osFullName:" + deviceInfo.osFullName)
//     console.info("=========sdkApiVersion:" + deviceInfo.sdkApiVersion)
//     console.info("=========versionId:" + deviceInfo.versionId)
//     console.info("=========udid:" + deviceInfo.udid)
//     console.info("=========hardwareModel:" + deviceInfo.hardwareModel)
//     console.info("=========productSeries:" + deviceInfo.productSeries)
//   }
//
//   build() {
//     Column() {
//       this.Title()
//
//       Flex({justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center}) {
//         Column() {
//           this.Content()
//
//           Blank()
//
//           PrivacyStatementComponent()
//         }
//         .height(CommonConstants.SCROLL_HEIGHT_PERCENT)
//         .constraintSize({ minHeight: $r('app.float.scroll_min_height') })
//         .alignItems(HorizontalAlign.Start)
//         .padding($r('app.float.login_operation_area_padding'))
//       }
//       .layoutWeight(CommonConstants.LOGIN_SCROLL_LAYOUT_WEIGHT)
//     }
//     .width(CommonConstants.LOGIN_PAGE_WIDTH_PERCENT)
//   }
//
//   @Builder Title() {
//     Stack({alignContent: Alignment.Center}) {
//       Image($r('app.media.background'))
//         .width('150vp')
//         .height('150vp')
//         .margin({
//           left: $r('app.float.image_margin_left'),
//           right: $r('app.float.image_margin_right')
//         })
//
//       // Text('ログイン')
//       //   .fontSize($r('app.float.title_text_size'))
//       //   .fontColor($r('app.color.title'))
//       //   .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
//     }
//     .backgroundImage($r('app.color.login_page_background'))
//     .width(CommonConstants.FULL_WIDTH_PERCENT)
//     .height('40%')
//   }
//
//   @Builder Content() {
//     GridRow({
//       columns: {
//         sm: CommonConstants.GRID_ROW_SM,
//         md: CommonConstants.GRID_ROW_MD,
//         lg: CommonConstants.GRID_ROW_LG
//       },
//       gutter: { x: CommonConstants.GUTTER_X },
//       breakpoints: { value: CommonConstants.BREAK_POINT }
//     }) {
//       GridCol({
//         span: {
//           sm: CommonConstants.SPAN_SM,
//           md: CommonConstants.SPAN_MD,
//           lg: CommonConstants.SPAN_LG
//         },
//         offset: {
//           sm: CommonConstants.OFFSET_SM,
//           md: CommonConstants.OFFSET_MD,
//           lg: CommonConstants.OFFSET_LG
//         }
//       }) {
//         Column() {
//           TextInput({ placeholder: $r('app.string.username'), text: '08000000001' })
//             .width(CommonConstants.TEXT_INPUT_WIDTH_PERCENT)
//             .height($r('app.float.text_input_height'))
//             .placeholderColor($r('app.color.text_input_place_holder'))
//             .placeholderFont({ size: $r('app.float.text_input_font_size') })
//             .backgroundColor($r('app.color.login_input_text_background'))
//             .fontSize($r('app.float.text_input_font_size'))
//             .padding({ left: $r('app.float.username_padding_left') })
//             .border({
//               width: { bottom: $r('app.float.input_border_width') },
//               color: $r('app.color.input_border_color'),
//               radius: $r('app.float.input_border_radius')
//             })
//             .type(InputType.PhoneNumber)
//             .onChange((value: string) => {
//               this.userName = value;
//             })
//
//           TextInput({ placeholder: $r('app.string.password'), text: '1234' })
//             .width(CommonConstants.TEXT_INPUT_WIDTH_PERCENT)
//             .height($r('app.float.text_input_height'))
//             .placeholderColor($r('app.color.text_input_place_holder'))
//             .placeholderFont({ size: $r('app.float.text_input_font_size') })
//             .fontSize($r('app.float.text_input_font_size'))
//             .backgroundColor($r('app.color.login_input_text_background'))
//             .type(InputType.Password)
//             .padding({ left: $r('app.float.password_padding_left') })
//             .border({
//               width: { bottom: $r('app.float.input_border_width') },
//               color: $r('app.color.input_border_color'),
//               radius: $r('app.float.input_border_radius')
//             })
//             .margin({ bottom: $r('app.float.input_margin_bottom') })
//             .onChange((value: string) => {
//               this.password = value;
//             })
//         }
//       }
//
//       GridCol({
//         span: {
//           sm: CommonConstants.BUTTON_SPAN_SM,
//           md: this.isMinHeight ? CommonConstants.BUTTON_SPAN_MD_SMALL : CommonConstants.BUTTON_SPAN_MD_BIG,
//           lg: CommonConstants.BUTTON_SPAN_LG
//         },
//         offset: {
//           sm: CommonConstants.BUTTON_OFFSET_SM,
//           md: this.isMinHeight ? CommonConstants.BUTTON_OFFSET_SM : CommonConstants.BUTTON_OFFSET_MD,
//           lg: CommonConstants.BUTTON_OFFSET_LG
//         }
//       }) {
//         Button($r('app.string.register'))
//           .width(CommonConstants.BUTTON_WIDTH_PERCENT)
//           .height($r('app.float.login_btn_height'))
//           .fontSize($r('app.float.text_input_font_size'))
//           .fontWeight(CommonConstants.BUTTON_FONT_WEIGHT)
//           .borderRadius($r('app.float.register_btn_border_radius'))
//           .margin({ top: $r('app.float.register_btn_margin_top') })
//           .fontColor($r('app.color.register_font_clickable'))
//           .backgroundColor($r('app.color.register_btn_clickable'))
//           .onClick(() => {
//             router.pushUrl({
//               url: CommonConstants.REGISTRATION_SUCCESS_PAGE_URL
//             });
//           })
//       }
//
//       GridCol({
//         span: {
//           sm: CommonConstants.BUTTON_SPAN_SM,
//           md: this.isMinHeight ? CommonConstants.BUTTON_SPAN_MD_SMALL : CommonConstants.BUTTON_SPAN_MD_BIG,
//           lg: CommonConstants.BUTTON_SPAN_LG
//         },
//         offset: {
//           sm: CommonConstants.BUTTON_OFFSET_SM,
//           md: CommonConstants.BUTTON_OFFSET_MD,
//           lg: CommonConstants.BUTTON_OFFSET_LG
//         }
//       }) {
//         Button($r('app.string.login'))
//           .width(CommonConstants.BUTTON_WIDTH_PERCENT)
//           .height($r('app.float.login_btn_height'))
//           .borderRadius($r('app.float.login_btn_border_radius'))
//           .fontSize($r('app.float.text_input_font_size'))
//           .margin({ top: $r('app.float.register_btn_margin_top') })
//           .fontWeight(CommonConstants.LOGIN_TEXT_FONT_WEIGHT)
//           .enabled(isLoginButtonClickable(this.userName, this.password))
//           .fontColor(isLoginButtonClickable(this.userName, this.password) ?
//           Color.White : $r('app.color.login_font_normal'))
//           .backgroundColor(isLoginButtonClickable(this.userName, this.password) ?
//           $r('app.color.login_btn_enabled') : $r('app.color.login_btn_normal'))
//           .onClick(() => {
//             // login(this.userName, this.password)
//
//             loginApi.login(this.userName, this.password).then((result: ApiResult) => {
//               console.log(result.data)
//             })
//
//             let bodyData = {
//               "username": this.userName,
//               "password": this.password
//             };
//             let response =  httpPost("https://stg.rakuzen-plus.com/api/login", bodyData);
//
//             response.then((data) => {
//               let jsonData = JSON.parse(data.result.toString());
//               let code = jsonData.code;
//               let token = jsonData.data.token;
//               console.info('myTest-Result:' + data.result);
//               PersistentStorage.PersistProp('token', "Bearer " + token);
//               PersistentStorage.PersistProp('name', jsonData.data.name)
//               preferenceUtils.set("token", "Bearer " + token)
//               preferenceUtils.set("userName", jsonData.data.name)
//               if (data.responseCode == 200 && code == 200) {
//                 this.isLogged = true;
//               } else {
//                 promptAction.showToast({
//                   message: 'ユーザー名またはパスワードが不正です。',
//                   duration:5000,
//                 });
//               }
//             }).catch((err) => {
//               console.info('myTest-error:' + JSON.stringify(err));
//             });
//           })
//       }
//     }
//   }
// }
//
// /**
//  * Calculate login button clickable by the input of username and password.
//  *
//  * @return {boolean} isLoginButtonClickable.
//  */
// function isLoginButtonClickable(userName: string, password: string): boolean {
//   return userName !== '' && password !== '';
// }