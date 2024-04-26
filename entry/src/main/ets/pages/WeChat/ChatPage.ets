import router from '@ohos.router';
import prompt from '@ohos.promptAction';
import Toolbar from '../../CommonTool/BackPage';
import LeftChatFrame from '..//WeChat/LeftChatFrame';
import RightCharFrame from '..//WeChat/RightChatFrame';

import window from '@ohos.window';
import { NAV_BAR_HEIGHT } from '../../Toptag/StatusBarManager';
import ChatAddBar from '../WeChat/ChatAddBar';

@Entry
@Component
export default struct ChatPage {
    name: string = "demo"
    controller: TextAreaController = new TextAreaController()
   keyboardHeight: number = 0
   @State  chatText: string = ''
   @StorageLink(NAV_BAR_HEIGHT) navBarHeight: number = 0
   @State  funcBarHeight: number = 0;
   @State  showFuncBar: boolean = false;

   //主页和聊天页面名称一致
   async aboutToAppear() {
      this.name = router.getParams()['name']
      await window.getLastWindow(getContext(this)).then(currentWindow => {
         currentWindow.on('keyboardHeightChange', (height) => {
            this.keyboardHeight = height;
         })
      })
   }

   onBackPress() {
      return this.keyboardHeight > 0
   }

   build() {
      Column() {
         Toolbar({ title: this.name })
         List({ space: 20, initialIndex: 5 }) {
            ListItem() {
               //左对话框
               LeftChatFrame()
            }

            ListItem() {
               //右对话框
               RightCharFrame()
            }

            ListItem() {
               LeftChatFrame()
            }

            ListItem() {
               RightCharFrame()
            }

            ListItem() {
               LeftChatFrame()
            }

            ListItem() {
               RightCharFrame().margin({ bottom: 15 })
            }

         }
         .width("100%")
         .height(0)
         .divider({ strokeWidth: 0.8, color: '#f0f0f0', startMargin: 90, endMargin: 0 }) // 每行之间的分界线
         .layoutWeight(1)

         Row() {
            //语音输入按钮
            Image($r("app.media.voice"))
               .width(33)
               .height(33)
               .borderRadius(4)
               .margin({ left: 15, right: 15 })
               .objectFit(ImageFit.Cover)
               .onClick(Tip)
            //输入对话框
            TextArea({ text: this.chatText, placeholder: '', controller: this.controller })
               .placeholderFont({ size: 20, weight: 400 })
               .caretColor(Color.Green)
               .placeholderColor(Color.Grey)
               .layoutWeight(1)
               .padding({ left: 8, right: 8 })
               .fontSize(20)
               .fontColor(Color.Black)
               .borderRadius(8)
                  // 设置stateStyles，解决点击编辑框会变色的问题
               .stateStyles({
                  normal: {.backgroundColor(Color.White)
                  },
                  pressed: {.backgroundColor(Color.White)
                  },
                  clicked: {.backgroundColor(Color.White)
                  },
                  focused: {.backgroundColor(Color.White)
                  } })
               .onChange((value: string) => {
                  this.chatText = value
               })
            //表情按钮
            Image($r("app.media.emoji"))
               .width(33)
               .height(33)
               .borderRadius(4)
               .margin({ left: 15, right: 5 })
               .objectFit(ImageFit.Cover)
               .onClick(Tip)
            //当输入字符时，自动右边加号变为“发送"
            Text("发送")
               .fontColor(Color.White)
               .width(65)
               .textAlign(TextAlign.Center)
               .height(36)
               .backgroundColor("#58BE6A")
               .fontSize(18)
               .visibility(this.chatText.length == 0 ? Visibility.None : Visibility.Visible)
               .borderRadius(6)
               .margin({ left: 10, right: 10 })
               .onClick(() => {
                  prompt.showToast({ message: this.chatText })
               })
            //添加按钮
            Image($r("app.media.add"))
               .width(33)
               .height(33)
               .borderRadius(4)
               .visibility(this.chatText.length == 0 ? Visibility.Visible : Visibility.None)
               .margin({ left: 15, right: 8 })
               .objectFit(ImageFit.Cover)
               .onClick(() => {
                  animateTo({ duration: 400, curve: Curve.Ease }, () => {
                     if (this.showFuncBar) {
                        this.funcBarHeight = 0;
                     } else {
                        this.funcBarHeight = 250;
                     }
                     this.showFuncBar = !this.showFuncBar;
                  })
               })

         }
         .padding({ top: 10, bottom: 10 })
         .alignItems(VerticalAlign.Bottom)
         .backgroundColor("#f9f9f9")

         Divider()
            .vertical(false)
            .color("#f0f0f0")
            .strokeWidth(1)
            .lineCap(LineCapStyle.Round)
         //添加控件
         ChatAddBar()
            .height(this.funcBarHeight)

         // 在界面底部放置一个与导航栏同高度的组件，用于占位，可避免界面内容与状态栏内容重叠
         Row().height(px2vp(this.navBarHeight))
      }
      .width("100%")
      .height("100%")
      .backgroundColor("#f1f1f1")
   }
}

const Tip = () => {
   prompt.showToast({ message: "功能待开发...", duration: 2000 })
}