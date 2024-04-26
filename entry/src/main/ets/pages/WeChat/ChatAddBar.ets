import prompt from '@ohos.prompt'

@Entry
@Component
@Preview
export default struct ChatAddBar {
  build() {
    Grid() {
      GridItem() {
        this.createMenu($r("app.media.camera"), "相册")
      }
      .onClick(Tip)

      GridItem() {
        this.createMenu($r("app.media.shoot"), "拍摄")
      }
      .onClick(Tip)

      GridItem() {
        this.createMenu($r("app.media.voice_call"), "语音通话")
      }
      .onClick(Tip)

      GridItem() {
        this.createMenu($r("app.media.location"), "位置")
      }
      .onClick(Tip)

      GridItem() {
        this.createMenu($r("app.media.hongbao"), "红包")
      }
      .onClick(Tip)

      GridItem() {
        this.createMenu($r("app.media.translation"), "转账")
      }
      .onClick(Tip)

      GridItem() {
        Text('位置').fontSize(16)
        this.createMenu($r("app.media.voice_input"), "语音输入")
      }
      .onClick(Tip)

      GridItem() {
        this.createMenu($r("app.media.my_collection"), "我的收藏")
      }
      .onClick(Tip)

      GridItem() {
        this.createMenu($r("app.media.voice"), "群工具")
      }
      .onClick(Tip)
    }
    .maxCount(4)
    .layoutDirection(GridDirection.Row)
    .rowsTemplate('1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .height(250)
    .backgroundColor("#f9f9f9")
    .padding({ top: 20, bottom: 20 })
  }

  @Builder createMenu(iconSrc: Resource, menuName: string) {
    Column() {
      //图片
      Image(iconSrc)
        .width(60)
        .height(60)
        .objectFit(ImageFit.Fill)
        .margin({ bottom: 5 })
        .padding(13)
        .borderRadius(15)
        .backgroundColor(Color.White)
      // 文本
      Text(menuName)
        .fontColor(Color.Gray)
        .fontSize(14)
    }
    .borderRadius(20)
    .justifyContent(FlexAlign.Center)
    .width(70)
    .height(70)
  }
}

const Tip = () => {
  prompt.showToast({ message: "功能待开发...", duration: 2000 })
}