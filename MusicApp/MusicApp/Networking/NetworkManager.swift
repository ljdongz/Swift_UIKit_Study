//
//  NetworkManager.swift
//  MusicApp
//
//  Created by 이정동 on 2022/09/18.
//

import Foundation

enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    typealias NetworkCompletion = (Result<[Music], NetworkError>) -> Void
    
    // 음악 데이터 가져오기
    func fetchMusic(searchTerm: String, completion: @escaping NetworkCompletion) {
        let urlString = "\(MusicApi.requestUrl)\(MusicApi.mediaParam)&term=\(searchTerm)"
        print(urlString)
        performRequest(with: urlString){ result in
            completion(result)
        }
    }
    
//    func fetchMusic(searchTerm: String) {
//        let urlString = "\(MusicApi.requestUrl)\(MusicApi.mediaParam)&term=\(searchTerm)"
//        print(urlString)
//        performRequest(with: urlString){ result in
//            NetworkCompletion(result)
//        }
//    }
    
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                completion(.failure(.networkingError))
            }
            
            // 데이터가 존재하면 출력
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            
            if let musicData = self.parseJSON(safeData){
                completion(.success(musicData))
                return
            } else {
                completion(.failure(.parseError))
                return
            }
            
        }.resume()
    }
    
    private func parseJSON(_ musicData: Data) -> [Music]?{
        do {
            let decodedData  = try JSONDecoder().decode(MusicData.self, from: musicData)
            
            return decodedData.results
        }catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
