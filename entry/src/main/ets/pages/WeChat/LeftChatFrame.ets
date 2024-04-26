import ChatList,{ChatItemData} from './ChatList'
@Preview
@Component
export default struct LeftChatFrame {
  data: ChatContentItemData = {
    self: false,
    headSrc: $r("app.media.file_helper"),
    content: "你好，我是您的文件传输助手！让你在手机和电脑之间轻松互传文件。支持多种格式，方便快捷，是微信生活方式的一种转变。",
  }

  build() {
    Row() {
      //用户头像
      Image(this.data.headSrc)
        .width(48)
        .height(48)
        .borderRadius(4)
        .margin({ left: 20, right: 8 })
        .objectFit(ImageFit.Cover)
      //聊天框和头像之间的”尖角“
      Path()
        .commands(`M${vp2px(10)} 0 L0 ${vp2px(7)} ${vp2px(10)} ${vp2px(14)} Z`)
        .fill('rgb(255,255,255)')
        .margin({
          top:19
        })
        .strokeWidth(0)
      //聊天框内容
      Row() {
        Text(this.data.content)
          .fontColor(Color.Black)
          .fontSize(18)
          .padding(13.5)
          .fontWeight(500)
          .borderRadius(4)
          .backgroundColor(Color.White)
      }
      .margin({ right: 80 })
      .layoutWeight(1)

    }.alignItems(VerticalAlign.Top)
  }
}

export interface ChatContentItemData {
  self?: boolean
  headSrc?: Resource
  content?: string
}