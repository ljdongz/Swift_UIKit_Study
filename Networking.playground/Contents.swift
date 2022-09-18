import UIKit

// MARK: - Welcome
struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

// MARK: - Result
struct Music: Codable {
    let artistName, collectionName, trackName: String
    let previewURL: String
    let artworkUrl100: String
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case artistName, collectionName, trackName
        // 실제 사용할 이름: collectionArtistID - 서버에서 전달하는 이름: collectionArtistId
        case previewURL = "previewUrl"
        case artworkUrl100, releaseDate
    }
}

func getMethod(completion: @escaping ([Music]?) -> Void) {
    let url = URL(string: "https://itunes.apple.com/search?term=jazz&media=music")!

    /* Case 1. URL 구조체 사용
    // 문자열 타입의 URL을 구조체 타입의 URL로 변환 (GET 요청에만 사용 가능)
    let structUrl = URL(string: url)!

    URLSession.shared.dataTask(with: structUrl) { data, response, error in
            ...
    }.resume()   */

    // Case 2. URLRequest 구조체 사용 (GET 이외의 요청 가능)
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    // URL Session 생성 (서버랑 통신하는 객체 ~= 브라우저)
    // dataTask -> 비동기적으로 처리됨
    URLSession.shared.dataTask(with: request) { data, response, error in
        // error 발생 시 리턴
        if error != nil {
            print(error!)
            completion(nil)
        }

        // 응답코드에 따른 처리
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~=
        response.statusCode else {
            print("Error: HTTP request failed")
            completion(nil)
            return
        }
        
        // 데이터가 존재하면 출력
        if let safeData = data {
            // Data 타입을 String 타입으로 변환
            //print(String(decoding: safeData, as: UTF8.self))
            
            do {
                let decoder = JSONDecoder()
                let decodedData  = try decoder.decode(MusicData.self, from: safeData)
                //dump(decodedData.results)
                completion(decodedData.results)
            } catch{
                completion(nil)
            }
        }
    }.resume()  // 일시정지 상태로 작업이 부여된 URLSession에 작업 부여(작업 시작)
        
}

getMethod { musicArray in
    guard let musicArr = musicArray else { return }
    dump(musicArr)
}



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)



