//
//  PrivateMessageView.swift
//  Surround
//
//  Created by Anh Khoa Hong on 04/03/2021.
//

import SwiftUI
import URLImage
import Combine

struct PrivateMessageNotificationView: View {
    @EnvironmentObject var ogs: OGSService
    @State var selectedPeerId = -1
    
    func user(id userId: Int) -> OGSUser? {
        if let user = ogs.cachedUsersById[userId] {
            return user
        } else {
            if let firstMessage = ogs.privateMessagesByPeerId[userId]?.first {
                if firstMessage.from.id == userId {
                    return firstMessage.from
                } else {
                    return firstMessage.to
                }
            }
        }
        return nil
    }
    
    var sortedPeers: [OGSUser] {
        var result = [OGSUser]()
        for peerId in ogs.privateMessagesActivePeerIds {
            if let user = user(id: peerId) {
                result.append(user)
            }
        }
        result.sort(by: {
            ogs.privateMessagesByPeerId[$0.id]?.last?.content.timestamp ?? 0 >
                ogs.privateMessagesByPeerId[$1.id]?.last?.content.timestamp ?? 0
        })
        return result
    }
        
    var body: some View {
        VStack(spacing: 0) {
            ScrollView([.horizontal]) {
                HStack(spacing: 10) {
                    ForEach(sortedPeers, id: \.id) { peer in
                        VStack(spacing: 0) {
                            ZStack {
                                if let iconURL = peer.iconURL(ofSize: 64) {
                                    URLImage(url: iconURL) { image in
                                        image.resizable()
                                    }
                                    .frame(width: 48, height: 48)
                                } else {
                                    Text("\(String(peer.username.first!))")
                                        .font(.system(size: 32)).bold()
                                        .frame(width: 48, height: 48)
                                        .background(Color.gray)
                                }
                            }
                            .border(Color.blue, width: peer.id == selectedPeerId ? 2 : 0)
                            .padding(5)
                            Text(peer.username)
                                .font(peer.id == selectedPeerId ? Font.subheadline.bold() : .subheadline)
                                .minimumScaleFactor(0.4)
                                .foregroundColor(peer.uiColor)
                                .frame(maxWidth: 100)
                        }
                    }
                }.padding(.vertical, 5)
            }
            .padding(.horizontal)
            .background(Color(.systemGray4))
            if selectedPeerId != -1, let peer = user(id: selectedPeerId) {
                Divider()
                PrivateMessageLog(peer: peer)
            }
        }
        .onAppear {
            selectedPeerId = ogs.privateMessagesActivePeerIds.sorted().first ?? -1
        }
    }
}

struct PrivateMessageView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateMessageNotificationView()
            .environmentObject(OGSService.previewInstance(
                user: OGSUser(username: "hakhoa", id: 765826)
            ))
            .previewLayout(.fixed(width: 300, height: 500))
    }
}
