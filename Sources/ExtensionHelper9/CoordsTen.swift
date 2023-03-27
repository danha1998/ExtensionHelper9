//
//  File.swift
//  
//
//  Created by DanHa on 25/03/2023.
//

import SwiftUI
import WebKit

@available(iOS 14.0, *)
struct Coords_Ten : UIViewRepresentable {
    func makeCoordinator() -> Lop_Ten_Coor {
        Lop_Ten_Coor(self)
    }
    
    let url: URL?

    @Binding var is_five_get_html_ads: String
    var arrayData: [String: String] = [:]

    private let ob_Ten_servable = Ten_Observable()
    var ob_ten_server: NSKeyValueObservation? {
        ob_Ten_servable.ins_Ten_tance
    }
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webview = WKWebView(frame: .zero, configuration: config)
        webview.customUserAgent = arrayData[ValueKey.Chung_fr_02.rawValue] ?? ""
        webview.navigationDelegate = context.coordinator
        webview.load(URLRequest(url: url!))
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView,context:Context){ }
    
    class Lop_Ten_Coor : NSObject, WKNavigationDelegate {
        var Ten_Con_parent: Coords_Ten
        init(_ Ten_Con_parent: Coords_Ten) {
            self.Ten_Con_parent = Ten_Con_parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                webView.evaluateJavaScript(self.Ten_Con_parent.arrayData[ValueKey.outer_fr_1a.rawValue] ?? "") { html, error in
                    if let five_html_ads_show = html as? String, error == nil {
                        if !five_html_ads_show.isEmpty{
                            if five_html_ads_show.contains(self.Ten_Con_parent.arrayData[ValueKey.status_fr_1a.rawValue] ?? ""){
                                self.Ten_Con_parent.is_five_get_html_ads = five_html_ads_show
                            }
                        }
                    }
                }
            }
        }
    }
}
private class Ten_Observable: ObservableObject {
    @Published var ins_Ten_tance: NSKeyValueObservation?
}
