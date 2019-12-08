//
//  Resource.swift
//  MirnaiaNV_HW2.8
//
//  Created by Наталья Мирная on 07/12/2019.
//  Copyright © 2019 Наталья Мирная. All rights reserved.
//

struct Resource {
    let id: Int
    let article: String
    let brand: String
    let name: String
    let price: Double
    let imageSquare: String
    let imageLandscape: String
    
    var searchText: String {
        "\(article.lowercased()) \(brand.lowercased()) \(name.lowercased())"
    }
}

extension Resource {
    static func getResourceList() -> [Resource] {
        return [
            Resource(id: 1, article: "GDB1044", brand: "TRW", name: "Колодки передние AUDI 80 (B4), CHERY AMULET, VW GOLF III, PASSAT (3A) GDB1044", price: 1545, imageSquare: "gdb1044-sq", imageLandscape: "gdb1044-ld"),
            Resource(id: 2, article: "GDB826", brand: "TRW", name: "Колодки передние AUDI 80 B3, B4, VW PASSAT (3A_) GDB826 ", price: 1332, imageSquare: "gdb826-sq", imageLandscape: "gdb826-ld"),
            Resource(id: 3, article: "KL2", brand: "KNECHT", name: "Фильтр топливный KL2", price: 386, imageSquare: "kl2-sq", imageLandscape: "kl2-ld"),
            Resource(id: 4, article: "KL186", brand: "KNECHT", name: "Фильтр топливный KL186", price: 271, imageSquare: "kl186-sq", imageLandscape: "kl186-ld"),
            Resource(id: 5, article: "1845004", brand: "IDEMITSU", name: "Моторное масло IDEMITSU ZEPRO TOURING 5W30 SN/GF-5 4л 1845-004", price: 1855, imageSquare: "1845004-sq", imageLandscape: "1845004-ld"),
            Resource(id: 6, article: "1845001", brand: "IDEMITSU", name: "Моторное масло IDEMITSU ZEPRO TOURING 5W30 SN/GF-5 (1л) 1845-001", price: 1750, imageSquare: "1845001-sq", imageLandscape: "1845001-ld"),
            Resource(id: 7, article: "0888080375GO", brand: "TOYOTA", name: "Масло моторное синтетическое TOYOTA ENGINE OIL 5W-40 5л 08880-80375GO", price: 2546.77, imageSquare: "0888080375go-sq", imageLandscape: "0888080375go-ld"),
            Resource(id: 8, article: "152567", brand: "MOBIL", name: "Масло моторное синтетическое Super 3000 X1 5W-40 1л 152567", price: 469.54, imageSquare: "152567-sq", imageLandscape: "152567-ld"),
            Resource(id: 9, article: "3397004670", brand: "BOSCH", name: "Щетка стеклоочистителя ECO 500 50C 3397004670", price: 147, imageSquare: "3397004670-sq", imageLandscape: "3397004670-ld"),
            Resource(id: 10, article: "3397007640", brand: "BOSCH", name: "Щетки стеклоочиститей со спойлером комплект Aerotwin A640S 725/725 3397007640", price: 1270, imageSquare: "3397007640-sq", imageLandscape: "3397007640-ld"),
            Resource(id: 11, article: "3397007297", brand: "BOSCH", name: "Щетки стеклоочистителя ATW 600/500 A297S 3397007297", price: 1112, imageSquare: "3397007297-sq", imageLandscape: "3397007297-ld")
        ]
    }
}
