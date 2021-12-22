//
//  Cast.swift
//  SeSAC-Week13
//
//  Created by AlexHwang on 2021/12/21.
//

import Foundation

// MARK: - Cast
struct Cast: Codable {
    let peopleListResult: PeopleListResult
}

// MARK: - PeopleListResult
struct PeopleListResult: Codable {
    let totCnt: Int
    let peopleList: [PeopleList]
    let source: String
}

// MARK: - PeopleList
struct PeopleList: Codable {
    let peopleCD, peopleNm: String
    let peopleNmEn: PeopleNmEn
    let repRoleNm, filmoNames: String

    enum CodingKeys: String, CodingKey {
        case peopleCD = "peopleCd"
        case peopleNm, peopleNmEn, repRoleNm, filmoNames
    }
}

enum PeopleNmEn: String, Codable {
    case choiWooyoung = "choi wooyoung"
    case empty = ""
    case parkJiHyun = "PARK JI HYUN"
}
