//
//  ProductCell.swift
//  LeBonCoinProject
//
//  Created by Zakaria Elmoutassim on 08/07/2022.
//

import Foundation
import UIKit

public class ProductViewCell: UITableViewCell {
    
    lazy var containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var titleProduct: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceProdcut: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var categoryProduct: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        containerView.addSubview(titleProduct)
        containerView.addSubview(priceProdcut)
        containerView.addSubview(categoryProduct)
        contentView.addSubview(containerView)
        contentView.addSubview(productImageView)
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        // ImageView
        productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:10).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant:80).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant:80).isActive = true
        
        //Containerview Constaint
        containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:95).isActive = true
        
        // TitleProdcut Constraint
        titleProduct.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        titleProduct.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        titleProduct.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:-40).isActive = true
        
        titleProduct.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleProduct.numberOfLines = 0
        
        //CategoryProduct Constraint
        categoryProduct.topAnchor.constraint(equalTo: titleProduct.bottomAnchor, constant: 5).isActive = true
        categoryProduct.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        // priceProdcut Constraint
        priceProdcut.widthAnchor.constraint(equalToConstant:30).isActive = true
        priceProdcut.heightAnchor.constraint(equalToConstant:11).isActive = true
        priceProdcut.trailingAnchor.constraint(equalTo:contentView.trailingAnchor, constant:-10).isActive = true
        priceProdcut.centerYAnchor.constraint(equalTo:contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

