//
//  Music.swift
//  MusicApp
//
//  Created by 이정동 on 2022/09/18.
//

import Foundation
import UIKit
//MARK: - 데이터 모델

// 실제 API에서 받게 되는 정보

struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

struct Music: Codable {
    let songName: String?
    let artistName: String?
    let albumName: String?
    
    enum CodingKeys: String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
    }
}
