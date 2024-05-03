//
//  HomeService.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import Foundation
import Alamofire


protocol HomeServiceDelegate: GenericService {
    func getCategoriesFromJson(completion: @escaping completion<CategoriesData?>)
    func getHome(completion: @escaping completion<CategoriesData?>)
}

class HomeService: HomeServiceDelegate {
    func getHome(completion: @escaping completion<CategoriesData?>) {
        let url = "https://run.mocky.io/v3/92266dac-7638-4eed-9391-c851a3c84ec6"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: CategoriesData.self) { response in
            debugPrint(response)
            switch response.result {
            case.success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case.failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getCategoriesFromJson(completion: @escaping completion<CategoriesData?>) {
        if let url = Bundle.main.url(forResource: "CategoriesData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let categoriesData: CategoriesData = try JSONDecoder().decode(CategoriesData.self, from: data)
                completion(categoriesData, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "CategoriesData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "CategoriesData"))
        }
    }
}
 
