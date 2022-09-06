import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/api/song.dart';
import 'package:flutter_application_pc_1/mode/song_url_model.dart';

import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerModel_Provider with ChangeNotifier, DiagnosticableTreeMixin {
  AudioPlayer audioPlayer_ = AudioPlayer();

  String url_ = '';
  String pic_ = '';
  String name_ = '';
  int id_ = 0;
  String singer_ = '';
  bool playing_ = false;
  late StreamSubscription<PlayerState> _audioPlayerStateSubscription;
  /////----------get
  // get audioPlayer => _audioPlayer;
  // get pic => _pic;
  // get name => _name;
  // get singer => _singer;
  /////----------set
  Future setUrl(
      {required int id,
      required String name,
      required String pic,
      required String singer}) async {
    SongUrl res = await getSongUrl(id);
    if (res.data![0].url == null) {
      print('无版权');
      return false;
    }

    id_ = id;
    pic_ = pic;
    name_ = name;
    singer_ = singer;

    url_ = res.data![0].url!;
    print('------------------------------1');
    print(url_);
    await audioPlayer_.setSourceUrl(url_);
    print('------------------------------2');
    // audioPlayer_.onPlayerStateChanged.listen((PlayerState s) => {
    //       if (s == PlayerState.playing)
    //         {
    //           playing_ = true,
    //         }
    //       else
    //         {
    //           playing_ = false,
    //         },
    //     });
    _audioPlayerStateSubscription =
        audioPlayer_.onPlayerStateChanged.listen((s) {
      if (s == PlayerState.playing) {
        playing_ = true;
      } else {
        playing_ = false;
      }
    }, onError: (msg) {
      print(msg);
    });

    await audioPlayer_.resume();
    print('------------------------------3');
    notifyListeners();
  }

  stop() {
    if (playing_) {
      audioPlayer_.pause();
      playing_ = false;
    } else {
      audioPlayer_.resume();
      playing_ = true;
    }

    notifyListeners();
  }

  close() {
    audioPlayer_.pause();
    _audioPlayerStateSubscription.cancel();
  }
}
