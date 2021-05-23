//
//  YearlyExpenseViewController.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 06/01/21.
//

import UIKit

class MonthlyExpenseByTypeCollectionView: UIViewController {

    @IBOutlet weak var expenceCollectionView: UICollectionView!
    var transactionDate : Date?
    var expenseByTypeByMonthSource : ExpenseByTypeByMonthDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ExpenseByCardManger.GetMonthlyExpenseOfAllCard( completion: { [weak self] (ExpenseByTypeModels) in
            guard let self = self else { return }
            
            self.expenseByTypeByMonthSource = ExpenseByTypeByMonthDataSource(expenseByTypes:ExpenseByTypeModels)
            self.expenceCollectionView.dataSource = self.expenseByTypeByMonthSource
            self.expenceCollectionView.delegate = self.expenseByTypeByMonthSource
            self.expenceCollectionView.reloadData()
        },transactionDate: transactionDate! )
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    expenceCollectionView.reloadData()
    }
}
