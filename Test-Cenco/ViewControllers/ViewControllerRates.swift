//
//  ViewControllerRates.swift
//  Test-Cenco
//
//  Created by Jose David Bustos H on 20-02-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

//import Foundation
import UIKit

class ViewControllerRates: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    final let urls = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=34738023d27013e6d1b995443764da44")
    private var peliculas = [Result]()
   let pathWebpicture = "http://image.tmdb.org/t/p/w500"
    @IBOutlet weak var tableViewRates: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJsonRates()
        tableViewRates.delegate = self
        tableViewRates.dataSource = self
        tableViewRates.tableFooterView = UIView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadJsonRates() {
        guard let downloadURL = urls else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("algo fallo")
                return
            }
            print("descargado")
            do
            {
                let decoder = JSONDecoder()
                let downloadedMovies = try decoder.decode(Movies.self, from: data)
                //print(downloadedMovies)
                self.peliculas = downloadedMovies.results
                print(self.peliculas)
                DispatchQueue.main.async {
                    self.tableViewRates.reloadData()
                }
            } catch {
                print("ocurrio un error despues de descarga")
            }
            }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellRates") as? TableViewCellRates else { return UITableViewCell() }
        
        cell.LblLanguage.text = "Lan: " + peliculas[indexPath.row].original_language
        cell.LblTitle.text = "Title: " + peliculas[indexPath.row].original_title
        
        let paths = String(self.pathWebpicture) + String(peliculas[indexPath.row].poster_path)
        if let imageURL = URL(string:paths) {
            print(imageURL)
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.ImageView.image = image
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("deberia abrir VCDetailsTopRates")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCDetailsTopRates") as! VCDetailsTopRates
        controller.nameString = String(peliculas[indexPath.row].title)
        controller.decripString = peliculas[indexPath.row].overview
        controller.imageString = String(self.pathWebpicture) + String(peliculas[indexPath.row].poster_path)
        self.present(controller, animated: true, completion: nil)
        
    }
}
