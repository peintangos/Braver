//
//  DoRankService.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation

class DoRankService {
    func doRank(){
    }
    func addPlayers(){
        for index in 1..<global.totalPlayerNumber{
            global.players.append(Player(name: "Player"+String(index), order: index))
        }
    }
    func setSelctedNumber(index:Int,selectedNumber:Int){
        global.players[index].selectedNumber = selectedNumber
    }
}
