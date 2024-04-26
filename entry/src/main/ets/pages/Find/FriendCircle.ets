import router from '@ohos.router'
import prompt from '@ohos.prompt';
import Toolbar from '../../CommonTool/BackPage'
@Entry
@Preview
@Component
export default struct FriendCircle {
  scroller: Scroller = new Scroller();

  build(){
    Column(){
      //顶部控件
      Toolbar({title:"",subIconSrc:$r('app.media.FC_camera')})
      //滚动栏
      Scroll(this.scroller){
        Column(){
          Column(){
            //用户头像
            Image($r('app.media.user'))
              .width(80)
              .height(80)
              .borderRadius(12)
              .position({ x: 260, y: 200 })
          }
          .width('100%')
          .height(300)
          .backgroundImage($r('app.media.HelloWorld'))//背景图片

          Row(){
            //新消息提示
            this.NewMessage($r('app.media.pic5'),"99+条新消息")
          }
          .backgroundColor(Color.Gray)
          .borderRadius(12)
          .borderWidth(0.5)
          .borderColor('#666')
          .width(160)
          //具体朋友圈内容
          Column(){
            this.CirCleList($r('app.media.user'),'π',"I have a dream of graduate school, but will it come true？",$r('app.media.pic8'))
            this.CirCleList($r('app.media.user'),'π',"I have a dream of graduate school, but will it come true？",$r('app.media.pic8'))
            this.CirCleList($r('app.media.user'),'π',"I have a dream of graduate school, but will it come true？",$r('app.media.pic8'))

          }
        }
        .width('100%')
      }
    }
  }
  //中间栏消息提示
  @Builder NewMessage(image:Resource, word:string){
    Row(){
      //图片
      Image(image)
        .width(40)
        .height(40)
      //文本
      Text(word)
        .fontColor(Color.White)
        .padding({left:8,right:8})
        .height(25)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Gray)
        .fontWeight(500)
    }
    .onClick(Tip)
  }
  //朋友圈列表
  @Builder CirCleList(icon: ResourceStr, name: string, content?: string, images?: ResourceStr){
    Column({space:10}){
      //用户头像、名称
      Row({space:8}){
        Image(icon)
          .width(50)
          .height(50)
          .borderRadius(12)
        Text(name)
          .fontWeight(FontWeight.Bold)
          .fontSize(18)
      }
      .width('100%')
      .padding(12)
      Row(){
        //内容
        Text(content)
          .fontSize(20)
          .fontWeight(600)
          .fontColor(Color.Black)
          .margin({left:55})
      }.width('100%')
      .padding({left:12})
      //图片内容
      Image(images)
        .width(260)
        .height(260)
        .borderRadius(12)
        .margin({left:25})
      Row(){
        Text('1小时前')
          .fontColor(Color.Gray)
          .fontSize(15)
          .fontWeight(FontWeight.Regular)
          .margin({left:50})
        Blank()
        Image($r('app.media.toolbar_more'))
          .width(35)
          .height(35)
          .onClick(Tip)
      }
      .width('100%')
      .padding(12)
      Divider().width('100%')
    }
  }
}

const Tip = () => {
  prompt.showToast({ message: "功能待开发...", duration: 2000 })
}