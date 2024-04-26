import router from '@ohos.router'
import prompt from '@ohos.promptAction'
import { STATUS_BAR_HEIGHT } from '../Toptag/StatusBarManager'

@Preview
@Component
export default struct Toolbar {
   title: string = "发现"
   backSrc: string | PixelMap | Resource = $r("app.media.back")
   subTitle: string = "更多"
   subIconSrc: string | PixelMap | Resource = $r("app.media.toolbar_more")
  @StorageLink(STATUS_BAR_HEIGHT) statusBarHeight: number = 0

  build() {
    Column() {
      // 在界面顶部放置一个与状态栏同高度的组件，用于占位，可避免界面内容与状态栏内容重叠
      Row().height(px2vp(this.statusBarHeight))

      Row() {
        //返回页面
        Image(this.backSrc)
          .width(22)
          .height(22)
          .margin({ left: 15 })
          .onClick(() => {
            router.back()//点击返回
          })
        //顶部文字
        Text(this.title)
          .fontColor(Color.Black)
          .fontSize(19)
          .fontWeight(500)
        //判断有无图标，如果没有则显示文字
        if (this.subIconSrc === null) {
          Text(this.subTitle)
            .fontColor(Color.Black)
            .fontSize(16)
            .margin({ right: 15 })
            .fontWeight(400)
            .onClick(Tip)
        } else {
          Image(this.subIconSrc)
            .width(25)
            .height(25)
            .margin({ right: 15 })
            .onClick(Tip)
        }

      }
      .height(53)
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
    }
  }
}

const Tip = () => {
  prompt.showToast({ message: "功能待开发...", duration: 2000 })
}