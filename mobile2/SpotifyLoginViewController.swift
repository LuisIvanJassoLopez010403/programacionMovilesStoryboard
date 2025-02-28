//
//  SpotifyLoginViewController.swift
//  mobile2
//
//  Created by ITIT on 19/02/25.
//

import UIKit
import SwiftVideoBackground

class SpotifyLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        try? VideoBackground.shared.play(view:
        view, videoName: "videoSpotifyLogin",
        videoType: "mp4")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
