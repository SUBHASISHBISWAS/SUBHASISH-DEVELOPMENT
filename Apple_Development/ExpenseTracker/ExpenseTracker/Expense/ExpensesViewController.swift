//
//  ExpensesViewController.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//

import UIKit
import CoreData

class ExpensesViewController: UIViewController
{

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate=self
        tableView.dataSource=self
        
        tableView.rowHeight=70
        
        tableView.backgroundView=UIImageView(image: UIImage(named: "Background-PDF"))
        
        fetchExpense();
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.alpha=0.5
    }
    
    func fetchExpense()
    {
        do
        {
            ExpenseManager.expenses = try  context.fetch(Expense.fetchRequest())
            DispatchQueue.main.async
            {
                self.tableView.reloadData()
            }
        }
        catch{}
    }
}


extension ExpensesViewController :UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Row Selected")
        
    }
}

extension ExpensesViewController :UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ExpenseManager.GetExpenses().count
    }
    
    //showing data into table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! ExpenseTableViewCell
        
        if (indexPath.item % 2 == 0)
        {
            cell.backgroundColor=UIColor.clear
        }
        else
        {
            cell.backgroundColor=UIColor.white.withAlphaComponent(0.2)
            cell.textLabel?.backgroundColor=UIColor.white.withAlphaComponent(0.0)
        }
        
        let expense = ExpenseManager.expenses[indexPath.item]
        cell.textLabel?.text = expense.transactionType
        cell.Expense=cell.textLabel?.text
        return cell
    }
    
    //Passing data to another view Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if (segue.identifier == "monthlyOverviewSegue") {
            let cell=sender as! ExpenseTableViewCell
            let monthlyExpenseOverView=segue.destination as! MonthlyExpenseOverviewViewCpntroller
            monthlyExpenseOverView.monthlyExpenseOverview=cell.Expense
        }
    }
    
    //Enable Delete Functionality in Row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if(editingStyle == .delete)
        {
            ExpenseManager.DeleteExpense(id: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        
    }
}
