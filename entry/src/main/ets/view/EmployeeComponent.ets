
import common from '@ohos.app.ability.common';
import router from '@ohos.router';
import prompt from '@ohos.prompt';
import { LeftMenuItemData } from '../common/bean/LeftMenuItemData';
import { CommonConstants } from '../common/constants/CommonConstants';
import { MediaBean, MediaHelper, MediaOption } from '../helepr/MediaHelper';
import { CompanyInfo } from '../model/CompanyInfo';
import { EmployeeListModel } from '../viewmodel/EmployeeListModel';
import { UserApi } from '../api/UserApi';
import ArrayList from '@ohos.util.ArrayList';
import { UserDto } from '../model/UserDto';
import Logger from '../common/utils/Logger';

@Component
export struct EmployeeComponent {
  @Consume companyInfo: CompanyInfo;
  @State private userList: Array<UserDto> = []

  async aboutToAppear() {
    let userListJsonData = await (new UserApi()).userList();
    Object.entries(userListJsonData.data['userList']).forEach(([key, values]) => {
      this.userList.push(new UserDto(values))
    })
  }


  build() {
    Column() {
      Column() {
          Text("社員一覧")
            .width('100%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Center)
            .fontSize('20fp')
            .fontColor($r('app.color.register_success_text_font'))
            .height('50vp')
      }
      .alignItems(HorizontalAlign.End)

      Column() {
        Row() {
          Text('携帯電話番号')
            .width('40%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Center)
            .fontSize("12fp")
            .fontColor($r('app.color.register_success_text_font'))
            .margin({ top: $r('app.float.register_success_text_margin_top') })

          Text('お名前')
            .width('40%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Center)
            .fontSize("12fp")
            .fontColor($r('app.color.register_success_text_font'))
            .margin({ top: $r('app.float.register_success_text_margin_top') })

          Text('')
            .width('20%')
            .height($r('app.float.register_success_text_height'))
            .textAlign(TextAlign.Center)
            .fontSize("12fp")
            .fontColor($r('app.color.register_success_text_font'))
            .margin({ top: $r('app.float.register_success_text_margin_top') })
        }
      }


      List() {
        ForEach(this.userList, (item: UserDto) => {
          ListItem() {
            EmployeeListModel({userDto: item})
          }
          .onClick(() => {

          })
        }, (item, index) => index + JSON.stringify(item))
      }
      .divider({
        strokeWidth: $r('app.float.divider_stroke_width'),
        color: $r('app.color.item_divider')
      })

    }
    .padding({left: 10, right: 10})
  }
}
