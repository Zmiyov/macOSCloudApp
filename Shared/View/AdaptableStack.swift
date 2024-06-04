//
//  AdaptableStack.swift
//  macOSCloudApp
//
//  Created by Vladimir Pisarenko on 04.06.2024.
//

import SwiftUI

struct AdaptableStack<Content: View, MenuView: View, SideView: View>: View {
    
    var content: Content
    var menuView: MenuView
    var sideView: SideView
    
    //For slide menu iOS
    @Binding var showMenu: Bool
    
    init(showMenu: Binding<Bool>, @ViewBuilder content: @escaping () -> Content, @ViewBuilder menuView: @escaping () -> MenuView, @ViewBuilder sideView: @escaping () -> SideView) {
        self._showMenu = showMenu
        self.content = content()
        self.menuView = menuView()
        self.sideView = sideView()
    }
    
    var body: some View {
        ZStack{
            
            #if os(iOS)
            ScrollView(.vertical) {
                
                VStack{
                    
                     content 
                    
                    sideView
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            .background(Color("gray").ignoresSafeArea())
            .overlay(
                
                menuView
                    .clipped()
                    .frame(width: getRect().width / 1.6)
                    .background(Color("gray").ignoresSafeArea())
                    .offset(x: showMenu ? 0 : -getRect().width)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        Color.black
                            .opacity(showMenu ? 0.35 : 0)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    showMenu.toggle()
                                }
                            }
                    )
            )
            
            #else
            //same as just now
            HStack{
                
                menuView
                //max width
                    .frame(width: 210)
                    .background(Color("gray").ignoresSafeArea())
                
                content
                
                sideView
            }
            .frame(width: getRect().width / 1.3, height: getRect().height - 100, alignment: .leading)
            .background(Color.white.ignoresSafeArea())
            .buttonStyle(PlainButtonStyle())
            #endif
        }
  
        .preferredColorScheme(.light)
    }
}
