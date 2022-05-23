//
//  ViewController.swift
//  praksatubes
//
//  Created by Webelinx Praksa 1  on 23/03/2022.
//

import UIKit
import SwiftUI

struct Level :Decodable
{
    var level: Int
    var tubes: [[Int]]
}


class ViewController: UIViewController
{
    var sizeOfTube: CGFloat = 0
    var sizeBetweenTubes : CGFloat = 0.0
    var top: CGFloat = 0.0
    var bottom : CGFloat = 0.0
    var tubes = [TubeView]()

    var level = [Level]()
    var selected : Ball?


    @IBOutlet weak var restartBtn: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        top = self.view.frame.height - 300
        bottom = 50
        sizeOfTube =  ((self.view.frame.width) - 50)/4
        sizeBetweenTubes = 10
        restartBtn.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        restartBtn.setTitle("", for: .normal)
        loadLevels()

        setTubes()
    }
    
    func setTubes()
    {
        
        let rectOne = CGRect(x: sizeBetweenTubes, y: top, width: sizeOfTube, height: 200)
        let rectTwo = CGRect(x: 2*sizeBetweenTubes + sizeOfTube, y: top, width: sizeOfTube, height: 200)
        let rectThree = CGRect(x: 3*sizeBetweenTubes + 2*sizeOfTube, y: top, width: sizeOfTube, height: 200)
        let rectFour = CGRect(x: 4*sizeBetweenTubes + 3*sizeOfTube, y: top, width: sizeOfTube, height: 200)

        tubes.append(TubeView(frame: rectOne, balls: level[0].tubes[0],indeks: 1))
        tubes.last?.delegate = self
        super.view.addSubview(tubes.last!)
        tubes.append(TubeView(frame: rectTwo, balls: level[0].tubes[1],indeks: 2))
        tubes.last?.delegate = self
        super.view.addSubview(tubes.last!)
        tubes.append(TubeView(frame: rectThree, balls: level[0].tubes[2],indeks: 3))
        tubes.last?.delegate = self
        super.view.addSubview(tubes.last!)
        tubes.append(TubeView(frame: rectFour, balls: level[0].tubes[2],indeks: 4))
        tubes.last?.delegate = self
        super.view.addSubview(tubes.last!)
        
    }
    
    func loadLevels()
    {
     
        if let url = Bundle.main.url(forResource: "levels", withExtension: "json")
        {
            do
            {
                let data = try Data(contentsOf: url)
                level = try JSONDecoder().decode([Level].self, from: data)
            
            }
            catch{}
        }
        
    }
    
// sizeBetweenTubes
// sizeOfTube
// top

}
extension ViewController : BallMove
{
    func tapTube(tube: TubeView)
    {
        
      if selected == nil
      {
        if let selected = tube.removeBall()
        {
            print("nesto je electovano")
            let i = CGFloat((tube.indexTube))
            let newX = i*sizeBetweenTubes + (i-1)*sizeOfTube
            let newY = top + CGFloat(1.5*4) + (i-1)*(selected.frame.height)
           // let newFrame = CGRect(x: newX, y: newY, width: selected.frame.width, height: selected.frame.height)
            selected.frame = CGRect(x: newX, y: newY - 100, width: selected.frame.width, height: selected.frame.height)
            self.view.addSubview(selected)
            self.selected = selected
            let animation = CABasicAnimation(keyPath: "position")
            animation.fromValue = CGPoint(x: selected.center.x , y: selected.center.y + 100)
            animation.toValue = selected.center
            selected.layer.add(animation, forKey: nil)
            
            
        }
      }
        else
        {
            let i = tube.indexTube
            if i == selected?.index
            {
                let ind = selected?.index ?? 0
                let newX = CGFloat(ind)*sizeBetweenTubes + CGFloat(ind-1)*sizeOfTube
                let half = CGFloat(tube.balls.numOfElements)*(selected?.frame.height ?? 0)
                let newY = top + CGFloat(1.5*4) + half
                selected?.frame = CGRect(x: newX, y: newY + 100, width: selected!.frame.width , height: selected!.frame.height )
                let animation = CABasicAnimation(keyPath: "position")
                animation.fromValue = selected?.center
                animation.toValue = CGPoint(x: (selected!.center.x) , y: (selected?.center.y)! - 100)

                selected!.layer.add(animation, forKey: nil)
                let origin = CGPoint(x: 0, y: tubes[ind].frame.height - (selected?.frame.height)! * (CGFloat(tubes[ind].balls.numOfElements))-1.5)

                selected?.frame = CGRect(origin: origin, size: selected?.frame.size ?? .zero)
                
                tube.addSubview(selected!)
                tube.balls.push(selected!)
                selected = nil
            }
            else
            {
                if tube.balls.numOfElements < 4
                {
                    let ind = tube.indexTube
                     let newX = CGFloat(ind)*sizeBetweenTubes + CGFloat(ind - 1)*sizeOfTube
                     let half = CGFloat(tube.balls.numOfElements)*(selected?.frame.height ?? 0)
                     let newY = top + CGFloat(1.5*4) + half
                    let lastCenter = selected?.center
                    selected?.frame = CGRect(x: newX, y: newY - 100 , width: selected!.frame.width , height: selected!.frame.height )
                    let animation = CABasicAnimation(keyPath: "position")
                    animation.fromValue = lastCenter
                    animation.toValue = selected?.center
                    
                    selected!.layer.add(animation, forKey: nil)
                    selected?.frame = CGRect(x: newX, y: newY + 100 , width: selected!.frame.width , height: selected!.frame.height )
                    let animation2 = CABasicAnimation(keyPath: "position")
                    animation2.fromValue = selected?.center
                    animation2.toValue = CGPoint(x: (selected!.center.x) , y: (selected?.center.y)! - 100)
                    selected!.layer.add(animation2, forKey: nil)
                    let origin = CGPoint(x: 0, y: tube.frame.height - (selected?.frame.height)! * (CGFloat(tube.balls.numOfElements+1))-1.5)

                    selected?.frame = CGRect(origin: origin, size: selected?.frame.size ?? .zero)
                    selected?.index = i
                    tube.addSubview(selected!)
                    tube.balls.push(selected!)
                    
                    selected = nil
                }
                else
                {
                    let ind = selected?.index ?? 0
                    let newX = CGFloat(ind)*sizeBetweenTubes + CGFloat(ind-1)*sizeOfTube
                    let half = CGFloat(tubes[ind].balls.numOfElements)*(selected?.frame.height ?? 0)
                    let newY = top + CGFloat(1.5*4) + half
                    selected?.frame = CGRect(x: newX, y: newY + 100, width: selected!.frame.width , height: selected!.frame.height )
                    let animation = CABasicAnimation(keyPath: "position")
                    animation.fromValue = selected?.center
                    animation.toValue = CGPoint(x: (selected!.center.x) , y: (selected?.center.y)! - 100)

                    selected!.layer.add(animation, forKey: nil)
                    let origin = CGPoint(x: 0, y: tubes[ind].frame.height - (selected?.frame.height)! * (CGFloat(tubes[ind].balls.numOfElements))-1.5)

                    selected?.frame = CGRect(origin: origin, size: selected?.frame.size ?? .zero)
                    
                    tubes[ind].addSubview(selected!)
                    tubes[ind].balls.push(selected!)
                    selected = nil
                }
            }
            
        
        
        
        
      }
    }
    
    
}

