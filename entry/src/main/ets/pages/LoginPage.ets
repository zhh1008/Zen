// import { CommonConstants } from '../common/constants/CommonConstants';
// import { PrivacyStatementComponent } from '../view/PrivacyStatementComponent';
// import { LoginComponent } from '../view/LoginComponent';
// import deviceInfo from '@ohos.deviceInfo';
//
// /**
//  * This template implements the Login function.
//  * First register personal details. Log in after entering the username and password.
//  * Click the button at the bottom to ask for help and check the privacy statement.
//  * Developers can save username and password by Preference or Relational Database.
//  */
// // @Entry
// @Component
// export struct LoginPage {
//   @Link isLogged: boolean;
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
//
//
//   }
//
//   build() {
//     Column() {
//       this.Title()
//
//       Flex({justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center}) {
//         Column() {
//           LoginComponent({isLogged: $isLogged})
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
//    @Builder Title() {
//     Stack({alignContent: Alignment.Center}) {
//       Image($r('app.media.background'))
//         .width('150vp')
//         .height('150vp')
//         .margin({
//           left: $r('app.float.image_margin_left'),
//           right: $r('app.float.image_margin_right')
//         })
//
//
//        Text('ログイン')
//         .fontSize($r('app.float.title_text_size'))
//         .fontColor($r('app.color.title'))
//         .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
//     }
//     .backgroundImage($r('app.color.login_page_background'))
//     .width(CommonConstants.FULL_WIDTH_PERCENT)
//     .height('50%')
//   }
//
//   // @Builder Title() {
//   //   Row() {
//   //     Image($r('app.media.ic_back'))
//   //       .width($r('app.float.image_size'))
//   //       .height($r('app.float.image_size'))
//   //       .margin({
//   //         left: $r('app.float.image_margin_left'),
//   //         right: $r('app.float.image_margin_right')
//   //       })
//   //       .onClick(() => {
//   //         router.back();
//   //       })
//   //
//   //     Text($r('app.string.title'))
//   //       .fontSize($r('app.float.title_text_size'))
//   //       .fontColor($r('app.color.title'))
//   //       .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
//   //   }
//   //   .width(CommonConstants.FULL_WIDTH_PERCENT)
//   //   .height($r('app.float.title_height'))
//   //   .backgroundImage($r("app.media.background"))
//   // }
// }