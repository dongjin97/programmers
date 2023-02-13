//
//  main.swift
//  Programmers
//
//  Created by 원동진 on 2023/02/10.
//
// Summer&Winter Coding 2019&2018
import Foundation

//MARK: - 소수 만들기
//func solution(_ nums:[Int]) -> Int {
//    var answer = 0
//
//    for i in 0..<nums.count{
//        for j in i+1..<nums.count{
//            for k in j+1..<nums.count{
//                let sum = nums[i]+nums[j]+nums[k]
//                if isPrime(num: sum) == true{
//                    answer+=1
//                }
//
//            }
//        }
//    }
//    return answer
//}
//func isPrime(num: Int) -> Bool {
//    if(num<4) {
//        return num == 1 ? false : true
//    }
//    for i in 2...Int(sqrt(Double(num))) {
//        if(num % i == 0) { return false }
//    }
//    return true
//}
//print(solution([1,2,7,6,4]))

//MARK: - 예산
//func solution(_ d:[Int], _ budget:Int) -> Int {
//    var sum = 0
//    var count = 0
//    var arr = d.sorted()
//    print(arr)
//    for i in arr {
//        sum += i
//        if sum <= budget {
//            count+=1
//        }
//    }
//    return count
//}
//print(solution([1,3,2,5,4], 9))

//MARK: - 멀쩡한 사각형
//대각선이 지나가는 사각형의 개수 : 가로 + 세로 - (가로 세로의 최대 공약수)
//func solution(_ w:Int, _ h:Int) -> Int64{
//    var answer:Int64 = 0
//    answer = Int64((w*h)-(w+h-(gcd(w,h))))
//    return answer
//}
//최대 공약수
//func gcd(_ a: Int,_ b : Int) -> Int{
//    if b == 0{
//        return a
//    }else{
//        return gcd(b, a%b)
//    }
//
//}

//MARK : -방문 길이
//func solution(_ dirs:String) -> Int {
//    let dx = [-1,1,0,0]
//    let dy = [0,0,1,-1]
//    var current : (Int,Int) = (0,0)
//    let dir = ["L","R","U","D"]
//    var visited : Set<String> = []
//    for i in dirs {
//        var goal = current
//        for j in 0..<dir.count{
//            if String(i) == dir[j]{
//                let x = current.0 + dx[j]
//                let y = current.1 + dy[j]
//                goal = (x,y)
//            }
//        }
//        if -5...5 ~= goal.0 && -5...5 ~= goal.1 {
//            visited.insert("\(current)\(goal)")
//            visited.insert("\(goal)\(current)")
//            current = goal
//        }
//    }
//
//    return visited.count/2
//}
//print(solution("ULURRDLLU"))
//MARK: - 스킬트리 참조 : https://fomaios.tistory.com/entry/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EC%8A%A4%ED%82%AC%ED%8A%B8%EB%A6%AC-Swift
//func solution(_ skill:String, _ skill_trees:[String]) -> Int {
//    var answer = skill_trees.count
//    for tree in skill_trees{
//        let onlySkill = tree.filter{skill.contains($0)}
//        let prefix = skill.prefix(onlySkill.count)
//        if prefix != onlySkill{
//            answer-=1
//        }
//    }
//
//    return answer
//}
//MARK: - 영어 끝말잇기 참조 : https://keeplo.tistory.com/468
//func solution(_ n:Int, _ words:[String]) -> [Int] {
//    var checkWord = [String]()
//    for (index,word) in words.enumerated(){
//        if !checkWord.isEmpty,checkWord.contains(word) || checkWord.last?.last! != word.first{
//            return [index%n+1,index/n+1]
//        }
//        checkWord.append(word)
//    }
//    return [0,0]
//}
//
//MARK: - 점프와 순간이동
//import Foundation
//
//func solution(_ n:Int) -> Int
//{
//    var target = n
//    var ans:Int = 0
//    while target != 0{
//        if target % 2 == 0{
//            target = target/2
//        }else{
//            target-=1
//            ans+=1
//        }
//    }
//
//
//    return ans
//}
//MARK: - 배달 참조 : https://jeong9216.tistory.com/365
//func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
//    var answer = 0
//    var costs : [Int] = Array(repeating: Int.max, count: N+1)
//    var graph = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
//    for r in road {
//            graph[r[0]][r[1]] = min(r[2], graph[r[0]][r[1]])
//            graph[r[1]][r[0]] = min(r[2], graph[r[1]][r[0]])
//    }
//    var queue : [(index: Int ,cost : Int)] = [(1,0)]
//    var index = 0
//    costs[1] = 0
//    while index < queue.count{
//        let node = queue[index]
//        index+=1
//        for next in 1...N{
//            if graph[node.index][next] == Int.max {
//                continue
//            }
//            let nCost = node.cost + graph[node.index][next]
//            if graph[node.index][next] != Int.max && nCost < costs[next]{
//                costs[next] = nCost
//                queue.append((next,nCost))
//            }
//        }
//    }
//    answer = costs.filter{$0 <= k}.count
//
//    return answer
//}

// 게임은 턴제 항상두명
// 초기에 0이상 9이하의 정수가 들어있는 배열이 하나 주어짐, 양플레이어는 하나의 배열을 공유하며 플레이를 합니다.
//자신의턴 배열에서 0이아닌수 골라서 -1 -> 일로 앞뒤 똑같은거 만들면승리
//안되면 상대방에게 넘김
import Foundation

func solution(_ queries:[[Int]]) -> [Int] {
    var result : [Int] = []
    var index = 1
    while result.count != queries.count {
        var firstPepleWin : Bool = false
        for i in queries{
            var numbers = Array(i)
            var tempArr : [[Int]] = []
            var str = ""
            while true {
                for i in 0..<numbers.count{
                    var temp = numbers
                    if numbers[i] != 0{
                        let num = temp.remove(at: i) - 1
                        temp.insert(num, at: i)
                        tempArr.append(temp)
                    }
                }
                for i in tempArr {
                    for j in i {
                        str += String(j)
                    }
                    if checkPal(str: str) {
                        print("\(index%2)win")
                        break
                    }
                    str = ""
                }
            }
            
    }
     
    
        
    }
    return []
}
func checkPal(str : String) -> Bool {
    if str == String(str.reversed()) {
        return true
    }
    
    return false
}
