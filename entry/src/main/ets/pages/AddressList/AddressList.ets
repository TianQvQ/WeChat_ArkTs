import { Size } from '@ohos/hypium'
import Toptag from '../../Toptag/Toptag'
import addressItem from './addressItem'
import prompt from '@ohos.prompt';
import image from '@ohos.multimedia.image';
import router from '@ohos.router';

@Entry
@Component
export default struct AddressList {
  private letterList: string[] = ['↑', '☆', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '#']
  scroller: Scroller = new Scroller()
  addressList: any = [
    {
      title: '',
      contentList:[
        { name: "新的朋友", image: $r('app.media.new_friend')},
        { name: "群聊", image: $r('app.media.group')},
        { name: "标签", image: $r('app.media.tag')},
        { name: "公众号", image: $r('app.media.official_account')}
      ]
    },
    {
      title: '我的企业及企业联系人',
      contentList:[
        { name: "企业微信联系人", image: $r('app.media.enterprise')},
        { name: "企业微信通知", image: $r('app.media.enterprise')},
        { name: "学习通知", image: $r('app.media.enterprise')}
      ]
    },
    {
      title: 'A',
      contentList:[
        { name: "A爸爸", image: $r('app.media.pic1')},
        { name: "A弟弟", image: $r('app.media.pic2')},
        { name: "A姐姐", image: $r('app.media.pic3')},
        { name: "A妈妈", image: $r('app.media.pic4')},
      ]
    },
    {
      title: 'B',
      contentList:[
        { name: "B表姐", image: $r('app.media.pic5')},
        { name: "B表哥", image: $r('app.media.pic6')},
        { name: "B大舅", image: $r('app.media.pic7')},
        { name: "B舅妈", image: $r('app.media.pic8')},
      ]
    },
    {
      title: 'C',
      contentList:[
        { name: "C覃老师", image: $r('app.media.teacher')},
      ]
    },
    {
      title: 'D',
      contentList:[
        { name: "D学弟", image: $r('app.media.pic9')},
      ]
    },
    {
      title: 'E',
      contentList:[
        { name: "E学姐", image: $r('app.media.pic10')},
      ]
    },
    {
      title: 'F',
      contentList:[
        { name: "F芳芳", image: $r('app.media.pic11')},
      ]
    },
    {
      title: 'G',
      contentList:[
        { name: "G兄弟", image: $r('app.media.pic12')},
      ]
    }
  ]
  build() {
    Stack({ alignContent:Alignment.End }){
      Column(){
        //顶部标签
        Toptag({title:"通讯录"})
        //滚动列表
        List({scroller: this.scroller}){
          ForEach(this.addressList, (item) => {
            //分类标头'A','B'...
            ListItemGroup({header:this.letterflag(item.title)}){
              ForEach(item.contentList,(item) => {
                ListItem(){
                  //列表图片、名称
                  addressItem({content:item.image, name:item.name})
                }
                .onClick(() => {
                  router.pushUrl({url:"pages/WeChat/ChatPage",params:{name:item.name}})
                })
              })
            }
            //分界线
            .divider({strokeWidth:0.8, color:'#f0f0f0', startMargin: 85, endMargin: 0})
          })
        }
        .width('100%')
        .height(0)
        .layoutWeight(1)
        .backgroundColor(Color.White)
      }
      .width('100%')
      .height('100%')
      //右边字母序列
      AlphabetIndexer({arrayValue:this.letterList, selected: 0})
        .color(Color.Black)
        .font({size:14})
        .usingPopup(true)
        .selectedFont({size:14})
        .selectedColor(Color.Black)
        .selectedBackgroundColor(Color.Transparent)
        .popupColor(Color.White)
        .popupBackground("#00BFFF")
        .popupFont({size:32, weight:FontWeight.Bolder})
        .itemSize(20)
        .alignStyle(IndexerAlign.Right)
        .margin({top:80})
        //选中字母后的预览画面
        .onSelect((index:number) => {
          let letter = this.letterList[index]
          var target:number = 0
          for(const item of this.addressList){
            if (letter === item.title){
              this.scroller.scrollToIndex(target)
              prompt.showToast({message:" " + target})
              break
            }
            target ++
          }
        })
    }
  }

@Builder letterflag(title: string) {
    Text(title)
      .fontSize(14)
      .visibility("" === title ? Visibility.None : Visibility.Visible)
      .backgroundColor("#EDEDED")
      .height(36)
      .width("100%")
      .padding({ left: 20 })
}
}