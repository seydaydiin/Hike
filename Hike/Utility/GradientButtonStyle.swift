//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Şeyda Aydın on 2.08.2023.
//

import Foundation
import SwiftUI

struct GradientButton : ButtonStyle {
    
    func makeBody (configuration : Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayMedium,
                                                    .customGrayLight]
                                           , startPoint: .top
                                           , endPoint: .bottom)
                :
                    LinearGradient(colors: [.customGrayLight,
                                                        .customGrayLight]
                                               , startPoint: .top
                                               , endPoint: .bottom)
                
        
            )
            .cornerRadius(40)
        
    }
}
