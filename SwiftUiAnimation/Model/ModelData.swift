//
//  ModelData.swift
//  SwiftUiAnimation
//
//  Created by iMac on 09/09/21.
//

import SwiftUI

struct BagModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var price: String
}

var bags = [

    BagModel(image: "bag1", title: "Office Bag", price: "$254"),
    BagModel(image: "bag2", title: "Stylus Bag", price: "$434"),
    BagModel(image: "bag3", title: "Round Bag", price: "$134"),
    BagModel(image: "bag4", title: "Belt Bag", price: "$294"),
    BagModel(image: "bag5", title: "Hang Top", price: "$204"),
    BagModel(image: "bag6", title: "Old Fashion", price: "$334")
    
]


var scroll_tab = ["Hand Bag", "Jewellery", "Footwear", "Dresses", "Beauty"]
