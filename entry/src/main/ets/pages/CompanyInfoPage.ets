
import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger'
import { CompanyInfo } from '../model/CompanyInfo'
import { MasterDto } from '../model/MasterDto'
import { CompanyComponent } from '../view/CompanyComponent'
import { EmployeeComponent } from '../view/EmployeeComponent'


let storage: LocalStorage = LocalStorage.GetShared()

@Entry(storage)
@Component
export struct CompanyInfoPage {
  @State handlePopup: boolean = false
  @Provide companyInfo: CompanyInfo = new CompanyInfo();
  @LocalStorageProp("dict") dict: MasterDto = new MasterDto();
  @LocalStorageProp("company") company: any = {};
  private currentDate: Date = new Date();
  @State companyStyle: string = '#ff03c415'
  @State employeeStyle: string = '#FF0CA91A'
  @State selectIndex: number = 1;

  async aboutToAppear() {
    this.companyInfo = new CompanyInfo(this.company)
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {

      Flex({ direction: FlexDirection.Column }) {
        this.Title()
        if (this.selectIndex == 1) {
          CompanyComponent().height('100%')
        } else {
          EmployeeComponent().height('100%')
        }
        this.BottomNavigation()
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

  @Builder BottomNavigation() {
    Flex() {
      Stack({alignContent: Alignment.BottomEnd}) {
        Row() {
          Column() {
            Text("会社情報")
              .width('100%')
              .height('100%')
              .fontSize(18)
              .fontColor(Color.White)
              .align(Alignment.Center)
              .textAlign(TextAlign.Center)
              .onClick(() => {
                this.selectIndex = 1;
                this.companyStyle = '#ff03c415'
                this.employeeStyle = '#FF0CA91A'
              })
          }
          .width('50%')
          .backgroundColor(this.companyStyle)

          Column() {
            Text("社員一覧")
              .width('100%')
              .height('100%')
              .fontSize(18)
              .fontColor(Color.White)
              .align(Alignment.Center)
              .textAlign(TextAlign.Center)
              .onClick(() => {
                this.selectIndex = 2;
                this.companyStyle = '#FF0CA91A'
                this.employeeStyle = '#ff03c415'
              })
          }
          .width('50%')
          .backgroundColor(this.employeeStyle)
        }
        .zIndex(2)
      }
      .height('100%')
      .width('100%')
    }
    .width('100%')
    .height('10%')
    .backgroundColor('#FF0CA91A')
  }
}