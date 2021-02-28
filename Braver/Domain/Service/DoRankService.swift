//
//  DoRankService.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation

class DoRankService {
    func doRank() -> Array<Player>{
        let copyPlayers = self.copy(originanPlayer: global.players)
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
//        2STEPある。
//        ①単純に絶対値で並び替える
//        ②順位付けをする
//        1.被ってない方の並び替え
        nonOverLappedPlayers.sort { (player1, player2) -> Bool in
            return player1.result.absoluteValue < player2.result.absoluteValue
        }
//        2.被ってない方の順位付け
        
        for (index, value) in zip(nonOverLappedPlayers.indices, nonOverLappedPlayers){
            if index == 0{
                value.result.order = 1
            }else if value.result.absoluteValue == nonOverLappedPlayers[index - 1].result.absoluteValue{
                value.result.order = nonOverLappedPlayers[index - 1].result.order
            }else {
                value.result.order = index + 1
            }
        }
//        3.被っている方の並び替え
        overLappedPlayers.sort { (player1, player2) -> Bool in
            return player1.result.absoluteValue > player2.result.absoluteValue
        }
//        4.被っている方の順位づけ
        for (index, value) in zip(overLappedPlayers.indices, overLappedPlayers){
            if index == 0{
                value.result.order = 1 + nonOverLappedPlayers.count
            }else if value.result.absoluteValue == overLappedPlayers[index - 1].result.absoluteValue{
                value.result.order = overLappedPlayers[index - 1].result.order
            }else {
                value.result.order = index + 1 + nonOverLappedPlayers.count
            }
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
            if copyPlayer.selectedNumber == player.selectedNumber{
            count += 1
            }
        }
        return count >= 2
    }
    private func copy(originanPlayer:Array<Player>) -> Array<Player>{
        var copyPlayers = Array<Player>()
        originanPlayer.forEach { (player) in
            let copyPlayer = player
            let result = player.result
            copyPlayer.result = result
            copyPlayers.append(copyPlayer)
        }
        return copyPlayers
    }
    func addZeroMediumLargeNumbers(maxValue:Int){
        var maxNumberReal:Int
        switch maxValue {
        case 0...5:
            maxNumberReal = 8
        case 6...7:
            maxNumberReal = 10
        case 8...9:
            maxNumberReal = 12
        case 10:
            maxNumberReal = 12
        default:
            maxNumberReal = 8
        }
        global.numberList = [0,maxNumberReal / 2,maxNumberReal]
    }
    func isKingsMode(list:Array<Player>) -> Bool{
        let maxNumber = global.isBraver ? global.numberList[1] : global.numberList[2]
        if list[0].selectedNumber == maxNumber && list[1].selectedNumber != maxNumber && global.defaults.bool(forKey: "isOsama"){
            return true
        }
        return false
    }
    func updateUserDefaults(isNameSaved:Bool,isOsama:Bool){
        global.defaults.set(isNameSaved, forKey: "isNameSaved")
        global.defaults.set(isOsama, forKey: "isOsama")
    }
    func addCountNameSavedOrder(){
        global.nameSaveOrder += 1
    }
    func setNameSavedNumber(nameSaveNumber:Int){
        global.nameSaveNumber = nameSaveNumber
        
    }
    func clearNameSaved(){
        global.nameSaveOrder = 1
        global.nameSaveNumber = 0
    }
    func nameSave(name:String){
        let key = "nameNumber" + "_" + String(global.nameSaveNumber!) + "_" + "nameOrder" + "_" + String(global.nameSaveOrder)
        global.defaults.set(name, forKey: key)
        print(key)
    }
    func initNameSave(){
        global.defaults.register(defaults: ["nameNumber_3_nameOrder_1" : "PLAYER1",
                                            "nameNumber_3_nameOrder_2" : "PLAYER2",
                                            "nameNumber_3_nameOrder_3" : "PLAYER3",
                                            "nameNumber_4_nameOrder_1" : "PLAYER1",
                                            "nameNumber_4_nameOrder_2" : "PLAYER2",
                                            "nameNumber_4_nameOrder_3" : "PLAYER3",
                                            "nameNumber_4_nameOrder_4" : "PLAYER4",
                                            "nameNumber_5_nameOrder_1" : "PLAYER1",
                                            "nameNumber_5_nameOrder_2" : "PLAYER2",
                                            "nameNumber_5_nameOrder_3" : "PLAYER3",
                                            "nameNumber_5_nameOrder_4" : "PLAYER4",
                                            "nameNumber_5_nameOrder_5" : "PLAYER5",
                                            "nameNumber_6_nameOrder_1" : "PLAYER1",
                                            "nameNumber_6_nameOrder_2" : "PLAYER2",
                                            "nameNumber_6_nameOrder_3" : "PLAYER3",
                                            "nameNumber_6_nameOrder_4" : "PLAYER4",
                                            "nameNumber_6_nameOrder_5" : "PLAYER5",
                                            "nameNumber_6_nameOrder_6" : "PLAYER6",
                                            "nameNumber_7_nameOrder_1" : "PLAYER1",
                                            "nameNumber_7_nameOrder_2" : "PLAYER2",
                                            "nameNumber_7_nameOrder_3" : "PLAYER3",
                                            "nameNumber_7_nameOrder_4" : "PLAYER4",
                                            "nameNumber_7_nameOrder_5" : "PLAYER5",
                                            "nameNumber_7_nameOrder_6" : "PLAYER6",
                                            "nameNumber_7_nameOrder_7" : "PLAYER7",
                                            "nameNumber_8_nameOrder_1" : "PLAYER1",
                                            "nameNumber_8_nameOrder_2" : "PLAYER2",
                                            "nameNumber_8_nameOrder_3" : "PLAYER3",
                                            "nameNumber_8_nameOrder_4" : "PLAYER4",
                                            "nameNumber_8_nameOrder_5" : "PLAYER5",
                                            "nameNumber_8_nameOrder_6" : "PLAYER6",
                                            "nameNumber_8_nameOrder_7" : "PLAYER7",
                                            "nameNumber_8_nameOrder_8" : "PLAYER8",
                                            "nameNumber_9_nameOrder_1" : "PLAYER2",
                                            "nameNumber_9_nameOrder_2" : "PLAYER2",
                                            "nameNumber_9_nameOrder_3" : "PLAYER3",
                                            "nameNumber_9_nameOrder_4" : "PLAYER4",
                                            "nameNumber_9_nameOrder_5" : "PLAYER5",
                                            "nameNumber_9_nameOrder_6" : "PLAYER6",
                                            "nameNumber_9_nameOrder_7" : "PLAYER7",
                                            "nameNumber_9_nameOrder_8" : "PLAYER8",
                                            "nameNumber_9_nameOrder_9" : "PLAYER9",
                                            "nameNumber_10_nameOrder_1" : "PLAYER1",
                                            "nameNumber_10_nameOrder_2" : "PLAYER2",
                                            "nameNumber_10_nameOrder_3" : "PLAYER3",
                                            "nameNumber_10_nameOrder_4" : "PLAYER4",
                                            "nameNumber_10_nameOrder_5" : "PLAYER5",
                                            "nameNumber_10_nameOrder_6" : "PLAYER6",
                                            "nameNumber_10_nameOrder_7" : "PLAYER7",
                                            "nameNumber_10_nameOrder_8" : "PLAYER8",
                                            "nameNumber_10_nameOrder_9" : "PLAYER9",
                                            "nameNumber_10_nameOrder_10" : "PLAYER10",
        ])
        
    }
    func getPlayerName(playerNumber:Int) -> String{
        var userName = "PLAYER\(playerNumber)"
        if global.defaults.bool(forKey: "isNameSaved") {
            let key = "nameNumber" + "_" + String(global.totalPlayerNumber!) + "_" + "nameOrder" + "_" + String(playerNumber)
            userName = global.defaults.string(forKey: key)!
        }
        return userName
    }
}
