//
//  CartManager.swift
//  AppUnitTest
//
//  Created by Anand Nimje on 25/01/25.
//

protocol CartManagerDelegate: AnyObject {
    func didUpdateCart(with items: [String])
}

class CartManager {
    weak var delegate: CartManagerDelegate?
    private var cartItems: [String] = []
    
    func addItem(_ item: String) {
        cartItems.append(item)
        delegate?.didUpdateCart(with: cartItems)
    }
}
