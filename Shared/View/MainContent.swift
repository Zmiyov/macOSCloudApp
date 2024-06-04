//
//  MainContent.swift
//  macOSCloudApp
//
//  Created by Vladimir Pisarenko on 03.06.2024.
//

import SwiftUI

struct MainContent: View {
    
    @State var search = ""
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack{
            
            HStack{
                
                if !isMacOS() {
                    
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }, label: {
                        
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundStyle(.black)
                    })
                }
                
                Text("Dashboard")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                Spacer(minLength: 0)
                
                if isMacOS() {
                    CustomSearchBar(search: $search)
                        .frame(maxWidth: 300)
                }
            }
            .padding(isMacOS() ? 15 : 0)
            
            if !isMacOS() {
                CustomSearchBar(search: $search)
                    .padding(.bottom )
            }
            
            ZStack {
                
                if isMacOS() {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        BodyContent()
                    })
                } else {
                    BodyContent()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("gray"))
            .clipShape(RoundedRectangle(cornerRadius: isMacOS() ? 10 : 0))
            .padding(isMacOS() ? 10 : 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}

struct BodyContent: View {
    
    
    var body: some View {
        
        VStack{
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                HStack {
                    StorageView(image: "dropbox", title: "Dropbox", percentage: 0.6)
                    StorageView(image: "drive", title: "Google Drive", percentage: 0.25)
                    StorageView(image: "icloud", title: "iCloud", percentage: 0.9)
                }
            })
            
            Text("Quick Access")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            //Quick access buttons
            ScrollView(.horizontal) {
                
                HStack(spacing: 0){
                    
                    AccessButton(title: "Pictures", image: "photo", color: .yellow)
                    AccessButton(title: "Music", image: "music.note.house.fill", color: .blue)
                    AccessButton(title: "Videos", image: "play.rectangle.fill", color: .red)
                    AccessButton(title: "Apps", image: "square.grid.2x2.fill", color: .yellow)
                    AccessButton(title: "Documents", image: "doc.fill", color: .blue)
                    AccessButton(title: "Downloads", image: "arrow.down.app.fill", color: .pink)
                }
                .padding(.top)
            }
            .scrollIndicators(.hidden)
            
            Text("Recent Files")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                
                HStack{
                    
                    VStack{
                        
                        HStack{
                            Text("Name")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                            Spacer(minLength: 0)
                            
                            Text("Size")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Divider()
                        //Files
                        VStack(spacing: 12) {
                            FilesView(fileName: "iJustine.jpg", fileSize: "8MB", fileImage: "photo")
                            FilesView(fileName: "Apple.mp4", fileSize: "8MB", fileImage: "play.rectangle.fill")
                            FilesView(fileName: "WWDC.jpg", fileSize: "8MB", fileImage: "photo")
                            FilesView(fileName: "SwiftUI 3.0.mp4", fileSize: "8MB", fileImage: "play.rectangle.fill")
                            FilesView(fileName: "iJustine.jpg", fileSize: "8MB", fileImage: "photo")
                        }
                    }
                    .padding()
                    .frame(width: 250)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                }
            }
        }
        .padding(isMacOS() ? 15 : 0)
    }
}

struct CustomSearchBar: View {
    
    @Binding var search: String
    
    var body: some View {
        //Custom search bar
        HStack{
            
            TextField("Search", text:  $search)
                .textFieldStyle(PlainTextFieldStyle())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(Color("blue"))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            })
        }
        .padding(.leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.05), radius: 5, x: -5, y: -5)
    }
}

struct StorageView: View {
    
    var image: String
    var title: String
    var percentage: CGFloat
    
    var body: some View {
        HStack{
            
            VStack(alignment: .leading, spacing: 8, content: {
                
                HStack{
                    
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                    
                    Divider()
                        .frame(height: 45)
                        .padding(.horizontal)
                    
                    ZStack{
                        
                        Circle()
                            .stroke(Color.gray.opacity(0.4), lineWidth: 10)
                        
                        Circle()
                            .trim(from: 0.0, to: percentage)
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .rotationEffect(.init(degrees: -90))
                        
                        Text("\(Int(percentage * 100))%")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    .frame(width: 50, height: 50)
                }
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(.top)
                
                Text("143GB / 150GB")
                    .font(.caption)
                    .foregroundStyle(.gray)
            })
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct AccessButton: View {
    
    var title: String
    var image: String
    var color: Color
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            
            VStack(spacing: 12){
                
                Image(systemName: image)
                    .font(.title)
                    .foregroundStyle(color)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .kerning(1.3)
                    .foregroundStyle(.black)
            }
            .frame(width: isMacOS() ? 80 : 100)
        })
    }
}

struct FilesView: View {
    
    var fileName: String
    var fileSize: String
    var fileImage: String
    
    var body: some View {
        HStack(spacing: 12){
            
            Image(systemName: fileImage)
                .foregroundStyle(fileImage == "photo" ? .yellow : .pink)
                .padding(6)
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color.gray.opacity(0.3)))
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(fileName)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                Text("20 March 1984")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
            })
            
            Spacer(minLength: 10)
            
            Text(fileSize)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.black)
        }
    }
}
