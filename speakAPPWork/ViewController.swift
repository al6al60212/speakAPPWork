//
//  ViewController.swift
//  speakAPPWork
//
//  Created by 董禾翊 on 2022/8/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //拉出slider、lable、textField的outlet
    @IBOutlet weak var pitch: UISlider!
    @IBOutlet weak var pitchLable: UILabel!
    @IBOutlet weak var rate: UISlider!
    @IBOutlet weak var rateLable: UILabel!
    @IBOutlet weak var volume: UISlider!
    @IBOutlet weak var volumeLable: UILabel!
    @IBOutlet weak var speakUITextField: UITextField!
    let synthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showLable()
    }
    //點擊view任何處，鍵盤收起
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func speak(text: String){
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.pitchMultiplier = pitch.value
        speechUtterance.rate = rate.value
        speechUtterance.volume = volume.value
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        synthesizer.speak(speechUtterance)
    }
    func showLable(){
        pitchLable.text = String(format: "%.1f", pitch.value)
        rateLable.text = String(format: "%.1f", rate.value)
        volumeLable.text = String(format: "%.1f", volume.value)
    }
    //slider動作時，lable顯示數字
    @IBAction func pitchSlider(_ sender: Any) {
        pitchLable.text = String(format: "%.1f", pitch.value)
    }
    @IBAction func rateSlider(_ sender: Any) {
        rateLable.text = String(format: "%.1f", rate.value)
    }
    @IBAction func volumeSlider(_ sender: Any) {
        volumeLable.text = String(format: "%.1f", volume.value)
    }
    //隨機語調按鈕
    @IBAction func randon(_ sender: Any) {
        pitch.value = Float.random(in: 0.5...2)
        rate.value = Float.random(in: 0...1)
        volume.value = Float.random(in: 0...1)
        showLable()
    }
    //初始語調按鈕
    @IBAction func initialValue(_ sender: Any) {
        pitch.value = 1.25
        rate.value = 0.5
        volume.value = 0.5
        showLable()
    }
    //播放鍵
    @IBAction func play(_ sender: Any) {
        if synthesizer.isSpeaking{
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        }
        speak(text: speakUITextField.text!)
    }
    //大悲咒
    @IBAction func daBeiZhou(_ sender: Any) {
        if synthesizer.isSpeaking{
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        }
        speak(text: "南無喝囉怛那哆囉夜耶．南無阿唎耶，婆盧羯帝爍缽囉耶．菩提薩埵婆耶． 摩訶薩埵婆耶．摩訶迦盧尼迦耶．唵，薩皤囉罰曳．數怛那怛寫．南無 悉吉慄埵伊蒙阿唎耶．婆盧吉帝室佛囉愣馱婆．南無那囉謹墀．醯利摩訶 皤哆沙咩．  薩婆阿他豆輸朋，阿逝孕，薩婆薩哆那摩婆薩哆，那摩婆伽，摩罰特豆． 怛姪他．唵，阿婆盧醯．盧迦帝．迦羅帝．夷醯唎．摩訶菩提薩埵， 薩婆薩婆．摩囉摩囉，摩醯摩醯唎馱孕．俱盧俱盧羯蒙．度盧度盧罰闍耶帝． 摩訶罰闍耶帝．陀囉陀囉．地唎尼．室佛囉耶．  遮囉遮囉．摩麼罰摩囉．穆帝隸．伊醯伊醯．室那室那．阿囉參佛囉舍利． 罰沙罰參．佛囉舍耶．呼嚧呼嚧摩囉．呼嚧呼嚧醯利．娑囉娑囉，悉唎悉唎． 蘇嚧蘇嚧．  菩提夜菩提夜．菩馱夜菩馱夜．彌帝唎夜．那囉謹墀．地利瑟尼那．波夜摩那 ．娑婆訶．悉陀夜．娑婆訶．摩訶悉陀夜．娑婆訶．悉陀喻藝．室皤囉耶． 娑婆訶．那囉謹墀．娑婆訶．摩囉那囉．娑婆訶．悉囉僧阿穆佉耶，娑婆訶． 娑婆摩訶阿悉陀夜．娑婆訶．  者吉囉阿悉陀夜．娑婆訶．波陀摩羯悉陀夜．娑婆訶．那囉謹墀皤伽囉耶． 娑婆訶．摩婆利勝羯囉夜．娑婆訶．南無喝囉怛那哆囉夜耶，南無阿唎耶． 婆嚧吉帝．爍皤囉夜．娑婆訶．唵，悉殿都．漫多囉．跋陀耶，娑婆訶．")
    }
    //般若波羅密多心經
    @IBAction func xinJing(_ sender: Any) {
        if synthesizer.isSpeaking{
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        }
        speak(text: "觀自在菩薩。行深波若波羅蜜多時。照見五蘊皆空。度一切苦厄。舍利子。色不異空。空不異色。色即是空。空即是色。受想行識。亦復如是。舍利子。是諸法空相。不生不滅。不垢不淨。不增不減。是故空中無色。無受想行識。無眼耳鼻舌身意。無色身香味觸法。無眼界。乃至無意識界。無無明。亦無無明盡。乃至無老死。亦無老死盡。無苦集滅道。無智。亦無得。以無所得得故。菩提薩埵。依般若波羅蜜多故。心無罣礙。無罣礙故。遠離顛倒夢想。究竟涅盤。三世諸佛。依波若波羅蜜多故。得阿藐多羅三藐三菩提。故知般若波羅蜜多。是大神咒。是大明咒。是無上咒。是無等等咒。能除一切苦。真實不虛。故說波若波羅蜜多咒。即說咒曰。揭諦揭諦。波羅揭諦。波羅僧揭諦。菩提薩婆訶。")
    }
   //停止按鈕
    @IBAction func stopBtn(_ sender: Any) {
        if synthesizer.isSpeaking{
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        }
    }
    
}
