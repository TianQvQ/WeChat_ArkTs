import router from '@ohos.router'
import { STATUS_BAR_HEIGHT } from '../../Toptag/StatusBarManager'
import  FindList from '../Find/FindList'
import prompt from '@ohos.prompt'

@Entry
@Component
export default struct Mine {
  @StorageLink(STATUS_BAR_HEIGHT) statusBarHeight: number = 0

  build() {
    Column(){
      // 在界面顶部放置一个与状态栏同高度的组件，用于占位，可避免界面内容与状态栏内容重叠
      Row()
        .width('100%')
        .backgroundColor(Color.White)
        .height(px2vp(this.statusBarHeight))
      Row(){
        //用户头像
        Image($r('app.media.user'))
          .width(70)
          .height(70)
          .margin({left:25, right: 10})
          .borderRadius(8)

        Column(){
          //用户名称
          Text('π')
            .fontSize(26)
            .fontColor(Color.Black)
            .fontWeight(700)
          //用户微信号
          Text('微信号:HarmonyOS')
            .fontSize(16)
            .fontColor(Color.Grey)
            .fontWeight(FontWeight.Bold)
            .margin({top:15})
          //用户状态
          Text('+ 状态')
            .fontColor(Color.Grey)
            .margin({top:20})
            .padding({left:8,right:8})
            .height(25)
            .fontSize(15)
            .borderRadius(20)
            .textAlign(TextAlign.Center)
            .borderWidth(0.7)
            .borderColor('#666')
            .backgroundColor(Color.White)
        }
        .margin({top:40})
        .alignItems(HorizontalAlign.Start)

        Blank()
        //二维码图标
        Image($r('app.media.qrcode'))
          .width(16)
          .height(16)
          .margin({ top: 38, right: 20 })
        //跳转图标
        Image($r('app.media.more'))
          .width(9)
          .height(16.364)
          .margin({ top: 38, right: 15 })
      }
      .width('100%')
      .height(200)
      .backgroundColor(Color.White)
      .onClick(() => {
        router.push({ url: 'pages/Mine/MyQC' })
      })

      Divider()
        .vertical(false)
        .color("#f3f3f3")
        .strokeWidth(10)
        .lineCap(LineCapStyle.Round)
      //功能列表
      FindList({leftImage:$r('app.media.service'), leftText:"服务"})
        .onClick(Tip)
      //列表间的间隙
      Divider()
        .vertical(false)
        .color("#f3f3f3")
        .strokeWidth(10)
        .lineCap(LineCapStyle.Round)
      FindList({leftImage:$r('app.media.collection'), leftText:"收藏"})
      .onClick(Tip)

      Divider()
        .vertical(false)
        .color("#f3f3f3")
        .strokeWidth(1)
        .lineCap(LineCapStyle.Round)
      FindList({leftImage:$r('app.media.moment_pic'), leftText:"朋友圈"})
      .onClick(Tip)

      Divider()
        .vertical(false)
        .color("#f3f3f3")
        .strokeWidth(1)
        .lineCap(LineCapStyle.Round)
      FindList({leftImage:$r('app.media.video'), leftText:"视频号"})
      .onClick(Tip)

      Divider()
        .vertical(false)
        .color("#f3f3f3")
        .strokeWidth(1)
        .lineCap(LineCapStyle.Round)
      FindList({leftImage:$r('app.media.card'), leftText:"卡包"})
      .onClick(Tip)

      Divider()
        .vertical(false)
        .color("#f3f3f3")
        .strokeWidth(1)
        .lineCap(LineCapStyle.Round)
      FindList({leftImage:$r('app.media.face'), leftText:"表情"})
      .onClick(Tip)

      Divider()
        .vertical(false)
        .color("#f3f3f3")
        .strokeWidth(10)
        .lineCap(LineCapStyle.Round)
      FindList({leftImage:$r('app.media.setting'), leftText:"设置"})
      .onClick(Tip)
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#f0f0f0")
  }
}
const Tip = () => {
  prompt.showToast({ message: "功能待开发...", duration: 2000 })
}