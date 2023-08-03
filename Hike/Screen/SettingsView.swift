//
//  SettingsView.swift
//  Hike
//
//  Created by Şeyda Aydın on 2.08.2023.
//

import SwiftUI

struct SettingsView: View {
    
    private let alternateIcons : [String] = [
    
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-Backpack"
    
    ]
    
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size:80,weight:.black))
                    VStack(spacing : -10){
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size:80,weight:.black))
                    
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
                
                .padding(.top,8)
                VStack(spacing : 8){
                    Text("Where you can find \nPerfect tracks?")
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. Find the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                    
                }
                .frame(width: .infinity)
                .multilineTextAlignment(.center)
                .padding(.bottom,16)
            }
            .listRowSeparator(.hidden)
            
            Section(
                header : Text("Alternate Icons")
            ) {
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing : 12 ) {
                        ForEach(alternateIcons.indices , id : \.self) { item in
                            Button{
                                print("Icon \(alternateIcons[item]) was pressed")
                                
                                UIApplication.shared.setAlternateIconName(alternateIcons[item])
                                { error in
                                    if error != nil {
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    }
                                    else {
                                        print("succes")
                                    }
                                }
                                
                            }label: {
                                Image("\(alternateIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top,12)
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0 ,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
                
            }
            
            .listRowSeparator(.hidden)
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright ® All right reserved.")
                    Spacer()
                    
                }
                    .padding(.vertical,8)
            ) {
                
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "IOS,IPadOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel : "Credo Academy",rowLinkDestination: "https://credo.academy")
                
            }
        }
     
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
