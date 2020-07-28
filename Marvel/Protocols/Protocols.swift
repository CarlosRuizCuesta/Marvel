//
//  Protocols.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


protocol MarvelApiResponse {
    func response(hero : Hero)
    func error(error : ErrorDetails)
}
