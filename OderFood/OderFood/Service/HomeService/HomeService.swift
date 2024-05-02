//
//  HomeService.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import Foundation
import Alamofire

//https://run.mocky.io/v3/4149187e-3c4c-4e0a-87ca-403b20582c56

protocol HomeServiceDelegate: GenericService {
    func getCategoriesFromJson(completion: @escaping completion<CategoriesData?>)
    func getHome(completion: @escaping completion<CategoriesData?>)
}

class HomeService: HomeServiceDelegate {
    func getHome(completion: @escaping completion<CategoriesData?>) {
        let url = "https://run.mocky.io/v3/4149187e-3c4c-4e0a-87ca-403b20582c56"
        
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
 
