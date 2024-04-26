import WeChat from './WeChat/WeChat'
import AddressList from './AddressList/AddressList'
import Find from './Find/Find'
import Mine from './Mine/Mine'
import { NAV_BAR_HEIGHT } from '../Toptag/StatusBarManager'
@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
   tabController: TabsController = new TabsController()
   tabTitles: string[] = ["微信", "通信录", "发现", "我"]
   tabTextColors: string[] = ["#040404", "#57be6a"]
   tabTipCounts: number[] = [11, 0, 99, 0]
  @StorageLink(NAV_BAR_HEIGHT) navBarHeight: number = 0

  build() {
    Column(){
      //底部控件
      Tabs({barPosition:BarPosition.End,controller: this.tabController}){

        //微信页面
        TabContent(){
          WeChat()
        }
        .tabBar(this.TabCreate(0))

        //通讯录页面
        TabContent(){
          AddressList()
        }
        .tabBar(this.TabCreate(1))

        //发现页面
        TabContent() {
          Find()
        }
        .tabBar(this.TabCreate( 2))

        //我的页面
        TabContent(){
          Mine()
        }
        .tabBar(this.TabCreate(3))
      }
      .width('100%')
      .height('100%')
      .barHeight(65)
      .backgroundColor('#F4F4F4')
      .vertical(false)
      .layoutWeight(1)
      .onChange(index => {
        this.currentIndex = index;
      })
      // 在界面底部放置一个与导航栏同高度的组件，用于占位，可避免界面内容与状态栏内容重叠
      Row().height(px2vp(this.navBarHeight))
    }
    .width('100%')
    .height('100%')
  }

  //底部标签实现
  @Builder TabCreate(index:number){
    Stack({alignContent:Alignment.Center}){
      Badge({count: this.tabTipCounts[index],maxCount:99,//最大消息数
        position:BadgePosition.RightTop,//位置
        style:{color:'#FFFFFF',fontSize:13,badgeSize:20,badgeColor:Color.Red}})//自定义UI
      {
        Column(){
          //底部图标
          Image(this.currentIndex === index ? `/images/Tab${index}_click.png`: `/images/Tab${index}.png`)
            .width(30)
            .height(26)
            .objectFit(ImageFit.Fill)
            .margin({bottom:3})
          //底部标签
          Text(this.tabTitles[index])
            .fontColor(this.tabTextColors[this.currentIndex === index?1:0])
            .fontSize(14)
        }
        .backgroundColor(Color.Transparent)
        .justifyContent(FlexAlign.Center)
      }
      .width(42)
      .height(40)
    }
    .width('100%')
    .height('100%')
  }
}