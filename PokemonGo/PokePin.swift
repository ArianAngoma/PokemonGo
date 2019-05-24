//
//  PokePin.swift
//  PokemonGo
//
//  Created by Arian Angoma on 5/19/19.
//  Copyright © 2019 Arian Angoma. All rights reserved.
//

import UIKit
import MapKit

class PokePin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon : Pokemon
    init(coord: CLLocationCoordinate2D, pokemon:Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
    }
}
