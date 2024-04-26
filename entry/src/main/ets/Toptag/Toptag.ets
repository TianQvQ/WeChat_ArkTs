import router from '@ohos.router'
import prompt from '@ohos.prompt'
import { STATUS_BAR_HEIGHT } from '../Toptag/StatusBarManager'

@Preview
@Component
export default struct Toptag {
  title: string = ""
  @StorageLink(STATUS_BAR_HEIGHT) statusBarHeight: number = 0
  build() {
    Column(){
      // 在界面顶部放置一个与状态栏同高度的组件，用于占位，可避免界面内容与状态栏内容重叠
      Row().height(px2vp(this.statusBarHeight))
        Stack(){
          //顶部文字
          Text(this.title)
            .fontColor(Color.Black)
            .fontSize(19)
            .fontWeight(500)
          Row(){
            //搜索图标
            Image($r('app.media.search'))
              .width(22)
              .height(22)
              .margin({right:20})
              .onClick(() => {
                router.pushUrl({ url: 'Search/Search' })
              })
            //加号图标
            Image($r('app.media.add'))
              .width(22)
              .height(22)
              .margin({right:18})
              .onClick(() => {
                prompt.showToast({ message: "功能待开发...", duration: 2000 })
              })
          }
          .height('100%')
          .width('100%')
          .alignItems(VerticalAlign.Center)
          .justifyContent(FlexAlign.End)
      }
      .width('100%')
      .height(50)
    }
    .backgroundColor('#F0F0F0')
  }
}