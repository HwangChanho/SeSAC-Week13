//
//  NasaViewController.swift
//  SeSAC-Week13
//
//  Created by AlexHwang on 2021/12/22.
//

import UIKit

class NasaViewController: BaseViewController {
    
    let imageView = UIImageView()
    let label = UILabel()
    
    var session: URLSession!
    
    var buffer: Data? {
        didSet {
            let result = Double(buffer?.count ?? 0) / total
            label.text = "\(result * 100)/100"
        }
    }
    
    var total: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buffer = Data()
        
        request()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        session.finishTasksAndInvalidate()
        session.invalidateAndCancel() // 리소스 정리 그냥 다 정리.. 실행중인 태스크가 있더라도 그만함.
    }
    
    override func configure() {
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
    }
    
    override func setConstraint() {
        view.addSubview(imageView)
        view.addSubview(label)
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(100)
        }
        label.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
    func request() {
        print(#function)
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2112/WinterSolsticeMW_Seip_1079.jpg")!
        
        // 네트워크 통신 환경에서의 조절
//        let configuration = URLSessionConfiguration.default
//        configuration.allowsCellularAccess = false
//        URLSession(configuration: configuration).dataTask(with: url).resume()
        
        // URLSession.shared.dataTask(with: url).resume() shared 를 사용할 경우 completion handler만 호출 가능
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: url).resume()
    }
}

extension NasaViewController: URLSessionDataDelegate {
    
    // 서버에서 데이터를 받을 떄마다 반복적으로 호출됨
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print(data)
        buffer?.append(data)
    }
    
    // 서버에서 최초로 응답 받은 경우 호출(상태코드)
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
            total = Double(response.value(forHTTPHeaderField: "Content-Length")!)!

            return .allow
        } else {
            return .cancel
        }
    }
    
    // 응답이 완료되었을 때: nil
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print("오류가 발생했습니다.", error)
        } else {
            print("성공") // completionHandler
            
            // buffer에 Data가 모두 채워졌을ㄷ 때, 이미지로 변환
            guard let buffer = buffer else {
                print("buffer error")
                return
            }
            
            let image = UIImage(data: buffer)
            imageView.image = image
        }
    }
}
