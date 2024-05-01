
import router from '@ohos.router';
import { CommonApi } from '../api/CommonApi';
import { EmployeeRequest } from '../api/request/EmployeeRequest';
import { UserApi } from '../api/UserApi';
import CommonUtils from '../common/CommonUtils';
import { CommonConstants } from '../common/constants/CommonConstants';
import StringUtils from '../common/utils/StringUtils';
import { EmployeeInfoDto } from '../model/EmployeeInfoDto';
import { MasterDto } from '../model/MasterDto';
import { UserDto } from '../model/UserDto';

let storage: LocalStorage = LocalStorage.GetShared()

@Entry(storage)
@Component
export struct CompanyInfoPage {
  @State handlePopup: boolean = false
  @LocalStorageProp("company") company: any = {};
  @LocalStorageProp("dict") dict: MasterDto = new MasterDto();
  private currentDate: Date = new Date();
  private userId: number = router.getParams()['userId'] as number
  @State userDto: UserDto = new UserDto()
  @State employeeInfoDto: EmployeeInfoDto = new EmployeeInfoDto()
  @State companyManager: boolean = false;
  @State kentaikyoTetyou: boolean = false;
  liveAddressController: CustomDialogController = new CustomDialogController({
    builder: TextInputDialog({
      confirm:(value) => {
        (new CommonApi()).getByZipCode(value).then((data) => {
          if (data['status'] == 200) {
            this.userDto.liveAddress = "〒" + data['results'][0]['zipcode'] + data['results'][0]['address1'] + data['results'][0]['address2'] + data['results'][0]['address3']
          }
        })
      }
    }),
    alignment: DialogAlignment.Center,
    offset: {dx:0, dy: -30}
  })

  emergencyContactAddressController: CustomDialogController = new CustomDialogController({
    builder: TextInputDialog({
      confirm:(value) => {
        (new CommonApi()).getByZipCode(value).then((data) => {
          if (data['status'] == 200) {
            this.employeeInfoDto.emergencyContactAddress = "〒" + data['results'][0]['zipcode'] + data['results'][0]['address1'] + data['results'][0]['address2'] + data['results'][0]['address3']
          }
        })
      }
    }),
    alignment: DialogAlignment.Center,
    offset: {dx:0, dy: -30}
  })

  async aboutToAppear() {
    let userInfoJsonData = await (new UserApi()).userInfo(new EmployeeRequest(this.userId));
    this.userDto = new UserDto(userInfoJsonData.data['userInfo'])
    this.employeeInfoDto = new EmployeeInfoDto(userInfoJsonData.data['employeeInfo']);
    this.companyManager = this.userDto.roleId == '5' ? true : false;
    this.kentaikyoTetyou = this.employeeInfoDto.kentaikyoTetyou == '1' ? true : false;
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {

      Flex({ direction: FlexDirection.Column }) {
        this.Title()

        Column() {
          Text("ユーザー情報")
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

                Marquee({
                  start: true,
                  step: 10,
                  loop: 0,
                  fromStart: true,
                  src: "前回の健康診断から1年以上経過しています！"
                })
                  .width('80%')
                  .height(50)
                  .fontColor('#fffd0303')
                  .fontSize(48)
                  .backgroundColor('#fff6d903')
                  .margin({ bottom: 40 })


                this.CustomText('ID')
                Text(this.userDto.username).customTextStyles()

                if (this.userDto.contrFlg != '1') {
                  Column() {
                    Row() {
                      Text('企業管理者').fontSize(20)
                      Blank()
                        .layoutWeight(1)
                      Toggle({ type: ToggleType.Switch, isOn: this.companyManager })
                        .size({ width: 80, height: 40 })
                        .selectedColor('#007DFF')
                        .onChange((isOn: boolean) => {
                          this.companyManager = isOn
                        })
                    }
                  }
                  .width('80%')
                }

                this.CustomText('パスワード')
                Column() {
                  Row() {
                    TextInput({text: this.userDto.password})
                      .type(InputType.Password)
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
                    Blank()
                      .layoutWeight(1)
                    Button('変更')
                      .width('20%')
                      .height('40vp')
                      .fontSize("12fp")
                      .fontColor($r('app.color.register_success_text_font'))
                      .margin({ top: $r('app.float.register_success_text_margin_top') })
                  }
                }
                .width('80%')

                this.CustomText('氏名')
                TextInput({text: this.userDto.name}).customTextInputStyles()

                this.CustomText('ふりがな')
                TextInput({text: this.userDto.reading}).customTextInputStyles()

                this.CustomText('携帯電話番号')
                TextInput({text: this.userDto.username}).customTextInputStyles()

                this.CustomText('性別')
                Row() {
                  Row() {
                    Text(StringUtils.convertSexByCode(this.userDto.sex))
                      .customTextStyles()
                      .width('100%')
                  }
                  .width("95%")
                  Blank().layoutWeight(1)
                  Image($r('app.media.right_grey')).width(8).height(16)
                }
                .width("80%")
                .justifyContent(FlexAlign.SpaceBetween)
                .backgroundColor("#ffd7d6d6")
                .border({
                  color: $r('app.color.input_border_color'),
                  radius: 10
                })
                .onClick(() => {
                  CommonUtils.textPickerDialog($r('app.strarray.sex_array'), StringUtils.convertSexByCode(this.userDto.sex), (sexValue: string) => {
                    this.userDto.sex = StringUtils.convertSexByName(sexValue);
                  });
                })


                this.CustomText('現住所')
                Column() {
                  Row() {
                    Text(this.userDto.liveAddress).customTextStyles()
                    Blank()
                      .layoutWeight(1)
                    Button('郵便番号検索')
                      .width('20%')
                      .height('40vp')
                      .fontSize("12fp")
                      .fontColor($r('app.color.register_success_text_font'))
                      .margin({ top: $r('app.float.register_success_text_margin_top') })
                      .onClick(() => {
                        this.liveAddressController.open()
                      })
                  }
                }.width('80%')

                this.CustomText('自宅電話番号')
                TextInput({text: this.employeeInfoDto.homeTel}).customTextInputStyles()

                this.CustomText('生年月日')
                Row() {
                  Row() {
                    Text(StringUtils.toJapaneseCalendar(this.userDto.birth, this.dict.yearAmerican.convertToArray()))
                      .customTextStyles()
                  }
                  .width("95%")

                  Blank().layoutWeight(1)
                  Image($r('app.media.right_grey')).width(8).height(16)
                }
                .width("80%")
                .justifyContent(FlexAlign.SpaceBetween)
                .backgroundColor("#ffd7d6d6")
                .border({
                  color: $r('app.color.input_border_color'),
                  radius: 10
                })
                .onClick(() => {
                  CommonUtils.datePickerDialog(this.userDto.birth, (year: number, month: number, day: number) => {
                    this.userDto.birth = year + "-" + month + "-" + day;
                  });
                })


                this.CustomText('緊急連絡先氏名')
                TextInput({text: this.employeeInfoDto.emergencyContactName}).customTextInputStyles()

                this.CustomText('緊急連絡先ふりがな')
                TextInput({text: this.employeeInfoDto.emergencyContactRead}).customTextInputStyles()

                this.CustomText('緊急連絡先続柄')
                Row() {
                  Row() {
                    Text(StringUtils.convertRelationshipByCode(this.employeeInfoDto.emergencyContactRelationship))
                      .customTextStyles()
                  }
                  .width("95%")

                  Blank().layoutWeight(1)
                  Image($r('app.media.right_grey')).width(8).height(16)
                }
                .width("80%")
                .justifyContent(FlexAlign.SpaceBetween)
                .backgroundColor("#ffd7d6d6")
                .border({
                  color: $r('app.color.input_border_color'),
                  radius: 10
                })
                .onClick(() => {
                  CommonUtils.textPickerDialog($r('app.strarray.relationship_array'), StringUtils.convertRelationshipByCode(this.employeeInfoDto.emergencyContactRelationship), (value: string) => {
                    this.employeeInfoDto.emergencyContactRelationship = StringUtils.convertRelationshipByName(value);
                  });
                })


                this.CustomText('緊急連絡先住所')
                Column() {
                  Row() {
                    Text(this.employeeInfoDto.emergencyContactAddress).customTextStyles()
                    Blank()
                      .layoutWeight(1)
                    Button('郵便番号検索')
                      .width('20%')
                      .height('40vp')
                      .fontSize("12fp")
                      .fontColor($r('app.color.register_success_text_font'))
                      .margin({ top: $r('app.float.register_success_text_margin_top') })
                      .onClick(() => {
                        this.emergencyContactAddressController.open()
                      })
                  }
                }.width('80%')

                this.CustomText('緊急連絡先電話番号')
                TextInput({text: this.employeeInfoDto.emergencyContactTel}).customTextInputStyles()

                this.CustomText('雇用契約')
                Row() {
                  Row() {
                    Text(StringUtils.convertEmploymentContractByCode(this.employeeInfoDto.employmentContract)).customTextStyles()
                  }
                  .width("95%")

                  Blank().layoutWeight(1)
                  Image($r('app.media.right_grey')).width(8).height(16)
                }
                .width("80%")
                .justifyContent(FlexAlign.SpaceBetween)
                .backgroundColor("#ffd7d6d6")
                .border({
                  color: $r('app.color.input_border_color'),
                  radius: 10
                })
                .onClick(() => {
                  CommonUtils.textPickerDialog($r('app.strarray.employment_contract_array'), StringUtils.convertEmploymentContractByCode(this.employeeInfoDto.employmentContract), (value: string) => {
                    this.employeeInfoDto.employmentContract = StringUtils.convertEmploymentContractByName(value);
                  });
                })


                this.CustomText('雇入年月日')
                Row() {
                  Row() {
                    Text(StringUtils.toJapaneseCalendar(this.employeeInfoDto.hireDate, this.dict.yearAmerican.convertToArray()))
                      .customTextStyles()
                  }
                  .width("95%")

                  Blank().layoutWeight(1)
                  Image($r('app.media.right_grey')).width(8).height(16)
                }
                .width("80%")
                .justifyContent(FlexAlign.SpaceBetween)
                .backgroundColor("#ffd7d6d6")
                .border({
                  color: $r('app.color.input_border_color'),
                  radius: 10
                })
                .onClick(() => {
                  CommonUtils.datePickerDialog(this.employeeInfoDto.hireDate, (year: number, month: number, day: number) => {
                    this.employeeInfoDto.hireDate = year + "-" + month + "-" + day;
                  });
                })


                this.CustomText('経験開始年月日')
                Row() {
                  Row() {
                    Text(StringUtils.toJapaneseCalendar(this.employeeInfoDto.experienceStartDate, this.dict.yearAmerican.convertToArray()))
                      .customTextStyles()
                  }
                  .width("95%")

                  Blank().layoutWeight(1)
                  Image($r('app.media.right_grey')).width(8).height(16)
                }
                .width("80%")
                .justifyContent(FlexAlign.SpaceBetween)
                .backgroundColor("#ffd7d6d6")
                .border({
                  color: $r('app.color.input_border_color'),
                  radius: 10
                })
                .onClick(() => {
                  CommonUtils.datePickerDialog(this.employeeInfoDto.experienceStartDate, (year: number, month: number, day: number) => {
                    this.employeeInfoDto.experienceStartDate = year + "-" + month + "-" + day;
                  });
                })

                this.CustomText('作業員名簿の※印欄')
                Text(StringUtils.convertWorkerAttributeByCodes(this.employeeInfoDto.workerAttribute)).customTextStyles()

                this.CustomText('職種')
                Text(this.employeeInfoDto.getOccupationNames()).customTextStyles()

                this.CustomText('血液型')
                Row() {
                  Row() {
                    Text(StringUtils.convertBloodTypeByCode(this.employeeInfoDto.bloodType)).customTextStyles()
                  }
                  .width("95%")

                  Blank().layoutWeight(1)
                  Image($r('app.media.right_grey')).width(8).height(16)
                }
                .width("80%")
                .justifyContent(FlexAlign.SpaceBetween)
                .backgroundColor("#ffd7d6d6")
                .border({
                  color: $r('app.color.input_border_color'),
                  radius: 10
                })
                .onClick(() => {
                  CommonUtils.textPickerDialog($r('app.strarray.blood_type_array'), StringUtils.convertBloodTypeByCode(this.employeeInfoDto.bloodType), (value: string) => {
                    this.employeeInfoDto.bloodType = StringUtils.convertBloodTypeByName(value);
                  });
                })


                this.CustomText('最近の血圧(最高血圧)')
                TextInput({text: this.employeeInfoDto.highPressure}).customTextInputStyles()

                this.CustomText('最近の血圧(最低血圧)')
                TextInput({text: this.employeeInfoDto.lowPressure}).customTextInputStyles()

                this.CustomText('最近の健康診断日')
                Row() {
                  Row() {
                    Text(StringUtils.toJapaneseCalendar(this.employeeInfoDto.healthCheckupDate, this.dict.yearAmerican.convertToArray()))
                      .customTextStyles()
                  }
                  .width("95%")

                  Blank().layoutWeight(1)
                  Image($r('app.media.right_grey')).width(8).height(16)
                }
                .width("80%")
                .justifyContent(FlexAlign.SpaceBetween)
                .backgroundColor("#ffd7d6d6")
                .border({
                  color: $r('app.color.input_border_color'),
                  radius: 10
                })
                .onClick(() => {
                  CommonUtils.datePickerDialog(this.employeeInfoDto.healthCheckupDate, (year: number, month: number, day: number) => {
                    this.employeeInfoDto.healthCheckupDate = year + "-" + month + "-" + day;
                  });
                })

                this.CustomText('最近の健康診断画像')
                Text(this.employeeInfoDto.healthCheckupImgId != null ? "" : "未登録").customTextStyles()

                this.CustomText('特殊健康診断日')
                Row() {
                  Row() {
                    Text(StringUtils.toJapaneseCalendar(this.employeeInfoDto.specialMedicalExaminationDate, this.dict.yearAmerican.convertToArray()))
                      .customTextStyles()
                  }
                  .width("95%")

                  Blank().layoutWeight(1)
                  Image($r('app.media.right_grey')).width(8).height(16)
                }
                .width("80%")
                .justifyContent(FlexAlign.SpaceBetween)
                .backgroundColor("#ffd7d6d6")
                .border({
                  color: $r('app.color.input_border_color'),
                  radius: 10
                })
                .onClick(() => {
                  CommonUtils.datePickerDialog(this.employeeInfoDto.specialMedicalExaminationDate, (year: number, month: number, day: number) => {
                    this.employeeInfoDto.specialMedicalExaminationDate = year + "-" + month + "-" + day;
                  });
                })

                this.CustomText('特殊健康診断画像')
                Text(this.employeeInfoDto.specialMedicalExaminationImgId != null ? "" : "未登録").customTextStyles()

                this.CustomText('特殊健康診断種類')
                Text(StringUtils.convertSpecialMedicalExaminationTypeByCode(this.employeeInfoDto.specialMedicalExaminationType)).customTextStyles()

                this.CustomText('健康保険')
                Text(StringUtils.convertHealthInsuranceByCode(this.employeeInfoDto.healthInsurance)).customTextStyles()

                this.CustomText('健康保険番号下４桁')
                Text(this.employeeInfoDto.healthInsuranceNumber).customTextStyles()

                this.CustomText('雇入・職長・特別教育')
                Text(this.employeeInfoDto.getForemanNames()).customTextStyles()

                this.CustomText('技能講習')
                Text(this.employeeInfoDto.getSkillTrainingNames()).customTextStyles()

                this.CustomText('免許')
                Text(this.employeeInfoDto.getLicenseNames()).customTextStyles()

                this.CustomText('在留資格')
                Text(StringUtils.convertPeriodStatusByCode(this.employeeInfoDto.periodStatus)).customTextStyles()

                this.CustomText('建設キャリアアップシステムカード（表）登録義務のある者のみ')
                Text(this.userDto.username).customTextStyles()

                this.CustomText('建設キャリアアップシステムカード（裏）登録義務のある者のみ')
                Text(this.userDto.username).customTextStyles()

                Column() {
                  Row() {
                    Text('建退共手帳所有の有無').fontSize(20)
                    Blank()
                      .layoutWeight(1)
                    Toggle({ type: ToggleType.Switch, isOn: this.kentaikyoTetyou })
                      .size({ width: 80, height: 40 })
                      .selectedColor('#007DFF')
                      .onChange((isOn: boolean) => {
                        this.kentaikyoTetyou = isOn
                      })
                  }
                }
                .width('80%')
              }
              .padding({ left: 10, right: 10 })

            }
          }
          .flexGrow(CommonConstants.FLEX_GROW)
          .align(Alignment.TopStart)
        }
      }
    }
    .backgroundColor("#DCDCDC")
  }

  @Builder CustomText(text: string) {
    Text(text)
      .width('80%')
      .height($r('app.float.register_success_text_height'))
      .textAlign(TextAlign.Start)
      .fontSize("12fp")
      .fontColor($r('app.color.register_success_text_font'))
      .margin({ top: $r('app.float.register_success_text_margin_top') })
  }

  // @Builder CustomInputText(text: string, callback: Function) {
  //   Row() {
  //     Row() {
  //       Text(text)
  //         .customTextStyles()
  //         .onClick(() => {
  //           callback()
  //         })
  //     }
  //     .width("95%")
  //
  //     Blank().layoutWeight(1)
  //     Image($r('app.media.right_grey')).width(8).height(16)
  //   }
  //   .width("80%")
  //   .justifyContent(FlexAlign.SpaceBetween)
  //   .backgroundColor("#ffd7d6d6")
  //   .border({
  //     color: $r('app.color.input_border_color'),
  //     radius: 10
  //   })
  // }

  @Builder Title() {
    Flex() {
      Stack({alignContent: Alignment.BottomEnd}) {
        Row() {
          Column() {
            Text("＜社員一覧")
              .width('90%')
              .height('90%')
              .fontSize(18)
              .fontColor(Color.White)
              .align(Alignment.BottomStart)
              .onClick(() => {
                router.back()
              })
          }
          .width('25%')

          Column() {
            Text(this.currentDate.getFullYear() + "年" + (this.currentDate.getMonth() + 1) + "月" + this.currentDate.getDate() + "日")
              .width('100%')
              .height('100%')
              .fontSize(18)
              .fontColor(Color.White)
              .align(Alignment.BottomStart)
              .textAlign(TextAlign.Center)
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

                AlertDialog.show({
                  title: '確認',
                  message: 'データを保存します。よろしいですか？',
                  autoCancel: true,
                  alignment: DialogAlignment.Center,
                  offset: { dx: 0, dy: -10 },
                  primaryButton: {
                    value: 'はい',
                    action: () => {
                      console.log('Get Alert Dialog handled')
                    }
                  },
                  secondaryButton: {
                    value: "いいえ",
                    action: () => {

                    }
                  }
                })
              })
          }
          .width('25%')
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
    }
    .width('100%')
    .height('10%')
    .backgroundColor('#FF0CA91A')
  }
}

@Extend(Text) function customTextStyles() {
  .width('80%')
  .height($r('app.float.text_input_height'))
  .textAlign(TextAlign.Start)
  .fontSize('20fp')
  .fontColor($r('app.color.register_success_text_font'))
  .backgroundColor("#ffd7d6d6")
  .textOverflow({ overflow: TextOverflow.Ellipsis })
  .border({
    color: $r('app.color.input_border_color'),
    radius: 10
  })
}

@Extend(TextInput) function customTextInputStyles() {
  .width('80%')
  .height($r('app.float.text_input_height'))
  .textAlign(TextAlign.Start)
  .fontSize('20fp')
  .fontColor($r('app.color.register_success_text_font'))
  .backgroundColor("#ffe9e7e7")
  .border({
    width: "1vp",
    color: $r('app.color.input_border_color'),
    radius: 10
  })
}


@CustomDialog
struct TextInputDialog {
  controller: CustomDialogController = new CustomDialogController({builder: TextInputDialog()})
  confirm: (value: string) => void;
  value: string = '';

  build() {
    Column({space: 20}) {
      Text('郵便番号検索')
      TextInput({placeholder:'郵便番号７桁、ハイフンなし'})
        .type(InputType.Number)
        .onChange((value) => {
          this.value = value
        })
      Row({space: 50}) {
        Button('キャンセル')
          .onClick(() => {
            this.controller.close();
          })
        Button('検索')
          .onClick(() => {
            this.confirm(this.value);
            this.controller.close();
          })
      }
    }.padding(20)
  }
}
