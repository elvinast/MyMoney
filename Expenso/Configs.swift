//
//  Configs.swift
//  Expenso
//
//  Created by Sameer Nawaz on 31/01/21.
//

import Foundation

enum TransactionsTag: String {
    case TRANS_TAG_TRANSPORT = "transport"
    case TRANS_TAG_FOOD = "food"
    case TRANS_TAG_HOUSING = "housing"
    case TRANS_TAG_SCHOLARSHIP = "scholarship"
    case TRANS_TAG_MEDICAL = "medical"
    case TRANS_TAG_DEPOSIT = "deposit"
    case TRANS_TAG_PERSONAL = "personal"
    case TRANS_TAG_ENTERTAINMENT = "entertainment"
    case TRANS_TAG_SHOPPING = "shopping"
    case TRANS_TAG_OTHERS = "others"
}

struct Constants {
    static let shared = Constants()
    
    let APP_NAME = "MyMoney"
    let APP_LINK = "https://github.com/elvinast/MyMoney"
    let SHARED_FROM_APP = "Shared from MyMoney App: https://github.com/elvinast/MyMoney"

    // IMAGE_ICON NAMES
    let IMAGE_DELETE_ICON = "delete_icon"
    let IMAGE_SHARE_ICON = "share_icon"
    let IMAGE_FILTER_ICON = "filter_icon"
    let IMAGE_OPTION_ICON = "settings_icon"

    // User Defaults
    let UD_USE_BIOMETRIC = "useBiometric"
    let UD_EXPENSE_CURRENCY = "expenseCurrency"

    let CURRENCY_LIST = ["₸", "$", "€"]

    // Transaction types
    let TRANS_TYPE_INCOME = "income"
    let TRANS_TYPE_EXPENSE = "expense"
}

func getTransTagIcon(transTag: TransactionsTag) -> String {
    switch transTag {
        case .TRANS_TAG_TRANSPORT: return "trans_type_transport"
        case .TRANS_TAG_FOOD: return "trans_type_food"
        case .TRANS_TAG_HOUSING: return "trans_type_housing"
        case .TRANS_TAG_SCHOLARSHIP: return "trans_type_scholarship"
        case .TRANS_TAG_MEDICAL: return "trans_type_medical"
        case .TRANS_TAG_DEPOSIT: return "trans_type_deposit"
        case .TRANS_TAG_PERSONAL: return "trans_type_personal"
        case .TRANS_TAG_ENTERTAINMENT: return "trans_type_entertainment"
        case .TRANS_TAG_OTHERS: return "trans_type_others"
        case .TRANS_TAG_SHOPPING: return "trans_type_shopping"
//        default: return "trans_type_others"
    }
}

func getTransTagTitle(transTag: TransactionsTag) -> String {
    switch transTag {
        case .TRANS_TAG_TRANSPORT: return "Transport"
        case .TRANS_TAG_FOOD: return "Food"
        case .TRANS_TAG_HOUSING: return "Housing"
        case .TRANS_TAG_SCHOLARSHIP: return "Insurance"
        case .TRANS_TAG_MEDICAL: return "Medical"
        case .TRANS_TAG_DEPOSIT: return "Savings"
        case .TRANS_TAG_PERSONAL: return "Personal"
        case .TRANS_TAG_ENTERTAINMENT: return "Entertainment"
        case .TRANS_TAG_OTHERS: return "Others"
        case .TRANS_TAG_SHOPPING: return "Utilities"
//        default: return "Unknown"
    }
}

func getDateFormatter(date: Date?, format: String = "yyyy-MM-dd") -> String {
    guard let date = date else { return "" }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: date)
}

