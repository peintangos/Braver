//
//  DoRankService.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation

class DoRankService {
    func doRank() -> Array<Player>{
        let copyPlayers = global.players
        global.players.forEach { (player) in
            let result = Result(index: player.order, selectedNumber: player.selectedNumber,isOverLapeed: self.isOverLapped(player: player, copyPlayer: copyPlayers))
            player.result = result
        }
        var overLappedPlayers = Array<Player>()
        var nonOverLappedPlayers = Array<Player>()
        global.players.forEach { (player) in
            if player.result.isOverLapeed! {
                overLappedPlayers.append(player)
            }else {
                nonOverLappedPlayers.append(player)
            }
        }
        overLappedPlayers.sort { (player1, player2) -> Bool in
            return player1.result.absoluteValue < player2.result.absoluteValue
        }
        nonOverLappedPlayers.sort { (player1, player2) -> Bool in
            return player1.result.absoluteValue < player2.result.absoluteValue
        }
        nonOverLappedPlayers.append(contentsOf: overLappedPlayers)
        
        return nonOverLappedPlayers
    }
    func addPlayers(){
        for index in 1...global.totalPlayerNumber{
            global.players.append(Player(name: "Player"+String(index), order: index))
        }
    }
    func setSelctedNumber(index:Int,selectedNumber:Int){
        global.players[index].selectedNumber = selectedNumber
    }
    private func isOverLapped(player:Player,copyPlayer:Array<Player>) ->Bool{
        var count = 0
        copyPlayer.forEach { (copyPlayer) in
            if copyPlayer.absoluteValue == player.absoluteValue{
            count += 1
            }
        }
        return count >= 2
    }
}
