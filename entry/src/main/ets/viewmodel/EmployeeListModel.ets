import router from '@ohos.router';
import { CommonConstants } from '../common/constants/CommonConstants';
import { UserDto } from '../model/UserDto';
@Component
export struct EmployeeListModel {

  @State userDto: UserDto = new UserDto();
  @State stateText1: string = ''
  @State stateText2: string = ''

  aboutToAppear() {
    if (this.userDto.status == 0) {
      this.stateText1 = '承認'
      this.stateText2 = '却下'
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.userDto.username)
          .width('30%')
          .height($r('app.float.item_text_height'))
          .fontSize(20)
          .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
          .padding({left: 5})
          .margin({left: 2})
          .border({
            width: "1vp",
            color: $r('app.color.input_border_color'),
            radius: 10
          })
          .enabled(false)
      }

      Column() {
        Text(this.userDto.name)
          .width('50%')
          .height($r('app.float.item_text_height'))
          .fontSize(20)
          .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
          .padding({left: 5})
          .margin({left: 2})
          .border({
            width: "1vp",
            color: $r('app.color.input_border_color'),
            radius: 10
          })
          .onClick(()=>{
            router.pushUrl({url: CommonConstants.EMPLOYEE_INFO_PAGE_URL, params: {userId: this.userDto.userId}})
          })
      }

      Column() {
        if (this.userDto.status == 1) {
          Button('詳細', {type: ButtonType.Normal})
            .width('20%')
            .height('45vp')
            .fontSize(15)
            .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
            .margin({left: 2})
            .backgroundColor('#FF0CA91A')
            .onClick(()=>{
              router.pushUrl({url: CommonConstants.EMPLOYEE_INFO_PAGE_URL, params: {userId: this.userDto.userId}})
            })
        } else {
          Button(this.stateText1, {type: ButtonType.Normal})
            .width('20%')
            .height('22vp')
            .fontSize(15)
            .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
            .margin({left: 2, bottom: 1})
            .backgroundColor('#FF0CA91A')

          Button(this.stateText2, {type: ButtonType.Normal})
            .width('20%')
            .height('22vp')
            .fontSize(15)
            .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
            .fontColor(Color.Black)
            .margin({left: 2})
            .backgroundColor('#ffb8beb9')
        }
      }
      .padding({left: 5})
    }
    .height('50vp')
  }
}