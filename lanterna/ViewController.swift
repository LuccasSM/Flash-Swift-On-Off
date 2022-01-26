//
//  ViewController.swift
//  lanterna
//
//  Created by Luccas Santana Marinho on 26/01/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let button = UIButton(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemOrange
        self.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
    //MARK: ---
        
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        button.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(toggleTorch), for: .touchUpInside)
    }
    
    //MARK: ---
    
    @objc func toggleTorch(on: Bool) {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        if ((device?.hasTorch) != nil) {
            do {
                try device?.lockForConfiguration()
                if (device?.torchMode == AVCaptureDevice.TorchMode.on) {
                    device?.torchMode = AVCaptureDevice.TorchMode.off
                } else {
                    try device?.setTorchModeOn(level: 1.0)
                }
                device?.unlockForConfiguration()
            } catch {
                print("Erro no Flash")
            }
        }
    }
}
