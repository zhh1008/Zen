
import router from '@ohos.router';
import { EmployeeRequest } from '../api/request/EmployeeRequest';
import { UserApi } from '../api/UserApi';
import CommonUtils from '../common/CommonUtils';
import { CommonConstants } from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
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
  private sexArray: Resource = $r('app.strarray.sex_array');

  async aboutToAppear() {
    let userInfoJsonData = await (new UserApi()).userInfo(new EmployeeRequest(this.userId));
    this.userDto = new UserDto(userInfoJsonData.data['userInfo'])
    this.employeeInfoDto = new EmployeeInfoDto(userInfoJsonData.data['employeeInfo']);
    this.companyManager = this.userDto.roleId == '5' ? true : false;
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
                Text(this.userDto.username)
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


                if (this.userDto.contrFlg != '1') {
                  Column() {
                    Row() {
                      Text('企業管理者').fontSize(20)
                      Blank()
                        .layoutWeight(1)
                      Toggle({ type: ToggleType.Switch, isOn: this.companyManager })
                        .size({ width: 20, height: 20 })
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
                Text(this.userDto.name)
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

                this.CustomText('ふりがな')
                Text(this.userDto.reading)
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

                this.CustomText('携帯電話番号')
                Text(this.userDto.username)
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

                this.CustomText('性別')
                Row() {
                  Row() {
                    Text(this.userDto.sex)
                      .width('80%')
                      .height($r('app.float.text_input_height'))
                      .textAlign(TextAlign.Start)
                      .fontSize('20fp')
                      .fontColor($r('app.color.register_success_text_font'))
                      .backgroundColor("#ffd7d6d6")
                      .border({
                        color: $r('app.color.input_border_color'),
                        radius: 10
                      }).onClick(() => {
                      CommonUtils.textPickerDialog(this.sexArray, this.userDto.sex, (sexValue: string) => {
                        this.userDto.sex = sexValue;
                      });
                    })
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


                this.CustomText('現住所')
                Text(this.userDto.liveAddress)
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

                this.CustomText('自宅電話番号')
                Text(this.employeeInfoDto.homeTel)
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

                this.CustomText('生年月日')
                Row() {
                  Row() {
                    Text(this.userDto.birth)
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
                      .onClick(() => {
                        CommonUtils.datePickerDialog(this.userDto.birth, (year: number, month: number, day: number) => {
                          let yearAmerican = this.dict.yearAmerican.convertToArray().find(item => item.code === year.toString());
                          this.userDto.birth = yearAmerican.name + "年" + month + "月" + day + "日";
                        });
                      })
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


                this.CustomText('緊急連絡先氏名')
                Text(this.employeeInfoDto.emergencyContactName)
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

                this.CustomText('緊急連絡先ふりがな')
                Text(this.employeeInfoDto.emergencyContactRead)
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

                this.CustomText('緊急連絡先続柄')
                Text(this.employeeInfoDto.emergencyContactRelationship)
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

                this.CustomText('緊急連絡先住所')
                Text(this.employeeInfoDto.emergencyContactAddress)
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

                this.CustomText('緊急連絡先電話番号')
                Text(this.employeeInfoDto.emergencyContactTel)
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

                this.CustomText('雇用契約')
                Text(this.employeeInfoDto.employmentContract)
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

                this.CustomText('雇入年月日')
                Text(this.employeeInfoDto.hireDate)
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
                  .onClick(() => {
                    CommonUtils.datePickerDialog(this.userDto.birth, (year: number, month: number, day: number) => {
                      let yearAmerican = this.dict.yearAmerican.convertToArray().find(item => item.code === year.toString());
                      this.employeeInfoDto.hireDate = yearAmerican.name + "年" + month + "月" + day + "日";
                    });
                  })

                this.CustomText('経験開始年月日')
                Text(this.employeeInfoDto.experienceStartDate)
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
                  .onClick(() => {
                    CommonUtils.datePickerDialog(this.userDto.birth, (year: number, month: number, day: number) => {
                      let yearAmerican = this.dict.yearAmerican.convertToArray().find(item => item.code === year.toString());
                      this.employeeInfoDto.experienceStartDate = yearAmerican.name + "年" + month + "月" + day + "日";
                    });
                  })

                this.CustomText('作業員名簿の※印欄')
                Text(this.employeeInfoDto.workerAttribute != null ? this.employeeInfoDto.workerAttribute.join(',') : "")
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

                this.CustomText('職種')
                Text(this.employeeInfoDto.bloodType)
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

                this.CustomText('血液型')
                Text(this.employeeInfoDto.bloodType)
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

                this.CustomText('最近の血圧(最高血圧)')
                Text(this.employeeInfoDto.highPressure)
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

                this.CustomText('最近の血圧(最低血圧)')
                Text(this.employeeInfoDto.lowPressure)
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

                this.CustomText('最近の健康診断日')
                Text(this.employeeInfoDto.healthCheckupDate)
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
                  .onClick(() => {
                    CommonUtils.datePickerDialog(this.userDto.birth, (year: number, month: number, day: number) => {
                      let yearAmerican = this.dict.yearAmerican.convertToArray().find(item => item.code === year.toString());
                      this.employeeInfoDto.healthCheckupDate = yearAmerican.name + "年" + month + "月" + day + "日";
                    });
                  })

                this.CustomText('最近の健康診断画像')
                Text(this.userDto.username)
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

                this.CustomText('特殊健康診断日')
                Text(this.employeeInfoDto.specialMedicalExaminationDate)
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
                  .onClick(() => {
                    CommonUtils.datePickerDialog(this.userDto.birth, (year: number, month: number, day: number) => {
                      let yearAmerican = this.dict.yearAmerican.convertToArray().find(item => item.code === year.toString());
                      this.employeeInfoDto.specialMedicalExaminationDate = yearAmerican.name + "年" + month + "月" + day + "日";
                    });
                  })

                this.CustomText('特殊健康診断画像')
                Text(this.userDto.username)
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

                this.CustomText('特殊健康診断種類')
                Text(this.userDto.username)
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

                this.CustomText('健康保険')
                Text(this.userDto.username)
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

                this.CustomText('健康保険番号下４桁')
                Text(this.userDto.username)
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

                this.CustomText('雇入・職長・特別教育')
                Text(this.userDto.username)
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

                this.CustomText('技能講習')
                Text(this.userDto.username)
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

                this.CustomText('免許')
                Text(this.userDto.username)
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

                this.CustomText('在留資格')
                Text(this.userDto.username)
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

                this.CustomText('建設キャリアアップシステムカード（表）登録義務のある者のみ')
                Text(this.userDto.username)
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

                this.CustomText('建設キャリアアップシステムカード（裏）登録義務のある者のみ')
                Text(this.userDto.username)
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

  @Builder CustomText(name: string) {
    Text(name)
      .width('80%')
      .height($r('app.float.register_success_text_height'))
      .textAlign(TextAlign.Start)
      .fontSize("12fp")
      .fontColor($r('app.color.register_success_text_font'))
      .margin({ top: $r('app.float.register_success_text_margin_top') })
  }

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