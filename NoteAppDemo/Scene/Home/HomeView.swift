//
//  ContentView.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 28/11/22.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab = 0
    @State var search = ""
    
    var body: some View {
        NavigationView {
            ZStack (alignment:.bottom){
                VStack {
                    ScrollView (showsIndicators:false){
                        searchView
                        NoteListView()
                        
                    }
                    tabBottomView
                }   
            }
            .ignoresSafeArea(.all,edges: .bottom)
            .toolbar {
                ToolbarItem (placement:.bottomBar) {
                 
                }
              
            }
        }
        
    }
    
    var searchView: some View {
        ZStack {
            HStack {
                TextField("Search note", text: $search)
                    .padding(.all,8.0)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "square.grid.2x2")
                        .resizable()
                        .frame(width:20,height:20)
                }.padding([.trailing],8.0)
                Button {
                    
                } label: {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width:20,height:20)
                }.padding([.top,.bottom,.trailing],16.0)
            }
            
        }
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 2)
                .stroke(.black.opacity(0.1), lineWidth: 0.9)
        ).frame(height:50)
        
        .padding([.top],4.0)
        .padding([.leading,.trailing],16.0)
        .shadow(radius: 2,x: 1,y:1)
    }
    
    var tabBottomView: some View {
        ZStack {
            TabBarShape()
                .fill(AppThemeColor.themeColor)
                .frame(width:UIScreen.main.bounds.width,height: 70)
                .overlay(
                        ZStack (alignment:.bottomTrailing) {
                            HStack() {
                                Spacer(minLength: 10)
                                Button{
                                    //  selectedTab = item.rawValue
                                } label: {
                                    CustomTabItem(imageName: TabbedItems.home.iconName, title: TabbedItems.home.title, isActive: false)
                                }
                                Button{
                                    //  selectedTab = item.rawValue
                                } label: {
                                    CustomTabItem(imageName: TabbedItems.favorite.iconName, title: TabbedItems.favorite.title, isActive: false)
                                }
                                Button{
                                    //  selectedTab = item.rawValue
                                } label: {
                                    CustomTabItem(imageName: TabbedItems.chat.iconName, title: TabbedItems.chat.title, isActive: false/*(selectedTab == item.rawValue)*/)
                                }
                                Spacer(minLength: 200)
                            }
                            NavigationLink(destination: TextDetailView()) {
                                Button{
                                    
                                } label: {
                                    CustomTabItem(imageName: TabbedItems.profile.iconName, title: TabbedItems.profile.title, isActive: true)
                                }
                            }
                            
                            
                        })
        }.shadow(radius: 2,x:0,y:-1)
    }
}

extension HomeView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack (alignment:.center){
            if title == TabbedItems.profile.title {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .frame(width: 55, height: 55, alignment: .center)
                    .overlay(
                        Image(systemName: imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30,alignment:.center)
                            .cornerRadius(30))
                            .offset(x: -37, y: -40)
                            .shadow(radius: 2.0,x:-1,y:1)
                            
                
            } else {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.clear)
                    .overlay(
                        VStack (alignment:.center) {
                            Image(systemName: imageName)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                                
                            Text(title)
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        })
            }
        }
    }
}

struct TabBarShape: Shape {
    private enum Constants {
        static let cornerRadius: CGFloat = 20
        static let buttonRadius: CGFloat = 30
        static let buttonPadding: CGFloat = 5
    }
    
    func path(in rect:CGRect) -> Path {
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: (rect.width / 2) * 1.5 , y: 0))
        path.addLine(to: CGPoint(x: (rect.width / 2) * 1.5, y: 35))
        path.addLine(to: CGPoint(x: (rect.width / 1.5) + 100, y: 35))
        path.addLine(to: CGPoint(x: (rect.width / 1.5) + 100, y: 0))
        path.addLine(to: CGPoint(x: rect.width , y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 100))
        path.addLine(to: CGPoint(x: 0, y: 100))
        path.addLine(to: .zero)
        path.close()
        return Path(path.cgPath)
      /*  let path = UIBezierPath()

                path.move(to: .init(x: 0, y: rect.height))
                path.addLine(to: .init(x: 0, y: rect.height))
                path.addArc(withCenter: .init(x: 0, y: 0), radius: 0, startAngle: 180, endAngle: 0, clockwise: true)

        let lineEnd = rect.width/1.2 - 2 * Constants.buttonPadding - Constants.buttonRadius
                path.addLine(to: .init(x: lineEnd, y: 0))
        path.addArc(withCenter: .init(x: lineEnd, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: -CGFloat.pi/1.2, endAngle: 0, clockwise: true)
        path.addArc(withCenter: .init(x: rect.width/1.2, y: Constants.buttonPadding), radius: Constants.buttonPadding + Constants.buttonRadius, startAngle: CGFloat.pi, endAngle: 0, clockwise: false)

                let lineStart = rect.width/1.2 + 2 * Constants.buttonPadding + Constants.buttonRadius
                path.addArc(withCenter: .init(x: lineStart, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/1.2, clockwise: true)
        path.addLine(to: .init(x: rect.width, y: 0))
        path.addArc(withCenter: .init(x: rect.width, y: 0), radius: 0, startAngle: -CGFloat.pi/1, endAngle: 0, clockwise: true)
                path.addLine(to: .init(x: rect.width, y: rect.height))
                path.close()

                return Path(path.cgPath)*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
