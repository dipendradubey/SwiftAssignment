//
//  CustomCell.swift
//  SwiftAssignment
//
//  Created by Dipendra Dubey on 29/01/20.
//  Copyright © 2020 Dipendra. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell{
    
    lazy var lblName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var lblDesc: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var picture: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(picture)
        self.addSubview(lblName)
        self.addSubview(lblDesc)
        
        picture.translatesAutoresizingMaskIntoConstraints = false
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblDesc.translatesAutoresizingMaskIntoConstraints = false
        
        picture.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        picture.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        picture.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        //picture.widthAnchor.constraint(equalToConstant: 100).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //picture.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        lblName.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 10).isActive = true
        lblName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        lblName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        lblDesc.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 10).isActive = true
        lblDesc.leftAnchor.constraint(equalTo: lblName.leftAnchor).isActive = true
        lblDesc.rightAnchor.constraint(equalTo: lblName.rightAnchor).isActive = true
        lblDesc.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
