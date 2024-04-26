@Preview
@Component
export default struct ChatList {
  data: ChatItemData = { image: null,
    name: "",
    content: "",
    time: ""
  }

  build() {
    Row() {
      //用户头像
      Badge({count:1,position:BadgePosition.RightTop,style:{fontSize:12,badgeSize:16,badgeColor:'#FA2A2D'}})
      {
        Image(this.data.image)
          .width(60)
          .height(60)
          // .margin({ right: 15 })
          .objectFit(ImageFit.Cover)
          .borderRadius(6)
          .borderWidth(2)
          .borderColor("#f0f0f0")
      }

      Column() {
        //用户/群聊名称
        Text(this.data.name)
          .fontColor(Color.Black)
          .fontSize(19)
          .fontWeight(500)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width("100%")
          .margin({left:8})
        //显示最近的发送/接受内容
        Text(this.data.content)
          .fontColor(Color.Gray)
          .fontSize(15)
          .width("100%")
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 7 ,left:8})

      }.layoutWeight(1)
      .margin({ right: 30 })
      .alignItems(HorizontalAlign.Start)
      //显示最近发送/接收信息的时间
      Text(this.data.time)
        .fontColor(Color.Gray)
        .fontSize(14)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 15, right: 6 })
    }
    .width("100%")
    .height(80)
    .backgroundColor(Color.White)
    .padding({ left: 15, right: 15 })
  }
}

export interface ChatItemData {
  image?: Resource
  name?: string
  content?: string
  time?: string
}