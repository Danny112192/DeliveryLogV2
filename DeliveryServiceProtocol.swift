//
//  DeliveryServiceProtocol.swift
//  DeliveryService
//
//  Created by Daniel Martinez on 4/23/23.
//

import Foundation
import DeliveryLog

protocol DeliveryServiceProtocol {
    var baseURL: URL { get }
    func fetchDeliveries(completion: @escaping ([Delivery]?, Error?) -> Void)
}
