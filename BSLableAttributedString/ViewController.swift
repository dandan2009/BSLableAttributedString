//
//  ViewController.swift
//  BSLableAttributedString
//
//  Created by shan on 2021/8/20.
//

import UIKit


/*参考:
 https://www.jianshu.com/p/9553fcbbaab1
 https://stackoverflow.com/questions/16362407/nsattributedstring-background-color-and-rounded-corners
 https://github.com/ibireme/YYText/issues/203
 https://github.com/zuolingfeng/LINFCoreText
 之前做项目时遇到一个问题：

     使用UITextView显示一段电影的简介，由于字数比较多，所以字体设置的很小，行间距和段间距也很小，一大段文字挤在一起看起来很别扭，想要把行间距调大，结果在XCode中查遍其所有属性才发现，UITextView居然没有调整行间距的接口，于是忍住不心里抱怨了一下下。

     但是问题还是要解决的，上网一查才发现，iOS不仅有富文本处理的功能，而且对于文字排版的处理能力那是相当的强大，看来我是孤陋寡闻了。
 http://doc.okbase.net/qianglong/archive/119421.html
 https://blog.csdn.net/mylizh/article/details/39024353
 https://www.shuzhiduo.com/A/obzbXOX05E/
 https://www.cnblogs.com/hello-Huashan/p/5173024.html
 https://www.cnblogs.com/hello-Huashan/p/5173023.html
 https://blog.csdn.net/WflytoC/article/details/50364728
 https://www.jianshu.com/p/9dc1a736d098
 https://github.com/ibireme/YYKit/issues/527
 https://github.com/ibireme/YYText/issues/62
 https://github.com/ibireme/YYKit/issues/236
 
 iOS富文本设置混合字符串（中英文）奇葩换行问题 https://www.jianshu.com/p/84e1a0784edc

 
 
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.lightGray
        
        let width: CGFloat = 200
        let height: CGFloat = 45
        let space: CGFloat = 10
        self.demo1(str: "Demo1-1 : 风中的雨风中的雨风中的雨风中的雨", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90, width: width, height: height))
        self.demo1(str: "Demo1-2 : 风中的雨风中的", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + height + space, width: width, height: height)) //这种情况前面的空格就没了
        self.demo1(str: "Demo1-3 : 风中的雨风ff1", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 2  , width: width, height: height)) //标签中间折断了
        
        self.demo2(str: "Demo2-1 : 风中的雨风中的雨风中的雨风中的雨", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 3, width: width, height: height))
        self.demo2(str: "Demo2-2 : 风中的雨风中", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 4, width: width, height: height))
        self.demo2(str: "Demo2-3 : 风中的雨风ff1", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 5  , width: width, height: height))
        
        self.demo3(str: "Demo3-1 : 风中的雨风中的雨风中的雨风中的雨", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 6, width: width, height: height))
        self.demo3(str: "Demo3-2 : 风中的雨风中", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 7, width: width, height: height))
        self.demo3(str: "Demo3-3 : 风中的雨风ff1", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 8, width: width, height: height))
        
        
        
        self.demo4(str: "Demo4-1 : 风中的雨风中的雨风中的雨风中的雨", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 9, width: width, height: height))
        self.demo4(str: "Demo4-2 : 风中的雨风中", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 10, width: width, height: height))
        self.demo4(str: "Demo4-3 : 风中的雨风ff1", frame: CGRect(x: (self.view.frame.size.width - width) / 2, y: 90 + (height + space) * 11, width: width, height: height))
    }
    
    
    func demo1(str:String, frame:CGRect) {
        let lab = BSLabel.init()
        lab.backgroundColor = UIColor.white
        
        lab.frame = frame
        lab.numberOfLines = 0
        
        let _privateTitleAttributedStrBackup = NSMutableAttributedString(string: str,
                                                                         attributes: [.foregroundColor: UIColor.init(hexString: "#F76B95") , .font: UIFont.systemFont(ofSize: 16)])
        //        lab.attributedText = ddf
        //添加标签
        do { // 方法1 缺点是 后面的标签也会换行
            let relationStr = "已关注"
            let relationAttributedStr = NSMutableAttributedString.init(string: relationStr)
            let textBorder = TextBorder.border(with: UIColor.init(hexString: "#F4F5F7"), cornerRadius: 2)
            textBorder.insets = UIEdgeInsets(top: -2, left: -3, bottom: -3, right: -3 )
            //                _mAttributedStr.bs_set(backgroundColor: UIColor.red, range: NSRange.init(location: 0, length: 2))

            relationAttributedStr.bs_font = UIFont.systemFont(ofSize: 12)
            relationAttributedStr.bs_color = UIColor.init(hexString: "#9B9B9B")
            relationAttributedStr.bs_set(textBackgroundBorder: textBorder, range: NSRange.init(location: 0, length: relationStr.length))
            //                relationAttributedStr.bs_set(baselineOffset: 14, range: NSRange.init(location: 0, length: relationStr.length))

            let _mAttributedStrOriginLength = _privateTitleAttributedStrBackup.string.length // 提前计算标题的长度
            _privateTitleAttributedStrBackup.append(relationAttributedStr) // 添加关系标签
            ////        privateTitleAttributedStr.remo
            _privateTitleAttributedStrBackup.bs_lineSpacing = 3
            _privateTitleAttributedStrBackup.bs_set(kern: 4, range: NSRange.init(location: _mAttributedStrOriginLength - 1, length: 1)) // 设置间距
            //                _mAttributedStr.bs_set(alignment: NSTextAlignment.center, range: NSRange.init(location: 0, length: _mAttributedStr.string.length))
            //                _mAttributedStr.bs_set(baselineInfo: <#T##CFDictionary?#>, range: <#T##NSRange#>)
            lab.attributedText = _privateTitleAttributedStrBackup
        }
        self.view .addSubview(lab)
    }
    
    func demo2(str:String, frame:CGRect) {
        let lab = BSLabel.init()
        lab.backgroundColor = UIColor.white
        
        lab.frame = frame
        lab.numberOfLines = 0
        
        let _privateTitleAttributedStrBackup = NSMutableAttributedString(string: str,
                                                                         attributes: [.foregroundColor: UIColor.init(hexString: "#B76B95") , .font: UIFont.systemFont(ofSize: 16)])
        //        lab.attributedText = ddf
        //添加标签
        do { //方法2 缺点是需要使用图片, 修改不方便
            
            //不能用 NSTextAttachment, BSLable 不支持
            //        let image1Attachment = NSTextAttachment()
            //        image1Attachment.image = UIImage(named: "mp_msg_yiguanzu")
            //        image1Attachment.bounds = CGRect.init(x:0, y: -3, width: 16, height: 16)
            //
            //        // wrap the attachment in its own attributed string so we can append it
            //        let image1String = NSAttributedString(attachment: image1Attachment)
            
            
            let attachment = UIImage.init(named: "mp_msg_yiguanzu")
            
            let  dd = NSMutableAttributedString.bs_attachmentString(with:attachment , contentMode:UIView.ContentMode.center, attachmentSize: CGSize(width: 44, height: 17), alignTo: UIFont.boldSystemFont(ofSize: 16), alignment: TextVerticalAlignment.center)
            
            let _mAttributedStrOriginLength = _privateTitleAttributedStrBackup.string.length // 提前计算标题的长度
            _privateTitleAttributedStrBackup.append(dd!)
            _privateTitleAttributedStrBackup.bs_lineSpacing = 3
            
            _privateTitleAttributedStrBackup.bs_set(kern: 4, range: NSRange.init(location: _mAttributedStrOriginLength - 1, length: 1)) // 设置间距
            //                        privateTitleAttributedStr = _privateTitleAttributedStrBackup
            //                        return
            
            lab.attributedText = _privateTitleAttributedStrBackup
        }
        self.view .addSubview(lab)
    }
    
    
    func demo3(str:String, frame:CGRect) {
        let lab = BSLabel.init()
        lab.backgroundColor = UIColor.white
        
        lab.frame = frame
        lab.numberOfLines = 0
        
        let _privateTitleAttributedStrBackup = NSMutableAttributedString(string: str,
                                                                         attributes: [.foregroundColor: UIColor.init(hexString: "#876B95") , .font: UIFont.systemFont(ofSize: 16)])
        //        lab.attributedText = ddf
        //添加标签
        do { // 方法3 缺点是需要在主线程调用 , 既然用了这个方法, 还不如用方法 4
            let relationStr = " 已关注 "
            let relationAttributedStr = NSMutableAttributedString.init(string: relationStr)
            let textBorder = TextBorder.border(with: UIColor.init(hexString: "#F4F5F7"), cornerRadius: 2)
            textBorder.insets = UIEdgeInsets(top: -3, left: 0, bottom: -3, right: 0 )//左右间距不能用这个设置, 用这个设置左间距的时候, 如果是开头就会不生效, 要用空格设置不会有这个问题,
            relationAttributedStr.bs_font = UIFont.systemFont(ofSize: 12)
            relationAttributedStr.bs_color = UIColor.init(hexString: "#9B9B9B")
            relationAttributedStr.bs_set(textBackgroundBorder: textBorder, range: NSRange.init(location: 0, length: relationStr.length))
            //relationAttributedStr.bs_set(baselineOffset: 14, range: NSRange.init(location: 0, length: relationStr.length)) //设置基线
            
            let labe = BSLabel.init()
            labe.attributedText = relationAttributedStr
            labe.sizeToFit()
            labe.frame.size.height = 17
            
            let  dd = NSMutableAttributedString.bs_attachmentString(with:labe , contentMode:UIView.ContentMode.center, attachmentSize: labe.frame.size, alignTo: UIFont.boldSystemFont(ofSize: 16), alignment: TextVerticalAlignment.center)
            
            let _mAttributedStrOriginLength = _privateTitleAttributedStrBackup.string.length // 提前计算标题的长度
            //            _privateTitleAttributedStrBackup.append(relationAttributedStr) // 添加关系标签
            
            _privateTitleAttributedStrBackup.append(dd!)
            
            ////        privateTitleAttributedStr.remo
            _privateTitleAttributedStrBackup.bs_lineSpacing = 3
            
            _privateTitleAttributedStrBackup.bs_set(kern: 4, range: NSRange.init(location: _mAttributedStrOriginLength - 1, length: 1)) // 设置间距
            
            
            //                _mAttributedStr.bs_set(alignment: NSTextAlignment.center, range: NSRange.init(location: 0, length: _mAttributedStr.string.length))
            //                _mAttributedStr.bs_set(baselineInfo: <#T##CFDictionary?#>, range: <#T##NSRange#>)
            
            
            
            lab.attributedText = _privateTitleAttributedStrBackup
        }
        self.view .addSubview(lab)
    }
    
    
    func demo4(str:String, frame:CGRect) {
        let lab = BSLabel.init()
        lab.backgroundColor = UIColor.white
        
        lab.frame = frame
        lab.numberOfLines = 0
        
        let _privateTitleAttributedStrBackup = NSMutableAttributedString(string: str,
                                                                         attributes: [.foregroundColor: UIColor.init(hexString: "#576B95") , .font: UIFont.systemFont(ofSize: 16)])
        //        lab.attributedText = ddf
        //添加标签
        do { // 方法4 缺点是需要在主线程调用
            let relationStr = "已关注"
            let paddingLR: CGFloat = 2.0
            let attachmentLab = UILabel.init()
            attachmentLab.textColor = UIColor.init(hexString: "#9B9B9B")
            attachmentLab.backgroundColor = UIColor.init(hexString: "#F4F5F7")
            attachmentLab.font = UIFont.systemFont(ofSize: 12)
            attachmentLab.text = relationStr
            attachmentLab.sizeToFit()
            attachmentLab.frame = CGRect(x: 0, y: 0, width: attachmentLab.frame.size.width + paddingLR * 2, height: 17)
            attachmentLab.textAlignment = NSTextAlignment.center
            attachmentLab.layer.cornerRadius = 2
            attachmentLab.layer.masksToBounds = true
            
            let  attachmentLabAttribute = NSMutableAttributedString.bs_attachmentString(with:attachmentLab , contentMode:UIView.ContentMode.center, attachmentSize: attachmentLab.frame.size, alignTo: UIFont.boldSystemFont(ofSize: 16), alignment: TextVerticalAlignment.center)
            
            let _mAttributedStrOriginLength = _privateTitleAttributedStrBackup.string.length // 提前计算标题的长度
            _privateTitleAttributedStrBackup.append(attachmentLabAttribute ?? NSAttributedString.init()) //添加关系标签

            _privateTitleAttributedStrBackup.bs_lineSpacing = 3
            
            _privateTitleAttributedStrBackup.bs_set(kern: 4, range: NSRange.init(location: _mAttributedStrOriginLength - 1, length: 1)) // 设置间距
            lab.attributedText = _privateTitleAttributedStrBackup
        }
        self.view .addSubview(lab)
    }

}

