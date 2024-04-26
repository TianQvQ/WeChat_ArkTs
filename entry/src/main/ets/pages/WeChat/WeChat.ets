import router from '@ohos.router';
import Toptag from '../../Toptag/Toptag'
import ChatList,{ChatItemData} from './ChatList'

@Entry
@Component
export default struct WeChat {
  @State chatList: ChatItemData[] = [
    {
      image: $r('app.media.file_helper'),
      name: "文件传输助手",
      content: "HarmonyOS.pdf",
      time: "23:55"
    },
    {
      image: $r('app.media.user'),
      name: "π",
      content: "😀",
      time: "22:16"
    },
    {
      image: $r('app.media.family'),
      name: "相亲相爱一家人",
      content: "老爸：五一要去哪里玩啊？",
      time: "21:25"
    },
    {
      image: $r('app.media.pic11'),
      name: "F芳芳",
      content: "又在忙啥，不理我。。。",
      time: "20:39"
    },
    {
      image: $r('app.media.pic12'),
      name: "G兄弟",
      content: "上号 今天哥们手感巨好",
      time: "19:06"
    },
    {
      image: $r('app.media.pic2'),
      name: "A弟弟",
      content: "我想要个篮球，老哥",
      time: "14:26"
    },
    {
      image: $r('app.media.pic10'),
      name: "E学姐",
      content: "周末有空吗？有件事想让你帮忙。",
      time: "12:36"
    },
    {
      image: $r('app.media.teacher'),
      name: "C覃老师",
      content: "你这个做的不太行啊，再改改。",
      time: "08:04"
    },
    {
      image: $r('app.media.pic7'),
      name: "B大舅",
      content: "有空过来玩，带你逛遍桂林😁",
      time: "昨天"
    },
    {
      image: $r('app.media.pic9'),
      name: "D学弟",
      content: "下个星期前要做出来哦",
      time: "周二"
    },
    {
      image: $r('app.media.pic5'),
      name: "B表姐",
      content: "我想学习一下你的算法思路求(•̀ω•́)✧",
      time: "周一"
    }
  ]
  build() {
    Column(){
      //顶部控件
      Toptag({title:"微信(11)"})
      List(){//列表
        ForEach(this.chatList, (item: ChatItemData) =>{
        ListItem(){
          ChatList({data:item})
        }
        //点击跳转后名称一致
        .onClick(() => {
          router.pushUrl({url:'pages/WeChat/ChatPage',params:{image:item.image,name:item.name}})
        })
        })
        ListItem(){
          Divider().color('#0000').strokeWidth(0)
        }
      }
      //每个列表之间的间隔线
      .divider({ strokeWidth:0.8, color: '#f0f0f0', startMargin: 90, endMargin: 0})
      .backgroundColor(Color.White)
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }
}