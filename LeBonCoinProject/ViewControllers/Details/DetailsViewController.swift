//
//  ViewController.swift
//  LeBonCoinProject
//
//  Created by Zakaria Elmoutassim on 07/07/2022.
//

import UIKit

class DetailsViewController: ViewController {
    
    var viewModel: DetailsViewModel!
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let imageProduct: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .justified
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .black
        textView.isEditable = false
        
        return textView
    }()
    
    let titleProduct: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let priceProdcut: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        return label
    }()

    let categoryProduct: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subview2: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        view.backgroundColor = UIColor.white
        return view
    }()
    private let subImageView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return view
    }()
    
    private func setupScrollView() {
        let margins = view.layoutMarginsGuide
        view.addSubview(scrollView)
        
        scrollView.addSubview(scrollStackViewContainer)
        
        subImageView.addSubview(imageProduct)
        subImageView.addSubview(priceProdcut)
        subview2.addSubview(titleProduct)
        subview2.addSubview(categoryProduct)
        subview2.addSubview(textView)
        // ScrollView Constraint
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        // StackView Constraint
        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
       
        configureContainerView()
    }
    
    private func configureContainerView() {
        [subImageView, subview2].forEach { scrollStackViewContainer.addArrangedSubview($0)}

        imageProduct.imageFromServerURL(urlString: viewModel.items.product.imagesURL.thumb ?? "", PlaceHolderImage: UIImage.init(named: "car")!)
        
        
        
        
        // imageProduct
        imageProduct.leadingAnchor.constraint(equalTo: subImageView.leadingAnchor).isActive = true
        imageProduct.trailingAnchor.constraint(equalTo: subImageView.trailingAnchor).isActive = true
        imageProduct.topAnchor.constraint(equalTo: subImageView.topAnchor).isActive = true
        imageProduct.bottomAnchor.constraint(equalTo: subImageView.bottomAnchor).isActive = true
        imageProduct.widthAnchor.constraint(equalTo: subImageView.widthAnchor).isActive = true
        
        // price
        priceProdcut.widthAnchor.constraint(equalToConstant:80).isActive = true
        priceProdcut.heightAnchor.constraint(equalToConstant:30).isActive = true
        priceProdcut.trailingAnchor.constraint(equalTo:subImageView.trailingAnchor, constant:-10).isActive = true
        priceProdcut.bottomAnchor.constraint(equalTo:subImageView.bottomAnchor, constant: -10).isActive = true

        priceProdcut.text = viewModel.items.product.price.description + "$"


        // TitleProdcut
        titleProduct.topAnchor.constraint(equalTo: subview2.topAnchor, constant: 10).isActive = true
        titleProduct.leadingAnchor.constraint(equalTo: subview2.leadingAnchor, constant: 10).isActive = true
        titleProduct.trailingAnchor.constraint(equalTo: subview2.trailingAnchor, constant: -10).isActive = true
        
        titleProduct.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleProduct.numberOfLines = 0
        titleProduct.text = viewModel.items.product.title
        
        categoryProduct.topAnchor.constraint(equalTo: self.titleProduct.bottomAnchor, constant: 10).isActive = true
        categoryProduct.leadingAnchor.constraint(equalTo: self.subview2.leadingAnchor, constant: 10).isActive = true
        categoryProduct.text = viewModel.items.category
        
        textView.topAnchor.constraint(equalTo: self.categoryProduct.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: self.subview2.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.subview2.trailingAnchor, constant: -10).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.subview2.bottomAnchor, constant: 10).isActive = true

        textView.text = viewModel.items.product.productDescription
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupScrollView()
    }
}

