//
//  SearchHeroesViewController.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import UIKit

class SearchHeroesViewController: UIViewController,
                                  UITextFieldDelegate,
                                  UITableViewDelegate,
                                  UITableViewDataSource,
                                  SearchHeroesPresenterDelegate {
    
    @IBOutlet weak var tfNameHeroes: UITextField!
    @IBOutlet weak var vwSearch: UIView!
    @IBOutlet weak var tbHeroes: UITableView!
    
    var presenter: SearchHeroesPresenter!
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Presenter Delegate
    //-----------------------------------------------------------------------
    
    func dataLoaded() {
        
        tbHeroes.reloadData()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom methods
    //-----------------------------------------------------------------------
    
    private func loadUI() {
        
        hideKeyboard()
        
        label.text = Constants.Messages.SearchHeroes
        
        if let text = self.tfNameHeroes.text?.folding(options: .diacriticInsensitive, locale: .current), !text.isEmpty, text != " " {
            
            self.presenter.loadHeroes(name: text.replacingOccurrences(of: " ", with: "+"))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            self.label.text = self.showMessageHeroesNotFound()
        }
    }
    
    private func showMessageHeroesNotFound() -> String {
        
        self.presenter.loadingHeroes = false
        
        if self.presenter.heroes.count == 0 {
            
            if let hero = self.tfNameHeroes.text {
                
                let text = "Nāo foram encontrados \nheróis com o nome \(hero)."
                
                return text
            }
        }
        
        return " "
    }
    
    private func configUI() {
        
        self.configSearchBar()
    }
    
    private func configSearchBar() {
        
        self.vwSearch.layer.cornerRadius = self.vwSearch.frame.height / 2
        self.vwSearch.layer.shadowRadius = self.vwSearch.frame.height / 2
        self.vwSearch.layer.shadowOpacity = 0.5
        self.vwSearch.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.vwSearch.layer.shadowColor = UIColor(red: 0.667, green: 0.765, blue: 0.859, alpha: 0.5).cgColor
        
        self.tfNameHeroes.delegate = self
    }
    
    private func showMessageEnterHero() {
        
        if let text = self.tfNameHeroes.text, text.isEmpty {
            
            let text = Constants.Messages.EnterHeroName
            self.message(text)
        }
    }
    
    private func message(_ text: String) {
        
        let alert = UIAlertController(title: "", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //---------------------------------------------------------
    //    MARK: - Keyboard Configuration
    //---------------------------------------------------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        showMessageEnterHero()
        
        loadUI()
        
        return true
    }
    
    func hideKeyboard() {
        
        self.tfNameHeroes.resignFirstResponder()
    }
    
    //-----------------------------------------------------------------------
    // MARK: - Table view data source
    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.backgroundView = self.presenter.heroes.count == 0 ? label : nil
        
        return self.presenter.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        
        let hero = self.presenter.heroes[indexPath.row]
        cell.prepareCell(with: hero)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == self.presenter.heroes.count - 10 && !self.presenter.loadingHeroes && self.presenter.heroes.count != self.presenter.total {
            
            self.presenter.currentPage += 1
            print("Carregando mais Heróis")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.showDetail(index: indexPath.row)
    }
    
    //---------------------------------------------------------
    //    MARK: - Actions Buttons
    //---------------------------------------------------------
    
    @IBAction func searchHeroes(_ sender: Any) {
        
        showMessageEnterHero()
        
        loadUI()
    }
}
