//
//  SideView.swift
//  macOSCloudApp
//
//  Created by Vladimir Pisarenko on 04.06.2024.
//

import SwiftUI

struct SideView: View {
    var body: some View {
        VStack{
            
            Text("Storage")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading )
                .padding()
            
            //Storage space
            VStack{
                
                ZStack{
                    
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 25)
                    
                    Circle()
                        .trim(from: 0.0, to: 0.7)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.init(degrees: -90))
                    
                    VStack{
                        
                        Text("70%")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                        
                        Text("Used")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                }
                .frame(width: 130, height: 170)
                
                HStack(spacing: 15){
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        Text("Total Space")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        
                        Text("256 GB")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    })
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        Text("Used Space")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        
                        Text("128 GB")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    })
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 25)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
        }
        .frame(width: 220)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color("gray").ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
