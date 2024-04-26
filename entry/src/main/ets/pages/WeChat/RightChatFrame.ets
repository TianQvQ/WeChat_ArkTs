@Preview
@Component
export default struct RightCharFrame {
  data: ChatContentItemData = {
    self: false,
    headSrc: $r("app.media.user"),
    content: "ArkTs语言非常有趣！",
  }

  build() {
    Row() {
      Column() {
        //聊天框内容
        Text(this.data.content)
          .fontColor(Color.Black)
          .fontWeight(500)
          .fontSize(18)
          .padding(13.5)
          .borderRadius(4)
          .backgroundColor("#a9ea7a")
      }
      .margin({ left: 80 })
      .alignItems(HorizontalAlign.End)
      .layoutWeight(1)
      //聊天框和头像之间的”尖角“
      Path()
        .commands(`M0 0 L${vp2px(10)} ${vp2px(7)} 0 ${vp2px(14)} Z`)
        .fill('rgb(169,234,122)')
        .margin({
          top:18
        })
        .strokeWidth(0)
      //用户头像
      Image(this.data.headSrc)
        .width(48)
        .height(48)
        .borderRadius(4)
        .margin({ left: 8, right: 20 })
        .objectFit(ImageFit.Cover)

    }.alignItems(VerticalAlign.Top)
  }
}

export interface ChatContentItemData {
  self?: boolean
  headSrc?: Resource
  content?: string
}