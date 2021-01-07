//
//  MonthlyExpenseOverview.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//

import UIKit

class MonthlyExpenseOverviewViewCpntroller: UIViewController {

    @IBOutlet var expenseOverView : UITextView!
    
    var monthlyExpenseOverview :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        self.title=monthlyExpenseOverview
    }

}
