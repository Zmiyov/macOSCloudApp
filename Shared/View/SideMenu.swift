//
//  SideMenu.swift
//  macOSCloudApp
//
//  Created by Vladimir Pisarenko on 03.06.2024.
//

import SwiftUI

struct SideMenu: View {
    
    @Namespace var animation
    @Binding var currentTab: String
    
    var body: some View {
        VStack{
            
            HStack{
                
                Text("Files")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    //letter spacing
                    .kerning(1.5)
                
                Text("Go")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .kerning(1.5)
                    .padding(8)
                    .background(Color("blue"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
            .padding(10)
            
            Divider()
                .background(Color.gray.opacity(0.4))
                .padding(.bottom)
            
            HStack(spacing: 12){
                
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text("Hi, I Justine")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
            }
            
            VStack(spacing: 15){
                TabButton(image: "house.fill", title: "Home", animation: animation, currentTab: $currentTab)
                TabButton(image: "folder.fill.badge.person.crop", title: "Shared Files", animation: animation, currentTab: $currentTab)
                TabButton(image: "star", title: "Starred Files", animation: animation, currentTab: $currentTab)
                TabButton(image: "waveform.path.ecg.rectangle.fill", title: "Statistics", animation: animation, currentTab: $currentTab)
                TabButton(image: "gearshape", title: "Settings", animation: animation, currentTab: $currentTab)
                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log Out", animation: animation, currentTab: .constant(""))
            }
            .padding(.leading,20)
            .offset(x: 15)
            .padding(.top, 20)
        }
        //to avoid spacers
        .frame(maxHeight: .infinity, alignment: .top)

    }
}

#Preview {
    ContentView()
}

struct TabButton: View {
    
    var image: String
    var title: String
    var animation: Namespace.ID
    @Binding var currentTab: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = title
            }
        }, label: {
            HStack(spacing: 15){
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundStyle(currentTab == title ? Color("blue") : Color.gray.opacity(0.8))
                
                Text(title)
                    .foregroundStyle(Color.black.opacity(0.8))
                    .kerning(1.2)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                ZStack{
                    
                    if currentTab == title {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.clear)
                    }
                }
            )
            //For mouse clicking on padded areas
            .contentShape(Rectangle())
        })
    }
}
