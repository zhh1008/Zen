
import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger'
import { WorkTypeListItem } from '../model/WorkTypeListItem'
import { WorkTypeModel } from '../viewmodel/WorkTypeModel'
import { ObservedArray } from '../model/CommonDto'
import { CompanyInfo } from '../model/CompanyInfo'
import { MasterDto } from '../model/MasterDto'


let storage: LocalStorage = LocalStorage.GetShared()

@Entry(storage)
@Component
export struct WorkTypeListPage {
  @Provide workTypeList: ObservedArray<WorkTypeListItem> = [];
  @State selectAllText: string = "すべで解除";
  @LocalStorageProp("dict") dict: MasterDto = new MasterDto();

  aboutToAppear() {
    let companyInfo = router.getParams() as CompanyInfo

    Object.entries(this.dict.workerType).forEach(([key, value]) => {

      let workTypeListItem = new WorkTypeListItem()
      workTypeListItem.abb = value['abb']
      workTypeListItem.code = value['code']
      workTypeListItem.name = value['name']

      for (let i = 0; i < companyInfo.companyWorkTypeList.length; i++) {
        if (companyInfo.companyWorkTypeList[i].name == value['name']) {
          workTypeListItem.isSelected = true
          break
        }
      }
      this.workTypeList.push(workTypeListItem)
    })

    for (let i = 0; i < this.dict.workerType.length; i++) {
      if (this.workTypeList[i].isSelected == false) {
        this.selectAllText = "すべで選択"
        break;
      }
    }
  }

  changeSelect() {
    let isSelectedAll = true;
    for (let i = 0; i < this.workTypeList.length; i++) {
      if (this.workTypeList[i].isSelected == false) {
        isSelectedAll = false;
        break;
      }
    }
    if (isSelectedAll) {
      this.selectAllText = 'すべで解除';
    } else {
      this.selectAllText = 'すべで選択'
    }
  }

  selectAll() {
    if (this.selectAllText == "すべで解除") {
      this.selectAllText = "すべで選択"
      for (let i = 0; i < this.workTypeList.length; i++) {
        this.workTypeList[i].isSelected = false
      }
    } else {
      this.selectAllText = "すべで解除"
      for (let i = 0; i < this.workTypeList.length; i++) {
        this.workTypeList[i].isSelected = true
      }
    }
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {

      Flex({ direction: FlexDirection.Column }) {
        this.Title()
        Column() {
          Text("工種一覧")
            .width('100%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Center)
            .fontSize('20fp')
            .fontColor($r('app.color.register_success_text_font'))
        }.height("5%")

        Scroll() {
          List({ space: CommonConstants.LIST_ITEM_SPACE }) {
            ForEach(this.workTypeList, (workTypeItem: WorkTypeListItem) => {
              ListItem() {
                WorkTypeModel({item: workTypeItem, changeSelect: this.changeSelect.bind(this)})
              }
              .height(48)
              .backgroundColor(Color.White)
            })
          }
        }
        .flexGrow(CommonConstants.FLEX_GROW)
        .align(Alignment.TopStart)


        Button('保存')
          .width("100%")
          .height($r('app.float.login_btn_height'))
          .fontSize($r('app.float.text_input_font_size'))
          .fontWeight(CommonConstants.BUTTON_FONT_WEIGHT)
          .borderRadius($r('app.float.register_btn_border_radius'))
          .margin({ top: $r('app.float.register_btn_margin_top') })
          .fontColor($r('app.color.login_font_normal'))
          .backgroundColor($r('app.color.login_btn_enabled'))
          .onClick(() => {
            router.pushUrl({url: CommonConstants.COMPANY_INFO_PAGE_URL})
          }).margin({bottom: 10})
      }
    }
    .backgroundColor("#DCDCDC")
  }

  @Builder Title() {
    Flex() {
      Stack({alignContent: Alignment.BottomEnd}) {
        Row() {
          Column() {
            Text("＜会社情報")
              .width('90%')
              .height('90%')
              .fontSize(18)
              .fontColor(Color.White)
              .align(Alignment.BottomStart)
              .onClick(() => {
                router.clear()
                Logger.debug("router=>", router.getLength().toString())
                router.pushUrl({url: CommonConstants.COMPANY_INFO_PAGE_URL})
              })
          }
          .width('50%')

          Column() {
            Text(this.selectAllText)
              .width('90%')
              .height('90%')
              .fontSize(18)
              .fontColor(Color.White)
              .align(Alignment.BottomEnd)
              .textAlign(TextAlign.End)
              .onClick(() => {
                this.selectAll()
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
    }
    .width('100%')
    .height('10%')
    .backgroundColor('#FF0CA91A')
  }
}