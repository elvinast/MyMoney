//
//  ExpenseDetailedViewModel.swift
//  MyMoney
//
//  Created by Amina Moldamyrza on 24/12/22.
//

import UIKit
import CoreData

class ExpenseDetailedViewModel: ObservableObject {
    
    @Published var expenseObj: ExpenseCD
    
    @Published var alertMsg = String()
    @Published var showAlert = false
    @Published var closePresenter = false
    
    init(expenseObj: ExpenseCD) {
        self.expenseObj = expenseObj
    }
    
    func deleteNote(managedObjectContext: NSManagedObjectContext) {
        managedObjectContext.delete(expenseObj)
        do {
            try managedObjectContext.save(); closePresenter = true
        } catch { alertMsg = "\(error)"; showAlert = true }
    }
    
    func shareNote() {
        let shareStr = """
        Title: \(expenseObj.title ?? "")
        Amount: \(UserDefaults.standard.string(forKey: Constants.shared.UD_EXPENSE_CURRENCY) ?? "")\(expenseObj.amount)
        Transaction type: \(expenseObj.type == Constants.shared.TRANS_TYPE_INCOME ? "Income" : "Expense")
        Category: \(getTransTagTitle(transTag: TransactionsTag(rawValue: expenseObj.tag ?? "") ?? .TRANS_TAG_OTHERS))
        Date: \(getDateFormatter(date: expenseObj.occuredOn, format: "EEEE, dd MMM hh:mm a"))
        Note: \(expenseObj.note ?? "")
        
        \(Constants.shared.SHARED_FROM_APP)
        """
        let av = UIActivityViewController(activityItems: [shareStr], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}
