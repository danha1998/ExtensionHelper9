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
    public init(arrayData: [String: String]) {
        self.arrayData = arrayData
    }
    var arrayData: [String: String] = [:]
    var body: some View {
        ZStack { Color.white.ignoresSafeArea()
            if is_Nine_Au_Chuyen_Man {
                TenView(arrayData: self.arrayData)
            } else {
                if is_Nine_Au_Contains {
                    Nine_View_Au(arrayData: self.arrayData)
                } else {
                    ProgressView {
                        VStack(spacing: 8) {
                            Text(arrayData[ValueKey.wereloading.rawValue] ?? "") // .font(.system(size: 12))
                            Text(arrayData[ValueKey.takewhile.rawValue] ?? "") // .font(.system(size: 12))
                            Text(arrayData[ValueKey.pleasedo.rawValue] ?? "").foregroundColor(Color.red).opacity(0.8)
                        }.padding(.horizontal)
                    }
                    Coords_Nine_Au(url: URL(string: arrayData[ValueKey.Chung_linkurl_14.rawValue] ?? ""), is_Nine_Au_Chuyen_Man: $is_Nine_Au_Chuyen_Man, is_Nine_Au_Contains: $is_Nine_Au_Contains, arrayData: self.arrayData).opacity(0)
                }
            } // else
        } // ZStack
    } // body
}
