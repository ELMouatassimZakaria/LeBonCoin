//
//  ViewController.swift
//  LeBonCoinProject
//
//  Created by Zakaria Elmoutassim on 07/07/2022.
//

import UIKit

class ListViewController: ViewController {
    
    var productsTableView: UITableView!
    let KcellHeigh: CGFloat = 100
    var viewModel: ListViewModel!
    
    public var items: [Product] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.productsTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpNavigation()
        setupTableView()
        viewModel.fetchAllData()
    }
    
    
    private func setupTableView() {
        productsTableView = UITableView()
        productsTableView.delegate = self
        productsTableView.dataSource = self


        view.addSubview(productsTableView)
        productsTableView.register(ProductViewCell.self, forCellReuseIdentifier: "productCell")

        //Enable Auto Layout on contactsTableView by setting
        productsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        /**• To keep the content in a safe area, we need to add safeAreaLayoutGuide to the contactsTableView auto layout constraints, like the code below:
         */
        productsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        productsTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        productsTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        productsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setUpNavigation() {
        navigationItem.title = "Products"
        self.navigationController?.navigationBar.barTintColor = .orange
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
 
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductViewCell
        let item = items[indexPath.row]
        cell.priceProdcut.text = "\(item.price)"
        cell.categoryProduct.text = viewModel.categoryList.first(where: { $0.id == item.categoryID } )?.name
        cell.titleProduct.text = item.title
        cell.productImageView.imageFromServerURL(urlString:  item.imagesURL.small ?? "", PlaceHolderImage: UIImage.init(named: "car")!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return KcellHeigh
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        let product = items[indexPath.row]
        let category = viewModel.categoryList.first(where: { $0.id == product.categoryID } )?.name ?? ""
        detailsVC.viewModel = DetailsViewModel(item: (product: product, category: category))
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}


extension ListViewController: ListViewModelDelegate {
  
    func willMakeRequest() {
        setSpinner(visible: true)
    }
    
    func didMakeSuccessfullRequest() {
        setSpinner(visible: false)
        items =  viewModel.productList
    }
    
    func didFinishRequestWithError(error: Error) {
        notifyUserError(message: error.localizedDescription)
    }
}
