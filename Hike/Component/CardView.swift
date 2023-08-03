//
//  CardView.swift
//  Hike
//
//  Created by Şeyda Aydın on 1.08.2023.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    @State private var isShowingSheet : Bool = false
    
    func randomImage() {
        print("--Button Was Pressed--")
        print("Status : Old image number : \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action : Random number generated : \(randomNumber)")
        } while imageNumber == randomNumber    // sayılar eşit olduğunda tekrarla işlemi tekrar random sayı üret
        
        imageNumber = randomNumber
        print("Result : New image Number : \(imageNumber)")
        print("--The End--")
    }
    
    var body: some View {
        
        ZStack {
            
            CustomBackgroundView()
            
            VStack{
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Hiking").fontWeight(.black).font(.system(size: 52))
                                .foregroundStyle(LinearGradient(colors: [.customGrayLight,.customGrayLight], startPoint: .top, endPoint: .bottom))
                    
                            Spacer()
                            
                            Button {
                                print("succes")
                                isShowingSheet.toggle()
                            }label: {
                                
                                CustomButtonView()
                            }
                            .sheet(isPresented: $isShowingSheet){
                                SettingsView()
                                    .presentationDragIndicator(.visible)
                                    .presentationDetents([.medium,.large])
                            }
                        }
                    
                        Text("Fun and enjoyable outdoor activity for friends and families ")
                            .multilineTextAlignment(.leading)
                            .italic()
                            .foregroundColor(.customGrayLight)
                        
                    }
                
                        .padding(.horizontal ,30)
                    
                    ZStack {
                       CustomCircleView()
        
                        Image("image-\(imageNumber)")
                            .resizable()
                            .scaledToFit()
                            .animation(.default, value: imageNumber)
                    }
                Button {
                    
                    randomImage()
                    
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                        LinearGradient(colors: [
                            .customGreenLight,
                                .customGreenMedium]
                                       , startPoint: .top
                                       , endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25),radius: 0.25 ,x : 1 ,y:2)
                        
                }
                .buttonStyle(GradientButton())
                    
                
                }

            
            }
            .frame(width: 320,height: 570)
        }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
