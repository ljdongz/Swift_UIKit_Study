//
//  Constants.swift
//  MusicApp
//
//  Created by 이정동 on 2022/09/18.
//

import UIKit

// 구조체 또는 열거형 형식으로 Name Space 설정
public struct Cell {
    static let musicCellIdentifier = "MyMusicCell"
    static let musicCollectionViewCellIdentifier = "MusicCollectionViewCell"
    
    // 생성할 수 없도록 막아놈 (타입 저장 속성에만 접근하도록)
    private init() {}
}

//public enum Cell {
//    static let musicCellIdentifier = "MyMusicCell"
//    static let musicCollectionViewCellIdentifier = "MusicCollectionViewCell"
//}


public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
}

public struct CVCell {
    static let spacingWitdh: CGFloat = 1
    static let cellColumns: CGFloat = 3
    private init() {}
}
