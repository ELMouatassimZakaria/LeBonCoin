//
//  ViewController.swift
//  LeBonCoinProject
//
//  Created by Zakaria Elmoutassim on 07/07/2022.
//

import UIKit
import Combine


class ListViewModel: ViewModel {

    var delegate: ListViewModelDelegate!
    var productList = [Product]()
    var categoryList = [Categories]()
    
    init(delegate : ListViewModelDelegate){
        self.delegate = delegate
    }

    func fetchAllData() {
        self.delegate.willMakeRequest()
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global().async {
            guard let url = URL(string: self.baseUrl + "/listing.json") else { return }
            self.loadFrom(url: url, type: Product.self) { response in
                defer { group.leave() }
                do {
                    self.productList = try response.get()
                } catch {
                    self.delegate.didFinishRequestWithError(error: error)
                    print("Error retrieving the value: \(error)")
                }
            }
        }
        
        group.enter()
        DispatchQueue.global().async {
            guard let url = URL(string: self.baseUrl + "/categories.json") else { return }
            self.loadFrom(url: url, type: Categories.self) { response in
                defer { group.leave() }
                do {
                    self.categoryList = try response.get()
                } catch {
                    print("Error retrieving the value: \(error)")
                    self.delegate.didFinishRequestWithError(error: error)
                }
            }
        }
        group.notify(queue: .main) {
            //Reload user interface
            self.delegate.didMakeSuccessfullRequest()
        }
    }
    
   private func loadFrom<T: Decodable>(url: URL, type: T.Type, completionHandler: @escaping (Result<[T],Error>) -> Void) {
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                completionHandler(.failure(error))
                
            } else {
                completionHandler( Result{ try JSONDecoder().decode([T].self, from: data!)})
            }
        }.resume()
    }
}


public class ViewModel {
    let baseUrl = "https://raw.githubusercontent.com/leboncoin/paperclip/master"
    
    func loadView() {}
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
    
    init() {}
    
}



protocol ListViewModelDelegate: AnyObject {
    func willMakeRequest()
    func didMakeSuccessfullRequest()
    func didFinishRequestWithError(error: Error)
}
