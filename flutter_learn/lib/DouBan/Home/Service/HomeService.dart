import 'dart:io';
import 'package:flutter_learn/DouBan/Http/HttpRequest.dart';
import 'package:flutter_learn/DouBan/Http/HttpTool.dart';
import 'package:flutter_learn/DouBan/Home/Model/HomeModel.dart';

class HomeService {
  static Future<List<HomeModel>> requestHomeList() async {
    HttpRequest req = HttpRequest();
    req.url = '/enduser/home/';
    req.type = HttpType.kGet;
    req.params = {'app_id': '0b4c4e80f73f11e7804bfa163e431402'};
    print('发起了请求');
    HttpTool().sendRequest(req, (data) {}, (error) {});
    print('整点假数据返回呗');

    List<Map<String, dynamic>> datas = [];
    List<String> actors = [
      '达纳·福克斯',
      '托尼·麦克纳马拉',
      '艾莲·布洛什·麦肯纳',
      '凯莉·马塞尔',
      '史蒂夫·齐西斯',
      '道迪·史密斯',
      '艾玛·斯通',
      '约翰·麦克雷',
      '艾玛·汤普森',
      '乔尔·弗莱'
    ];
    List<String> types = [
      '喜剧 历史',
      '冒险 武侠',
      '爱情 战争',
      '恐怖 悬疑',
      '科幻 恐怖 惊悚',
      '悬疑 音乐 灾难',
      '战争 喜剧',
      '历史 冒险',
      '音乐 科幻',
      '武侠 爱情'
    ];
    List<String> names = [
      '当男人恋爱时',
      '黑白魔女库伊拉',
      '招魂3',
      '切尔诺贝利',
      '孤味',
      '追虎擒龙',
      '扫黑决战',
      '哥斯拉大战金刚',
      '潜艇总动员',
      '皮诺曹'
    ];
    List<String> times = [
      '2021',
      '2021',
      '2021',
      '1908',
      '2010',
      '2019',
      '2018',
      '2021',
      '2020',
      '2020'
    ];
    List<String> originalTitles = [
      'Man in Love',
      'Cruella devil',
      'The Conjuring: The Devil Made Me Do It ',
      'Чернобыль ',
      'Little Big Women ',
      'Once Upon a Time in Hong Kong',
      'Break Through the Darkness',
      'King Kong vs. Godzilla ',
      '潜艇总动员',
      'Pinocchio'
    ];
    for (var i = 1; i <= 30; i++) {
      Map<String, dynamic> data = {
        'rank': i,
        'imageName': '$i',
        'title': names[i%10],
        'playDate': '(${times[i%10]})',
        'rating': i * 0.5 + 5,
        'originalTitle': originalTitles[i%10],
        'type': types[i%10],
        'actor': '帕特里克·威尔森 / 维拉·法米加 / 卢瑞·奥康纳 / 莎拉·凯瑟琳·霍克 / 朱利安·希威德',
        'director': actors[i % 10]
      };
      datas.add(data);
    }
    List<HomeModel> responseDatas = [];
    for (Map<String, dynamic> i in datas) {
      HomeModel model = HomeModel.fromJson(i);
      model.imageURL = (int.parse(model.imageURL) % 10).toString();
      model.rating = model.rating % 10 + 0.5;
      responseDatas.add(model);
    }

    //await sleep(Duration(seconds: 3));
    return responseDatas;
  }
}
