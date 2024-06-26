
import common from '@ohos.app.ability.common';
import router from '@ohos.router';
import { CommonConstants } from '../common/constants/CommonConstants'
import { MediaBean, MediaHelper, MediaOption } from '../helepr/MediaHelper';
import { CompanyInfo } from '../model/CompanyInfo';

@Component
export struct CompanyComponent {
  @Consume companyInfo: CompanyInfo;
  private mediaHelper: MediaHelper = new MediaHelper(getContext());
  @State mediaBean: MediaBean = new MediaBean();
  @State workTypeNames: string = "";

  async aboutToAppear() {
    this.workTypeNames = this.companyInfo.getWorkerTypeNames()
  }

  async handleClick(option: MediaOption) {
    let mediaBean: MediaBean;
    switch (option) {
      case MediaOption.Picture:
        mediaBean = await this.mediaHelper.selectPicture();
        break;
      case MediaOption.File:
        mediaBean = await this.mediaHelper.selectFile();
        break;
      case MediaOption.TakePhoto:
        mediaBean = await this.mediaHelper.takePhoto(getContext() as common.UIAbilityContext);
        break;
      default:
        break;
    }

    if (mediaBean) {
      this.mediaBean = mediaBean;
    }
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {

      Flex({ direction: FlexDirection.Column }) {

        Column() {
          Text("会社情報")
            .width('100%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Center)
            .fontSize('20fp')
            .fontColor($r('app.color.register_success_text_font'))
            .height('50vp')
        }
        .alignItems(HorizontalAlign.End)

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
                  Text(this.companyInfo.licenseId)
                    .width('80%')
                    .height($r('app.float.text_input_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize('20fp')
                    .fontColor($r('app.color.register_success_text_font'))
                    .backgroundColor("#ffd7d6d6")
                    .border({
                      color: $r('app.color.input_border_color'),
                      radius: 10
                    })

                  Text('代表者電話番号（契約者ID）')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Text(this.companyInfo.contrId)
                    .width('80%')
                    .height($r('app.float.text_input_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize('20fp')
                    .fontColor($r('app.color.register_success_text_font'))
                    .backgroundColor("#ffd7d6d6")
                    .border({
                      color: $r('app.color.input_border_color'),
                      radius: 10
                    })

                  Text('ラクゼンご契約種別')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Text(this.companyInfo.contrType)
                    .width('80%')
                    .height($r('app.float.text_input_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize('20fp')
                    .backgroundColor("#ffd7d6d6")
                    .border({
                      color: $r('app.color.input_border_color'),
                      radius: 10
                    })

                  Text('会社名')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Text(this.companyInfo.companyName)
                    .width('80%')
                    .height($r('app.float.text_input_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize('20fp')
                    .backgroundColor("#ffd7d6d6")
                    .border({
                      color: $r('app.color.input_border_color'),
                      radius: 10
                    })


                  Text('代表者名')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Text(this.companyInfo.presName)
                    .width('80%')
                    .height($r('app.float.text_input_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize('20fp')
                    .backgroundColor("#ffd7d6d6")
                    .border({
                      color: $r('app.color.input_border_color'),
                      radius: 10
                    })


                  Text('会社住所')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Text(this.companyInfo.companyAddr)
                    .width('80%')
                    .height($r('app.float.text_input_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize('20fp')
                    .backgroundColor("#ffd7d6d6")
                    .border({
                      color: $r('app.color.input_border_color'),
                      radius: 10
                    })


                  Text('会社電話番号')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  TextInput({ placeholder: '会社電話番号', text: this.companyInfo.companyTel })
                    .width('80%')
                    .height($r('app.float.text_input_height'))
                    .placeholderColor($r('app.color.text_input_place_holder'))
                    .placeholderFont({ size: $r('app.float.text_input_font_size') })
                    .fontSize($r('app.float.text_input_font_size'))
                    .backgroundColor($r('app.color.login_input_text_background'))
                    .padding({ left: $r('app.float.password_padding_left') })
                    .border({
                      width: "1vp",
                      color: $r('app.color.input_border_color'),
                      radius: 10
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
                  Text(this.companyInfo.presEmail)
                    .width('80%')
                    .height($r('app.float.text_input_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize('20fp')
                    .backgroundColor("#ffd7d6d6")
                    .border({
                      color: $r('app.color.input_border_color'),
                      radius: 10
                    })


                  Text('印影')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Image(this.mediaBean.localUrl)
                    .width(300)
                    .height(300)
                    .backgroundColor(Color.Grey)
                    .onClick(() => {
                      ActionSheet.show({
                        title: "",
                        message: "",
                        autoCancel: false,
                        alignment: DialogAlignment.Center,
                        offset: {dx: 0, dy: -30},
                        confirm: {
                          value: 'キャンセル',
                          action: () => {
                          }
                        },
                        sheets: [
                          {
                            title: 'カメラ',
                            action: () => {
                              this.handleClick(MediaOption.TakePhoto);
                            }
                          },
                          {
                            title: '写真ライブラリ',
                            action: () => {
                              this.handleClick(MediaOption.Picture);
                            }
                          }
                        ]
                      })
                    })


                  Text('工種')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Row() {
                    Row() {
                      TextArea({text: this.workTypeNames})
                        .width('100%')
                        .height('auto')
                        .textAlign(TextAlign.Start)
                        .fontSize('20fp')
                        .fontColor($r('app.color.register_success_text_font'))
                        .backgroundColor("#ffd7d6d6")
                        .enabled(false)
                    }
                    .width("95%")
                    Blank()
                      .layoutWeight(1)
                    Image($r('app.media.right_grey')).width(8).height(16)
                  }
                  .onClick(() => {
                    router.pushUrl({url: CommonConstants.WORK_TYPE_LIST_PAGE_URL, params: this.companyInfo})
                  })
                  .width("80%")
                  .justifyContent(FlexAlign.SpaceBetween)
                  .backgroundColor("#ffd7d6d6")
                  .border({
                    color: $r('app.color.input_border_color'),
                    radius: 10
                  })


                  Text('建設業許可証')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Row() {
                    Row() {
                      Text("pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp").height($r('app.float.text_input_height')).fontSize($r('app.float.text_input_font_size')).fontColor($r('app.color.register_success_text_font'))
                    }
                    .width("95%")
                    Blank()
                      .layoutWeight(1)
                    Image($r('app.media.right_grey')).width(8).height(16)
                  }
                  .width("80%")
                  .justifyContent(FlexAlign.SpaceBetween)
                  .backgroundColor("#ffd7d6d6")
                  .border({
                    color: $r('app.color.input_border_color'),
                    radius: 10
                  })

                  Text('健康保険')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Row() {
                    Row() {
                      Text("任务编辑页由上方的“编辑任务”标题以及返回按钮，主体内容的List配置项和下方的完成按钮组成主体内容的List配置项和下方的完成按钮组成主体内容的List配置项和下方的完成按钮组成").height($r('app.float.text_input_height')).fontSize($r('app.float.text_input_font_size')).fontColor($r('app.color.register_success_text_font'))
                    }
                    .width("95%")
                    Blank()
                      .layoutWeight(1)
                    Image($r('app.media.right_grey')).width(8).height(16)
                  }
                  .width("80%")
                  .justifyContent(FlexAlign.SpaceBetween)
                  .backgroundColor("#ffd7d6d6")
                  .border({
                    color: $r('app.color.input_border_color'),
                    radius: 10
                  })


                  Text('厚生年金保険')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Row() {
                    Row() {
                      Text().height($r('app.float.text_input_height')).fontSize($r('app.float.text_input_font_size'))
                    }
                    .width("95%")
                    Blank()
                      .layoutWeight(1)
                    Image($r('app.media.right_grey')).width(8).height(16)
                  }
                  .width("80%")
                  .justifyContent(FlexAlign.SpaceBetween)
                  .backgroundColor("#ffd7d6d6")
                  .border({
                    color: $r('app.color.input_border_color'),
                    radius: 10
                  })


                  Text('雇用保険')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Row() {
                    Row() {
                      Text().height($r('app.float.text_input_height')).fontSize($r('app.float.text_input_font_size'))
                    }
                    .width("95%")
                    Blank()
                      .layoutWeight(1)
                    Image($r('app.media.right_grey')).width(8).height(16)
                  }
                  .width("80%")
                  .justifyContent(FlexAlign.SpaceBetween)
                  .backgroundColor("#ffd7d6d6")
                  .border({
                    color: $r('app.color.input_border_color'),
                    radius: 10
                  })


                  Text('工事用車輌情報')
                    .width('80%')
                    .height($r('app.float.register_success_text_height'))
                    .textAlign(TextAlign.Start)
                    .fontSize("12fp")
                    .fontColor($r('app.color.register_success_text_font'))
                    .margin({ top: $r('app.float.register_success_text_margin_top') })
                  Row() {
                    Row() {
                      Text().height($r('app.float.text_input_height')).fontSize($r('app.float.text_input_font_size'))
                    }
                    .width("95%")
                    Blank()
                      .layoutWeight(1)
                    Image($r('app.media.right_grey')).width(8).height(16)
                  }
                  .width("80%")
                  .justifyContent(FlexAlign.SpaceBetween)
                  .backgroundColor("#ffd7d6d6")
                  .border({
                    color: $r('app.color.input_border_color'),
                    radius: 10
                  })
                }
              }
            }
          }
          .flexGrow(CommonConstants.FLEX_GROW)
          .align(Alignment.TopStart)
      }
    }
  }
}