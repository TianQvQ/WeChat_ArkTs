import prompt from '@ohos.promptAction'
import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import { NAV_BAR_HEIGHT, STATUS_BAR_HEIGHT } from '../Toptag/StatusBarManager';

@Entry
@Component
export default struct SearchPage {
  @StorageLink(STATUS_BAR_HEIGHT) statusBarHeight: number = 0
  @StorageLink(NAV_BAR_HEIGHT) navBarHeight: number = 0
  @State searchText: string = ''
  controller: TextInputController = new TextInputController()
  build(){
    Column(){
      // 在界面顶部放置一个与状态栏同高度的组件，用于占位，可避免界面内容与状态栏内容重叠
      Row().height(px2vp(this.statusBarHeight))
      Row(){
        Stack(){
          //输入框
          TextInput({text: this.searchText, placeholder:"搜索", controller: this.controller})
            .placeholderFont({size:20, weight: 400})
            .width('100%')
            .height('100%')
            .placeholderColor(Color.Grey)
            .caretColor(Color.Green)
            .padding({left: 40, right: 60})
            .fontSize(20)
            .borderRadius(8)
            .fontColor(Color.Black)
            .stateStyles({
              normal:{.backgroundColor(Color.White)},
              pressed:{.backgroundColor(Color.White)},
              clicked:{.backgroundColor(Color.White)},
              focused:{.backgroundColor(Color.White)}
            })
            .onChange((value:string) => {
              this.searchText = value
            })
            .onSubmit(() => {
              prompt.showToast({message: this.searchText})
            })

          Row(){
            Image($r('app.media.search'))
              .colorBlend(Color.Grey)
              .width(20)
              .height(20)
            //判断是否有输入信息，切换右边显示的图标
            if (this.searchText.length != 0){
              Image($r('app.media.delete'))
                .width(20)
                .height(20)
                .colorBlend(Color.Gray)
                .onClick(() => {
                  this.searchText = ""
                })
            }
            else{
              Image($r('app.media.voice'))
                .width(23)
                .height(23)
            }
          }
          .width('100%')
          .padding({left:10, right:10})
          .justifyContent(FlexAlign.SpaceBetween)
          .hitTestBehavior(HitTestMode.None)//父组件不消耗触摸事件
        }
        .margin({left:20})
        .layoutWeight(1)
        //取消按钮，返回主页
        Text("取消")
          .width(70)
          .height('100%')
          .fontWeight(400)
          .fontColor("5f6c8a")
          .fontSize(19)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
      .height(40)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({top: 10})

      Text("搜索指定内容")
        .fontColor(Color.Gray)
        .fontSize(15)
        .margin({left:25, top:25})

      Divider()
        .height(0.6)
        .margin({left: 25, right: 25, top: 12})
        .color("#e6e6e6")
      //四个功能文本
      Row(){
        Text("朋友圈")
          .width('25%')
          .textAlign(TextAlign.Center)
          .fontSize(17)
          .fontWeight(500)
          .fontColor("#5f6c8a")
          .onClick(Tip)

        Text("公众号")
          .width('25%')
          .textAlign(TextAlign.Center)
          .fontSize(17)
          .fontWeight(500)
          .fontColor("#5f6c8a")
          .onClick(Tip)

        Text("小程序")
          .width('25%')
          .textAlign(TextAlign.Center)
          .fontSize(17)
          .fontWeight(500)
          .fontColor("#5f6c8a")
          .onClick(Tip)

        Text("视频号")
          .width('25%')
          .textAlign(TextAlign.Center)
          .fontSize(17)
          .fontWeight(500)
          .fontColor("#5f6c8a")
          .onClick(Tip)
      }
      .margin({top: 12})

      Blank()
      //底部文本
      Text("页面设置")
        .alignSelf(ItemAlign.Center)
        .fontColor("#5f6c8a")
        .width('25%')
        .fontWeight(500)
        .margin({bottom: 80})
        .onClick(Tip)

      // 在界面底部放置一个与导航栏同高度的组件，用于占位，可避免界面内容与状态栏内容重叠
      Row().height(px2vp(this.navBarHeight))
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#f3f3f3')
  }
}

const Tip = () => {
  prompt.showToast({ message: "功能待开发...", duration: 2000 })
}