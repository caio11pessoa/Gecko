//
//  Players.swift
//  GuessPo
//
//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import Foundation

enum roles {
case imposter, person
}

struct Player {
    var name: String
    var role: roles
}
