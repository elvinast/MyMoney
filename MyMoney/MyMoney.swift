//
//  MyMoney.swift
//  MyMoney
//
//  Created by Elvina Shamoi on 24/12/22.
//

import SwiftUI
import CoreData

@main
struct MyMoney: App {
    init() {
        self.setDefaultPreferences()
    }
    
    private func setDefaultPreferences() {
        let currency = UserDefaults.standard.string(forKey: Constants.shared.UD_EXPENSE_CURRENCY)
        if currency == nil {
            UserDefaults.standard.set("₸", forKey: Constants.shared.UD_EXPENSE_CURRENCY)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: Constants.shared.UD_USE_BIOMETRIC) {
                AuthenticateView(viewModel: AuthenticationViewModel())
                    .environment(\.managedObjectContext, persistentContainer.viewContext)
            } else {
                ExpenseView()
                    .environment(\.managedObjectContext, persistentContainer.viewContext)
            }
        }
    }
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyMoney")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
