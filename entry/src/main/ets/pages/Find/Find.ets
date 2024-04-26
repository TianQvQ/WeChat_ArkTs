import router from '@ohos.router'
import Toptag from '../../Toptag/Toptag'
import FindList from './FindList'

@Entry
@Component
export default struct Find {

  build() {
      Column() {
        //顶部控件
        Toptag({ title: "发现" })
        //功能列表
        FindList({ leftImage: $r('app.media.moment'), leftText: "朋友圈" ,rightImage:$r('app.media.msg_remind')})
          .onClick(() => {
            router.pushUrl({url:'pages/Find/FriendCircle'})
          })
        Divider()
          .vertical(false)
          .color("#f3f3f3")
          .strokeWidth(10)
          .lineCap(LineCapStyle.Round)
        FindList({ leftImage: $r('app.media.video'),rightImage:$r('app.media.msg_remind'), leftText: "视频号" })
        Divider()
          .vertical(false)
          .color("#f3f3f3")
          .strokeWidth(10)
          .lineCap(LineCapStyle.Round)
        FindList({ leftImage: $r('app.media.live'), leftText: "直播" })
        Divider()
          .vertical(false)
          .color("#f3f3f3")
          .strokeWidth(10)
          .lineCap(LineCapStyle.Round)
        FindList({ leftImage: $r('app.media.scan'), leftText: "扫一扫" })
        Divider()
          .vertical(false)
          .color("#f3f3f3")
          .strokeWidth(10)
          .lineCap(LineCapStyle.Round)

        FindList({ leftImage: $r('app.media.look'), leftText: "看一看",rightImage:$r('app.media.msg_remind'), rightText: "2024季中冠军赛LPL出征仪式。" })
        Divider()
          .vertical(false)
          .color("#f3f3f3")
          .strokeWidth(10)
          .lineCap(LineCapStyle.Round)
        FindList({ leftImage: $r('app.media.listen'), leftText: "听一听" })
        Divider()
          .vertical(false)
          .color("#f3f3f3")
          .strokeWidth(10)
          .lineCap(LineCapStyle.Round)
        FindList({ leftImage: $r('app.media.game'), leftText: "游戏",rightImage:$r('app.media.msg_remind') })
        Divider()
          .vertical(false)
          .color("#f3f3f3")
          .strokeWidth(10)
          .lineCap(LineCapStyle.Round)
          .backgroundColor('#F0F0F0')
        FindList({ leftImage: $r('app.media.miniprogram'), leftText: "小程序" })
        Divider()
          .vertical(false)
          .color("#f3f3f3")
          .strokeWidth(10)
          .lineCap(LineCapStyle.Round)

      }
      .width('100%')
      .height('100%')
      .backgroundColor("#f0f0f0")
    }

}