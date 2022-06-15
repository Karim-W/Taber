//
//  MainUIView.swift
//  taber
//
//  Created by Karim Hassan on 15/06/2022.
//

import SwiftUI

struct MainUIView: View {
    @State var selectedIndex:Int = 0
    var body: some View {
        ZStack{
            Color.init(red: 15/255, green: 118/255, blue: 110/255)
            VStack{
                ZStack{
                    Color.init(red: 19/255, green: 78/255, blue: 74/255)
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Tabber").fontWeight(.light).font(.largeTitle).foregroundColor(Color.white)
                            Spacer()
                        }.padding(.bottom)
                    }
                }.frame( height: 100.0)
                HStack{
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 16).foregroundColor(Color.white)
                        HStack{
                            Button("Home"){
                             selectedIndex = 0
                            }
                            Divider()
                            Button("Logs"){
                                selectedIndex = 1
                            }

                        }.foregroundColor(Color.black)
                    }.frame(width:120,height: 40.0).padding()
                    Spacer()
                }
                if(selectedIndex == 0){
                    ContentView()
                }else{
                    Text("logs")
                }
                Spacer()
            }
            
        }.edgesIgnoringSafeArea(.all).foregroundColor(.white)
        
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
