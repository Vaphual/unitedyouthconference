//
//  Speakers.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import Foundation
import UIKit

class Speakers {
     let speakersImage = [#imageLiteral(resourceName: "Ps. Mung Tawng"),#imageLiteral(resourceName: "syama maw"),#imageLiteral(resourceName: "Ps. Kyaw kyaw"),#imageLiteral(resourceName: "Ps. Val Te"),#imageLiteral(resourceName: "Ps. Susana Min"),#imageLiteral(resourceName: "Ps. Honpi")]
    
    let speakersName_eng = ["Pastor Mung Tawng",
                            "Pastor Khin San Maw",
                            "Pastor Kyaw Kyaw",
                            "Pastor Van Te",
                            "Pastor Susana Min",
                            "Pastor Honpi"]
    
    let speakersTitle_eng = ["Senior Pastor\nFull Gospel Assembly\nYangon, Myanmar",
                         "Senior Pastor\nMyanmar Worship Center\nTulsa, USA",
                         "Mission Director\nFull Gospel Assembly\nYangon, Myanmar",
                         "Pastor Val Te\nFull Gospel Assembly\nTulsa, USA",
                         "Pastor Susanar Min\nYangon City Church\nYangon, Myanmar",
                         "Pastor Honpi\nMyanmar Worship Center\nTulsa, USA"]
    
    let speakersBio_eng = ["""
ဆရာႀကီးသည္ 1977 ခုႏွစ္မွစ၍ဘုရားအမွုေတာ္အတြက္ေျခစုံပစ္ပါ၀င္ဆက္ကပ္လၽွက္ယေန႔တိုင္ေအာင္အမွုေတာ္ျမတ္တြင္သစၥာရွိစြာပါ၀င္လုပ္ေဆာင္ေနဆဲျဖစ္ပါသည္။  Full Gospel Assembly(Myanmar) ႏွင့္ Full Gospel International Ministries(Tulsa, OK)တို႔၏ Senior Pastor ျဖစ္ၿပီး Full Gospel Bible Training Center(Myanmar) ကိုစတင္တည္ေထာင္သူေက်ာင္းအုပ္လည္းျဖစ္သည္။ ထိုေက်ာင္းမွအမွုေတာင္ေဆာင္မ်ားကို ေမြးထုတ္လၽွက္ ျမန္မာနိုင္ငံအႏွံ့တြင္သာသနာျပဳအသင္းေတာ္ ၄၀ ေက်ာ္ကိုေစလႊတ္ထားပါသည္။
ဤေက်ာက္ေပၚတြင္ ငါ့အသင္းကိုငါတည္ေဆက္မည္။ မရဏာနိုင္ငံတို႔၏တံခါးတို႔သည္မနိုင္ရာ။(မႆဲ ၁၆း၁၈) ႏွင့္ ဗိုလ္ေျခအားျဖင့္မဟုတ္၊ တန္ခိုးအာဏာအားျဖင့္မဟုတ္၊ ငါ့ဝိညာဥ္အားျဖင့္ျဖစ္ရလိမ့္မည္။(ဇာခရိ ၄:၆)တို႔သည္ဆရာႀကီးလက္ကိုင္စြဲေသာက်မ္းခ်က္မ်ားျဖစ္သည့္အတိုင္းဝိညာဥ္ေတာ္တန္ခိုးကိုအမွီျပဳကာခရစ္ေတာ္တည္းဟူေသာ ေက်ာက္ေပၚမွာအသင္းေတာ္မ်ားကိုတည္ေဆာက္လၽွက္ ျမန္မာျပည္သည္ေယရွုကိုသိေသာတိုင္းနိုင္ႀကီးျဖစ္လာေစမည္ဟူေသာ ရွုပါ႐ုံျဖင့္ဆက္လက္ခ်ီတက္ေနပါသည္။
""",
                           """
1992 မွယေန႔ကလတိုင္ေအာင္ဘုရားအမွုေတာ္တြင္ပါ၀င္ေနသူျဖစ္သည္။ ပါ၀င္ခဲ့ေသာအမွုေတာ္လုပ္ငန္းမ်ား မွာ Full Gospel Assembly/Full Gospel Bible Training Center တြင္ အမွုေတာ္ေဆာင္, Bible teacher, Kepong Myanmar Christian Fellowship&Full Gospel Worship Center(Malaysia) တြင္ Pastor အျဖစ္ပါ၀င္ခဲ့ၿပီးယခုအခ်ိန္တြင္ Myanmar Worship Center(Tulsa, OK) တြင္ Lead pastor အေနႏွင့္အမွုေတာ္ေဆာင္လၽွက္ရွိသည္။ သမၼာတရားတြင္စိတ္အားႀကီးၿပီး ယုံၾကည္သူတို႔သည္ခ်ိန္ခြင္ညီမၽွေသာသမၼာတရားတြင္ ေလၽွာက္လွမ္းလၽွက္ခရစ္ေတာ္၌ႀကီးထြားရင့္က်က္လိုေသာ အသက္တာမ်ားအားျဖင့္ ဘုရားဘုန္းထင္ရွာေစရန္မိမိအသက္တာကို ဆက္ကပ္အပ္ႏွံထားသူျဖစ္သည္။ ခင္ပြန္းသည္ သားသမီး ၃ ေယာက္ႏွင့္အတူ Tulsa, OK တြင္ေနထိုင္လၽွက္ရွိသည္။
""",
                           """
Rev. Kyaw Kyaw သည္ဘုရားသခင္၏ေခၚျခင္းႏွင့္အတူ ၁၉၉၅ ခုႏွစ္မွယခုကာလထိတိုင္ေအာင္ Full Gospel Assembly(Yangon, Myanmar) တြင္ဧဝံေဂလိဒါရိုက္တာအျဖစ္ဦးေဆာင္ပါ၀င္ေနသူတစ္ဦးျဖစ္သည္။ ေပ်ာက္ဆုံးေသာဝိညာဥ္မ်ားစြာကို နိုင္ငံေတာ္သို႔ပို႔ေဆာင္လၽွက္ ဝိညာဥ္ေတာ္ဘုရား၏လမ္းျပမွုကို နာခံလမ္းေလၽွာက္ကာ ဝိညာဥ္ဆုေက်းဇူးမ်ားအားျဖင့္ ဘုရားဘိသိတ္အသုံးျပဳခံရေသာသူျဖစ္သည္။
ေက်းဇူးေတာ္မွတစ္ပါး အျခားေသာမဂၤလာကၽြႏု္ပ္၌မရွိပါ ဟူေသာႏွုတ္ကပတ္ေတာ္ကို စြဲကိုင္ၿပီးဇနီး သားတစ္ေယာက္ႏွင့္အတူ လက္တြဲညီစြာအမွုေတာ္ေဆာင္လၽွက္ရွိပါသည္။
""",
                           """
1994 မွစ၍ယခုခ်ိန္ထိတိုင္ေအာင္အမွုေတာ္အတြက္ စိတ္အားႀကီးစြာပါ၀င္လုပ္ေဆာင္ေနသူျဖစ္သည္။ Full Gospel Assembly & Full Gospel Bible Training Center တြင္ Interpreter/teacher, World bible Translation Center တြင္ Bible translator, God’s Trio Partner for Mission  တြင္ National Coordinator အမွုေတာ္ထမ္းေဆာင္ခဲၿပီး ယခုလက္ရွိအခ်ိန္တြင္ Oral Roberts University တြင္ Doctor of Education (Ed.D) ပညာကိုဆည္းပူးလၽွက္ Full Gospel Assembly International Ministry(Tulsa OK) တြင္အခ်ိန္ပိုင္း အမွုေတာ္ေဆာင္အျဖစ္ ပါ၀င္လၽွက္ရွိပါသည္။
ခင္ပြန္းသည္၊ သားသမီး(၃)ဦးႏွင့္အတူေနထိုင္လၽွက္ ဘုရားသခင္၏ျပည့္စုံေသာ အလိုေတာ္မိမိအသက္တာတြင္ ျပည့္စုံေစရန္ (to fulfill God’s perfect will for my life) ဟုစိတ္ျပဌါန္းလၽွက္ဆက္ကပ္လုပ္ေဆာင္ေန သူတစ္ဦးျဖစ္သည္။
""",
                           """
Pastor. Susanna Min သည္အသက္ ၁၄ ႏွစ္အရြယ္မွစ Children Teacher အျဖစ္ပါ၀င္ဆက္ကပ္ခဲ့ၿပီး အသက္(၂၀)တြင္ Tungling Bible College, Singapore တြင္ဓမၼပညာဆည္းပူးခဲ့သည္။ ၁၉၉၈ မွစတင္ကာ Cornerstone Myanmar အသင္းေတာ္ကို Singapore တြင္စတင္ခဲ့သည္။
ခင္ပြန္းျဖစ္သူ Rev. ေစာသီဟႏွင့္အတူ Rev. Susanna Min တို႔သည္ Cornerstone Community Church ၏  Senior Pastors မ်ားျဖစ္ၾကပီး Kingdom Family Ministry(KFM) ကိုစတင္ၿပီး အမွုေတာ္ေဆာင္လၽွက္ ရွိၾကသည္။ Cornerstone  ႏွင့္ The City Yangon အသင္းေတာ္မ်ားသည္ KFM တြင္ပါ၀င္သည့္အသင္းေတာ္ မ်ားျဖစ္သည္။
ရန္ကုန္ၿမိဳ႕တြင္ ခင္ပြန္း၊ သားသမီး ၃ ေယာက္ႏွင့္တကြ ေနထိုင္လၽွက္ ျမန္မာျပည္ႏွင့္ နိုင္ငံတကာရွိအသင္းေတာ္မ်ားသို႔ သြားေရာက္အမွုေတာ္ေဆာင္လၽွက္ရွိသကဲ့သို႔ Worship Album, တရားေဟာေခြမ်ား၊ စာအုပ္ႏွင့္ မီဒီယာက႑မ်ားမွတစ္ဆင့္လည္း အမွုေတာ္ေဆာင္လၽွက္ရွိပါသည္။
‘ကိုးကြယ္ျခင္းဆိုတာ စင္ေပၚမွာလြင့္ပ်ံ႕ေနတဲ့ အသံေတြေနာက္ကြယ္က ေန႔စဥ္အသက္ရွင္ျခင္းထဲကို စီးထြက္လာတဲ့ႏွလုံးသားအတြင္းရပ္မွ ခ်ီးမြမ္းသံစဥ္မ်ားျဖစ္ပါတယ္’
""",
                           """
2005-2009 ထိ ဓမၼပညာကို Evangelical Bible College, Myanmar တြင္ သင္ယူခဲ့ၿပီး B.Th ဘြဲ႕ကို ရရွိခဲ့သည္။ လူငယ္မ်ားအတြက္ ဝန္တာရွိေသာသူတစ္ဦးျဖစ္သည့္အေလၽွာက္ 2009-2011 အထိ Youth Center, Myalaysia တြင္လူငယ္ေခါင္းေဆာင္အျဖစ္ ထိေရာက္စြာပါ၀င္ဦးေဆာင္ခဲ့သည္။ ယခုအခ်ိန္တြင္ ဇနီး၊ သမီးႏွစ္ဦးႏွင့္အတူ Tulsa, OK တြင္ေနထိုင္လၽွက္ Myanmar Worship Center တြင္ Youth&Assistant pastor အျဖစ္အမွုေတာ္ျမတ္တြင္ပါ၀င္လၽွက္ရွိသည္။
"""]
}


