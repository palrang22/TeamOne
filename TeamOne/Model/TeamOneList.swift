//
//  TeamOneList.swift
//  TeamOne
//
//  Created by 임혜정 on 5/27/24.
//

import Foundation

struct TeamOneList {
    let profileImage: String
    let name: String
    let comment: String
    let storyboardName: String
    let viewControllerID: String
}

extension TeamOneList {
    static let list: [TeamOneList] = [
        TeamOneList(profileImage: "jshImage", name: "점승현", comment: "사랑을 드려요~~❤️", storyboardName: "JSHStoryboard", viewControllerID: "JSHViewController"),
        TeamOneList(profileImage: "kliImage", name: "김리인", comment: "감정은 사라지고 결과는 남는다...", storyboardName: "KLIStoryboard", viewControllerID: "KLIViewController"),
        TeamOneList(profileImage: "ihjImage", name: "임혜정", comment: "아무도 나를 모르고 돈이 많았으면 좋겠어요", storyboardName: "IHJStoryboard", viewControllerID: "IHJViewController"),
        TeamOneList(profileImage: "ksbImage", name: "김솔비", comment: "귀여운게 세상을 구한다", storyboardName: "KSBStoryboard", viewControllerID: "KSBViewController"),
        TeamOneList(profileImage: "kshImage", name: "김승희", comment: "화이팅~~!", storyboardName: "KSHStoryboard", viewControllerID: "KSHViewController")
    ]
}
