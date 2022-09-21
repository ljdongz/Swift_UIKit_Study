//
//  MyMusicCell.swift
//  MusicApp
//
//  Created by 이정동 on 2022/09/18.
//

import UIKit

class MyMusicCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var albumNameLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // 이미지 설정을 위한 이미지 주소를 전달받음
    var imageUrl: String? {
        // imageUrl에 값이 할당되면 loadImage() 실행
        didSet{
            loadImage()
        }
    }
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        
        print(#function)
        // 일반적으로 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행 ⭐️
        self.mainImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        mainImageView.contentMode = .scaleToFill
    }
    
    // 이미지 다운
    private func loadImage() {
        print(#function)
        guard let urlString = self.imageUrl, let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async {
            // url을 가지고 (이미지)데이터를 가져옴
            // 동기적으로 처리됨(오래 걸림) -> 2번쓰레드에서 실행하도록 설정
            guard let data = try? Data(contentsOf: url) else { return }
            
            // 오래 걸리는 작업이 일어나는 동안에 url이 바뀔 가능성 제거
            // 빠른 스크롤 시 1번 url 요청 후 사진을 받아오려는 중에 cell이 재사용되어 2번 url 요청했는데 1번 url 요청 작업이 끝나 2번 사진이 아닌 1번 사진을 보여줄 수도 있기 때문에 url 비교하는 과정
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }
    }
    
}
