
@Entry
@Component
export default struct FindList {
  leftImage: Resource = $r('app.media.more')
  leftText: string = "朋友圈"
  rightImage: Resource = null
  rightText: string = ""
  build() {
      Column() {
        Row() {
          //左边图标
          Image(this.leftImage)
            .width(25)
            .height(25)
            .margin({ right: 18 })
          //功能名称
          Text(this.leftText)
            .fontColor(Color.Black)
            .fontSize(19)
            .margin({ right: 12 })
          Blank()
          //内容提示文字
          Text(this.rightText)
            .fontColor(Color.Gray)
            .fontSize(13)
            .margin({ right: 6 })
            .textAlign(TextAlign.Start)
          //跳转图标
          Image(this.rightImage)
            .width(this.rightImage === null ? 0 : 12)
            .height(this.rightImage === null ? 0 : 12)
            .margin({ right: 6 })
            .borderRadius(4)
          Image($r('app.media.more'))
            .width(9)
            .height(16)
        }
        .width('100%')
        .height(60)
        .backgroundColor("#fff")
        .padding({ left: 15, right: 15 })
      }
    }
}