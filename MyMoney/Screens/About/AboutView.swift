//
//  AboutView.swift
//  MyMoney
//
//  Created by Akniyet Turdybay on 24/12/22.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
                VStack {
                    ToolbarModelView(title: "About") { self.presentationMode.wrappedValue.dismiss() }
                    Spacer().frame(height: 80)
                    Image("app_logo").resizable().frame(width: 120.0, height: 120.0)
                    TextView(text: "\(Constants.shared.APP_NAME)", type: .h6).foregroundColor(Color.text_primary_color).padding(.top, 20)
                    
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack { Spacer() }
                            TextView(text: "VISIT", type: .overline).foregroundColor(Color.text_primary_color)
                            TextView(text: "\(Constants.shared.APP_LINK)", type: .body_2)
                                .foregroundColor(Color.main_color).padding(.top, 2)
                                .onTapGesture {
                                    if let url: URL = URL(string: Constants.shared.APP_LINK) {
                                        UIApplication.shared.open(url)
                                    }
                                }
                        }
                    }.padding(20)
                    Spacer()
                }.edgesIgnoringSafeArea(.all)
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
