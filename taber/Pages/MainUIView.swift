//
//  MainUIView.swift
//  taber
//
//  Created by Karim Hassan on 15/06/2022.
//

import SwiftUI

struct MainUIView: View {
    @State var selectedIndex:Int = 0
    var _db:DB = DB()
    @State var expenses:[Expense]=[]
    var body: some View {
        ZStack{
            Color.init(red: 39/255, green: 39/255, blue: 42/255)
            
            VStack{
                ZStack{
                    Color.init(red: 24/255, green: 24/255, blue: 27/255)
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
                                selectedIndex=1
                                
                            }
                            
                        }.foregroundColor(Color.black)
                    }.frame(width:120,height: 40.0).padding()
                    Spacer()
                }
                if(selectedIndex == 0){
                    ContentView(expenses: expenses)
                }else{
                    ExpensesLogs(expenses: expenses)
                }
                Spacer()
            }.task {
                if (expenses.count>0){
                    
                }else{
                    do{
                        let e = try await GetExpenses()
                        expenses = e
                    }catch{
                        print("err")
                    }
                }
                
            }
        }.edgesIgnoringSafeArea(.all).foregroundColor(.white)
        
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
