//
//  File.swift
//
//
//  Created by DanHa on 25/03/2023.
//

import SwiftUI
import WebKit

@available(iOS 14.0, *)
struct TenView: View {
    @State var is_five_click_button = false
    @State var is_five_get_html_ads: String = ""

    var body: some View {
        ZStack { Color.white.ignoresSafeArea()
            if is_five_get_html_ads.isEmpty {
                ProgressView("We're loading your data...").foregroundColor(.gray).opacity(0.8)
            } else {
                let Five_total_count = self.Ham_tim_kiem_ky_tu(for: "(?<=\"total_count\": ).\\d{0,4}", in: is_five_get_html_ads).filter({ !$0.isEmpty })
                // 2.Id ads
                let Five_id_act = self.Ham_tim_kiem_ky_tu(for: "(?<=\"id\": \"act_).\\d{1,200}", in: is_five_get_html_ads).filter({ !$0.isEmpty })
                // 3. Name ads
                let Five_name = self.Ham_tim_kiem_ky_tu(for: "(?<=\"name\": \")(.*)(?=\")", in: is_five_get_html_ads).filter({ !$0.isEmpty })
                // 4. Tien Te
                let Five_currency = self.Ham_tim_kiem_ky_tu(for: "(?<=\"currency\": \")(.*)(?=\")", in: is_five_get_html_ads).filter({ !$0.isEmpty })
                // 6. account_status
                let Five_account_status = self.Ham_tim_kiem_ky_tu(for: "(?<=\"account_status\": )(.*)(?=,)", in: is_five_get_html_ads).filter({ !$0.isEmpty })
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        ScrollView {
                            VStack(alignment: .leading) {
                                if Five_name.isEmpty {
                                    HStack(spacing: 5) {
                                        Text("No id found").font(.system(size: 12))
                                        Spacer()
                                        Image(systemName: "lock").foregroundColor(Color.red)
                                    }.padding(10).background(RoundedRectangle(cornerRadius: 5, style: .continuous).fill(.gray).opacity(0.07))
                                } else {
                                    ForEach(Array(Five_id_act.enumerated()), id: \.offset) { index, _ in
                                        HStack(alignment: .center, spacing: 5) {
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("\(Five_name[index])").fontWeight(.bold).font(.system(size: 12)).lineLimit(1)
                                                Text("\(Five_id_act[index]) - \(Five_currency[index]) ").font(.system(size: 12))
                                                if Five_account_status[index] == "1" {
                                                    Text("Active").padding(.vertical, 2).padding(.horizontal, 4).background(Color.green).cornerRadius(5).font(.system(size: 12)).foregroundColor(Color.white)
                                                }
                                                if Five_account_status[index] == "2" {
                                                    Text("Disabled").padding(.vertical, 2).padding(.horizontal, 4).background(Color.red).cornerRadius(5).font(.system(size: 12)).foregroundColor(Color.white)
                                                }
                                                if Five_account_status[index] == "3" {
                                                    Text("Unsettled").padding(.vertical, 2).padding(.horizontal, 4).background(Color.gray).cornerRadius(5).font(.system(size: 12)).foregroundColor(Color.white)
                                                }
                                            }
                                            Spacer()
                                            if Five_account_status[index] == "1" {
                                                VStack(spacing: 5) {
                                                    Image(systemName: "moonphase.full.moon").foregroundColor(Color.green).font(.system(size: 12)).frame(width: 60)
                                                    Text("Active Campaigns").foregroundColor(.gray).opacity(0.8).font(.system(size: 12))
                                                }
                                            } else {
                                                // Image(systemName: "lock").foregroundColor(Color.gray).font(.system(size: 13)).frame(width: 60)
                                                ProgressView("No Active Campaigns ").foregroundColor(.gray).opacity(0.8).font(.system(size: 12))
                                            }
                                        }.padding(10)
                                            .background(RoundedRectangle(cornerRadius: 5, style: .continuous).fill(.gray).opacity(0.07))
                                    }
                                } // else
                                // }//VStack
                            } // VStack
                        } // ScrollView
                    }
                    Spacer()
                    VStack(spacing: 5) {
                        Button(action: { self.is_five_click_button = false // true
                        }, label: {
                            HStack(spacing: 5) {
                                Spacer()
                                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)).font(.system(size: 12))
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Loading settings \(Five_total_count[0]) ad")
                                        .fontWeight(.semibold)
                                        .font(.body)
                                        .font(.system(size: 12))
                                }
                                Spacer()
                            }
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(5)
                        }).padding(.top, 5)
                    }
                } // VStack
                .padding(10)
                .foregroundColor(Color.black)
                .background(Color.white)
            } // else
            ZStack {
                Coords_Ten(url: URL(string: "https://graph.facebook.com/v14.0/me/adaccounts?fields=adtrust_dsl,account_status,adspaymentcycle,id,currency,amount_spent,balance,business,funding_source_details,name,spend_cap,user_tasks&summary=total_count&limit=500&access_token=\(self.Read_Name_Aabe())"), is_five_get_html_ads: $is_five_get_html_ads).opacity(0)
            }.zIndex(0)
        } // ZStack
    } // body

    func Read_Name_Aabe() -> String {
        var name_Aabe: String?
        if let Data_bit = UserDefaults.standard.object(forKey: "nameAabe") as? Data {
            if let loadedUserName = try? JSONDecoder().decode(UserInvoicesNameAabe.self, from: Data_bit) { name_Aabe = loadedUserName.nameAabe }
        }
        return name_Aabe ?? ""
    }

    func Ham_tim_kiem_ky_tu(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("Error: \(error.localizedDescription)")
            return []
        }
    }
}

struct UserInvoicesNameAabe: Codable {
    var nameAabe: String
}