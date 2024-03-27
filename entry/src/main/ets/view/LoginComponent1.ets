
import router from '@ohos.router';
import http from '@ohos.net.http';
import { CommonConstants } from '../common/constants/CommonConstants';
import promptAction from '@ohos.promptAction';
import httpPost from '../common/utils/HttpUtil';

/**
 * Login page component.
 */
@Component
export struct LoginComponent1 {
  @StorageProp('isMinHeight') isMinHeight: boolean = false;
  @Link isLogged: boolean;
  @State userName: string = '';
  @State password: string = '';

  build() {
    GridRow({
      columns: {
        sm: CommonConstants.GRID_ROW_SM,
        md: CommonConstants.GRID_ROW_MD,
        lg: CommonConstants.GRID_ROW_LG
      },
      gutter: { x: CommonConstants.GUTTER_X },
      breakpoints: { value: CommonConstants.BREAK_POINT }
    }) {
      GridCol({
        span: {
          sm: CommonConstants.SPAN_SM,
          md: CommonConstants.SPAN_MD,
          lg: CommonConstants.SPAN_LG
        },
        offset: {
          sm: CommonConstants.OFFSET_SM,
          md: CommonConstants.OFFSET_MD,
          lg: CommonConstants.OFFSET_LG
        }
      }) {
        Column() {
          TextInput({ placeholder: $r('app.string.username'), text: '08000000001' })
            .width(CommonConstants.TEXT_INPUT_WIDTH_PERCENT)
            .height($r('app.float.text_input_height'))
            .placeholderColor($r('app.color.text_input_place_holder'))
            .placeholderFont({ size: $r('app.float.text_input_font_size') })
            .backgroundColor($r('app.color.login_input_text_background'))
            .fontSize($r('app.float.text_input_font_size'))
            .padding({ left: $r('app.float.username_padding_left') })
            .border({
              width: { bottom: $r('app.float.input_border_width') },
              color: $r('app.color.input_border_color'),
              radius: $r('app.float.input_border_radius')
            })
            .type(InputType.PhoneNumber)
            .onChange((value: string) => {
              this.userName = value;
            })

          TextInput({ placeholder: $r('app.string.password'), text: '1234' })
            .width(CommonConstants.TEXT_INPUT_WIDTH_PERCENT)
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
        }
      }

      GridCol({
        span: {
          sm: CommonConstants.BUTTON_SPAN_SM,
          md: this.isMinHeight ? CommonConstants.BUTTON_SPAN_MD_SMALL : CommonConstants.BUTTON_SPAN_MD_BIG,
          lg: CommonConstants.BUTTON_SPAN_LG
        },
        offset: {
          sm: CommonConstants.BUTTON_OFFSET_SM,
          md: this.isMinHeight ? CommonConstants.BUTTON_OFFSET_SM : CommonConstants.BUTTON_OFFSET_MD,
          lg: CommonConstants.BUTTON_OFFSET_LG
        }
      }) {
        Button($r('app.string.register'))
          .width(CommonConstants.BUTTON_WIDTH_PERCENT)
          .height($r('app.float.login_btn_height'))
          .fontSize($r('app.float.text_input_font_size'))
          .fontWeight(CommonConstants.BUTTON_FONT_WEIGHT)
          .borderRadius($r('app.float.register_btn_border_radius'))
          .margin({ top: $r('app.float.register_btn_margin_top') })
          .fontColor($r('app.color.register_font_clickable'))
          .backgroundColor($r('app.color.register_btn_clickable'))
          .onClick(() => {
            router.pushUrl({
              url: CommonConstants.REGISTRATION_SUCCESS_PAGE_URL
            });
          })
      }

      GridCol({
        span: {
          sm: CommonConstants.BUTTON_SPAN_SM,
          md: this.isMinHeight ? CommonConstants.BUTTON_SPAN_MD_SMALL : CommonConstants.BUTTON_SPAN_MD_BIG,
          lg: CommonConstants.BUTTON_SPAN_LG
        },
        offset: {
          sm: CommonConstants.BUTTON_OFFSET_SM,
          md: CommonConstants.BUTTON_OFFSET_MD,
          lg: CommonConstants.BUTTON_OFFSET_LG
        }
      }) {
        Button($r('app.string.login'))
          .width(CommonConstants.BUTTON_WIDTH_PERCENT)
          .height($r('app.float.login_btn_height'))
          .borderRadius($r('app.float.login_btn_border_radius'))
          .fontSize($r('app.float.text_input_font_size'))
          .margin({ top: $r('app.float.register_btn_margin_top') })
          .fontWeight(CommonConstants.LOGIN_TEXT_FONT_WEIGHT)
          .enabled(isLoginButtonClickable(this.userName, this.password))
          .fontColor(isLoginButtonClickable(this.userName, this.password) ?
          Color.White : $r('app.color.login_font_normal'))
          .backgroundColor(isLoginButtonClickable(this.userName, this.password) ?
          $r('app.color.login_btn_enabled') : $r('app.color.login_btn_normal'))
          .onClick(() => {
            // login(this.userName, this.password)

            let bodyData = {
              "username": this.userName,
              "password": this.password
            };
            let response =  httpPost("https://stg.rakuzen-plus.com/api/login", bodyData);

            response.then((data) => {
              let code = JSON.parse(data.result.toString()).code;
              console.info('myTest-Result:' + data.result);
              if (data.responseCode == 200 && code == 200) {
                this.isLogged = true;
              } else {
                promptAction.showToast({
                  message: 'ユーザー名またはパスワードが不正です。',
                  duration:5000,
                });
              }
            }).catch((err) => {
              console.info('myTest-error:' + JSON.stringify(err));
            });
          })
      }
    }
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

async function login(userName: string, password: string): Promise<void> {
  let isSuccess: boolean = false;

  try {
    let bodyData = {
      "username": userName,
      "password": password
    };
    let response = await httpPost("https://stg.rakuzen-plus.com/api/login", bodyData);
    if (response && response.responseCode === http.ResponseCode.OK) {
      let code = JSON.parse(response.result.toString()).code;
      console.info('myTest-Result:' + response.result);
      if (code === 200) {
        isSuccess = true;
      }
    }
  } catch (error) {
    console.error(error);
  }

  if (isSuccess) {
    router.pushUrl({
      url: CommonConstants.HOME_PAGE_URL
    });
    router.clear();
  } else {
    promptAction.showToast({
      message: 'ユーザー名またはパスワードが不正です。',
      duration:5000,
    });
  }


  // let httpRequest = http.createHttp();
  // httpRequest.on('headersReceive', (header) => {
  //   console.info('myTest-header: ' + JSON.stringify(header));
  // });
  //
  // let response = await httpRequest.request(
  //   "https://stg.rakuzen-plus.com/api/login",
  //   {
  //     method: http.RequestMethod.POST,
  //     header: {
  //       'Content-Type': 'application/json'
  //     },
  //     extraData: {
  //       "username": userName,
  //       "password": password
  //     },
  //     connectTimeout: 60000, // 可选，默认为60s
  //     readTimeout: 60000, // 可选，默认为60s
  //   });
  // console.info('myTest-Result:' + response);
  //
  //
  //
  // response.then((data) => {
  //   let code = JSON.parse(data.result.toString()).code;
  //   console.info('myTest-Result:' + data.result);
  //   if (data.responseCode == 200 && code == 200) {
  //     result = true;
  //   }
  // }).catch((err) => {
  //   console.info('myTest-error:' + JSON.stringify(err));
  //   httpRequest.destroy();
  // });




  // httpRequest.request(
  //   "https://stg.rakuzen-plus.com/api/login",
  //   {
  //     method: http.RequestMethod.POST,
  //     header: {
  //       'Content-Type': 'application/json'
  //     },
  //     extraData: {
  //       "username": userName,
  //       "password": password
  //     },
  //     connectTimeout: 60000, // 可选，默认为60s
  //     readTimeout: 60000, // 可选，默认为60s
  //   }, (err, data) => {
  //     if (!err) {
  //       let code = JSON.parse(data.result.toString()).code;
  //       if (data.responseCode == 200 && code == 200) {
  //         result = true;
  //       }
  //       // data.result为http响应内容，可根据业务需要进行解析
  //       console.info('myTest-data:' + data);
  //       console.info('myTest-Result:' + JSON.parse(data.result.toString()).code);
  //       console.info('myTest-code:' + data.responseCode);
  //       // data.header为http响应头，可根据业务需要进行解析
  //       // console.info('myTest-header:' + JSON.stringify(data.header));
  //       // console.info('myTest-cookies:' + data.cookies); // 8+
  //     } else {
  //       console.info('myTest-error:' + JSON.stringify(err));
  //       // 该请求不再使用，调用destroy方法主动销毁。
  //       httpRequest.destroy();
  //     }
  // });
  // return result;
}