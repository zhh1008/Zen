import prompt from '@ohos.prompt';
import { CommonConstants } from '../common/constants/CommonConstants';
import { CommonTitleBarComponent } from '../view/CommonTitleBarComponent';
import { DrawerLayout } from '../view/DrawerLayoutComponent';
import { LeftMenuItemData } from '../common/bean/LeftMenuItemData';
import preferenceUtils from '../common/utils/PreferencesUtil';
import { siteApi } from '../api/SiteApi';
import { imageApi } from '../api/ImageApi';
import { ApiResult } from '../common/http/ApiResult';
import image from '@ohos.multimedia.image';
import Logger from '../common/utils/Logger';
import { ImageDLRequest } from '../api/request/ImageDLRequest';
import { DecodingOptions } from '../common/http/RequestOptions';
import router from '@ohos.router';

/**
 * Personal Center page, displaying personal information and app-related settings.
 */
// @Entry
@Component
export struct MinePage {
  @Link isLogged: boolean;
  private tabsController: TabsController = new TabsController();
  @State currentIndex: number = 0;
  private scroller: Scroller = new Scroller()
  @State dataSource: MyDataSource = new MyDataSource();
  private currentDate: Date = new Date();
  @State userName: string = "";

  @State model: DrawerLayout.Model = new DrawerLayout.Model()
    // 设置左侧边栏DrawerLayout.Type.LEFT 还是右侧边栏DrawerLayout.Type.RIGHT
    .setDrawerType(DrawerLayout.Type.LEFT)
      // 设置侧边栏宽度
    .setDrawerWidth(300);

  async loadData(): Promise<void> {
    let result = await siteApi.site()
    let siteList = result.data['siteList'] as []
    for (let i = 0; i < siteList.length; i++) {
      if ((siteList[i]['bldg'] as []).length > 0) {
        let imgId = siteList[i]['bldg'][0]["siteImgId"]
        this.dataSource.data.push(new SiteDto(siteList[i]["constrName"], (await this.getImage(imgId))))
      }
    }
    this.dataSource.reloadData()
  }

  async aboutToAppear() {
    this.userName = (await preferenceUtils.get("userName", "")).toString();
    this.loadData()
  }

  build() {
    Column() {
      CommonTitleBarComponent({attribute: {bg_color: '#FF0CA91A', title_text: this.currentDate.getFullYear() + "年" + (this.currentDate.getMonth() + 1) + "月" + this.currentDate.getDate() + "日", extra_text: '更新', menuCallback:() => {
        this.model.openOrCloseDrawer()
        prompt.showToast({
          message: '点击菜单按钮',
          duration: 2000
        });
        // MenuComponent()
      }, extraCallback: () =>this.loadData()}})
      DrawerLayout({
        model: $model,
        drawerView: () => {
          this.buildDrawerView();
        },
        contentView: () => {
          this.buildContentView();
        }
      })
    }
    .width('100%')
    .height('100%')
  }

  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({width: 25, height: 25})
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }



  @Builder buildContentView() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.tabsController}) {
        TabContent() {
          Scroll(this.scroller) {
            Grid() {
              LazyForEach(this.dataSource, item => {
                GridItem() {
                  Image(item['image'])
                    .width('100%').height('100%')
                    .overlay(item["constrName"], {
                      align: Alignment.BottomStart,
                      offset: { x: 0, y: -15 }
                    })

                  // Text(item["constrName"])
                  //   .fontSize(16)
                  //   .fontColor(Color.Grey)
                  //   .backgroundColor("#FFFFFF")
                  //   .width('100%')
                  //   .height('100%')
                  //   .textAlign(TextAlign.Center)
                  //   .onAppear(()=>{
                  //     console.log("myTest:" + item.toString())
                  //   })
                }
                .height('25%')
              }, item => item)
            }
            .cachedCount(3)
            .columnsTemplate('1fr 1fr')
            .columnsGap(10)
            .rowsGap(10)
            .height('100%')
          }
          .scrollable(ScrollDirection.Vertical)
          .padding({left:16, right:16})
        }
        .backgroundColor("#DCDCDC")
        .tabBar(this.TabBuilder('工程', 0, $r('app.media.menu'), $r('app.media.menu')))

        TabContent() {
          Text('BBBBBB')
            .textAlign(TextAlign.Center)
            .fontWeight(CommonConstants.NICKNAME_FONT_WEIGHT)
            .fontSize($r('app.float.nickname_font_size'))
            .margin({ top: $r('app.float.nickname_margin_top') })
        }
        .tabBar(this.TabBuilder('オファー', 1, $r('app.media.menu'), $r('app.media.menu')))
      }
      .vertical(false)
      .barWidth('100%')
      .barHeight(60)
      .width('100%')
      .height('90%')
      .backgroundColor(0xF5F5F5)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }

  @Builder buildDrawerView() {
    Column() {
      Flex({justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.End, direction: FlexDirection.Column}) {
        Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center}) {
          Text('株式会社繕')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)

          Text(this.userName + ' 様')
            .fontSize(20)
            .fontWeight(FontWeight.Normal)
        }
        .width('100%')
        .height('10%')

        List() {
          ForEach(this.getLeftMenuListItems(), (item: LeftMenuItemData) => {
            ListItem() {
              Row() {
                Column() {
                  Image($r("app.media.ic_registration_success"))
                    .objectFit(ImageFit.Contain)
                    .width(30)
                    .height(30)
                }
                .width('20%')
                .justifyContent(FlexAlign.Start)

                Column() {
                  Text(item.title)
                    .width(CommonConstants.MINE_PAGE_TEXT_WIDTH_PERCENT)
                    .height($r('app.float.item_text_height'))
                    .fontSize(25)
                    .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
                    .margin({left: 10})
                }
              }
            }
            .onClick(() => {

              if (item.title.toString() == '情報') {
                router.replaceUrl({
                  url: CommonConstants.COMPANY_INFO_PAGE_URL
                });
              }

              if (item.title.toString() == 'ログアウト') {
                this.isLogged = false;
                preferenceUtils.delete("isLogged")
              }
              prompt.showToast({
                message: '点击更新按钮',
                duration: 2000
              });
              // router.pushUrl({url: "pate/HomePage"})
            })
          }, (item, index) => index + JSON.stringify(item))
        }
        .divider({
          strokeWidth: $r('app.float.divider_stroke_width'),
          color: $r('app.color.item_divider')
        })

        Text('Ver1.0')
          .fontSize(20)
          .fontWeight(FontWeight.Normal)
          .margin({right: 5, bottom: 5})
          .textAlign(TextAlign.End)
          .align(Alignment.BottomEnd)
          .flexGrow(1)
      }
      .height('90%')
    }
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }

  getLeftMenuListItems(): Array<LeftMenuItemData> {
    let personalListItems: Array<LeftMenuItemData> = [new LeftMenuItemData('情報'), new LeftMenuItemData('アカウント'), new LeftMenuItemData('ログアウト')];
    // for (let index = 1; index <= CommonConstants.LIST_SIZE; index++) {
    //   let personalListItem = new LeftMenuItemData();
    //   personalListItem.title = $r('app.string.component_list_item_text', index);
    //   personalListItems.push(personalListItem);
    // }
    return personalListItems;
  }


  async getImage(imageId: string): Promise<image.PixelMap> {
    if (imageId == '') {
      return null
    }
    let imageDLRequest = new ImageDLRequest(imageId)
    let options = {
      alphaType: 0,                     // 透明度
      editable: false,                  // 是否可编辑
      pixelFormat: 3,                   // 像素格式
      scaleMode: 1,                     // 缩略值
    }
    const pixelMap = await new Promise<PixelMap>((resolve, reject) => {
      imageApi.getImage(imageDLRequest, new DecodingOptions(options)).then((imgData) => {
        resolve(imgData);
      }).catch((error) => {
        reject(error);
      });
    });

    return pixelMap
  }
}

@Observed
class SiteDto {
  constrName: string
  image: image.PixelMap

  constructor(constrName: string, image: image.PixelMap) {
    this.constrName = constrName;
    this.image = image;
  }
}

class MyDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  data: SiteDto[] = [];
  public totalCount(): number {
    return this.data.length
  }
  public getData(index: number): any {
    return this.data[index]
  }
  public reloadData(): void {
    this.notifyDataReload();
  }
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }
}