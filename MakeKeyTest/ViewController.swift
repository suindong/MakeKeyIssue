//
//  ViewController.swift
//  MakeKeyTest
//
//  Created by chiahsun.tung on 2021/09/16.
//

import UIKit

class ViewController: UIViewController {
    var window: UIWindow!
    var window2: UIWindow!

    lazy var windows: [UIWindow] = [
        UIApplication.shared.windows.first!,
        window,
        window2
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIApplication.shared.connectedScenes.first.mak
            let scene = UIApplication.shared.connectedScenes.first as! UIWindowScene
            self.window = UIWindow(windowScene: scene)
            self.window.frame = .init(x: 0, y: 0, width: 150, height: 400)
//            self.window = UIWindow(frame: .init(x: 0, y: 0, width: 150, height: 400))
            self.window.backgroundColor = .systemPink
            self.window.windowLevel = .normal + 1
            self.window.isHidden = false

            self.window2 = UIWindow(frame: .init(x: 100, y: 0, width: 150, height: 400))
            self.window2.backgroundColor = .blue
            self.window2.windowLevel = .alert + 1
            self.window2.isHidden = false
        }
    }

    var flag = false
    @IBAction func didTap(_ sender: Any) {
        flag = !flag
        makeKeyWindowRandomly()
    }

    func makeKeyWindowRandomly() {
        guard flag else { return }
        windows.randomElement()?.makeKeyAndVisible()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.makeKeyWindowRandomly()
        }
    }
}

