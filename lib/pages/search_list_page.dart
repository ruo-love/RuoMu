import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/api/song.dart';
import 'package:flutter_application_pc_1/components/global_audio_player.dart';
import 'package:flutter_application_pc_1/components/song_line.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/search_song_model.dart'
    as PACKAGE_SEARCH;
import 'package:flutter_application_pc_1/state_model/audio_player_model.dart';
import 'package:provider/provider.dart';

class SearchListPage extends StatefulWidget {
  const SearchListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchListPage> createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  TextEditingController _keyWord = TextEditingController();
  List<PACKAGE_SEARCH.Songs> _songList = <PACKAGE_SEARCH.Songs>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: AppColor.primary,
          boxShadow: [
            BoxShadow(
              color: AppColor.un3active,
              blurRadius: 25,
              offset: Offset(0, -10),
              spreadRadius: -15,
            ),
          ],
        ),
        height: 50,
        child: GlobalAudioPlayer(
          controlBack: () {
            Provider.of<AudioPlayerModel_Provider>(context, listen: false)
                .stop();
          },
          playing: context.select((AudioPlayerModel_Provider _) => _.playing_),
          name: context.select((AudioPlayerModel_Provider _) => _.name_),
          singer: context.select((AudioPlayerModel_Provider _) => _.singer_),
          pic: context.select((AudioPlayerModel_Provider _) => _.pic_),
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 0,
        elevation: 0,
        title: TextField(
          onSubmitted: (value) async {
            List<PACKAGE_SEARCH.Songs> res =
                await getSongsByKewords(keywords: value);
            setState(() {
              _songList = res;
            });
          },
          controller: _keyWord,
          style: TextStyle(color: AppColor.primary_deep3, fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.primary,
            suffixIcon: Icon(
              Icons.search_outlined,
              color: AppColor.primary_deep3,
              size: 24,
            ),
            //内边距设置
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary_deep3)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary_deep3)),
            labelText: '搜索歌曲',
            labelStyle: TextStyle(
              color: AppColor.un2active,
              fontSize: 12,
            ),
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ListView.builder(
          itemBuilder: (_, index) => SongLine(
            name: _songList[index].name!,
            singer: _songList[index].artists![0].name!,
            isPay: _songList[index].fee == 1 || _songList[index].fee == 8,
            onTap: () async {
              Provider.of<AudioPlayerModel_Provider>(context, listen: false)
                  .setUrl(
                id: _songList[index].id!,
                pic: _songList[index].artists![0].img1v1Url!,
                name: _songList[index].name!,
                singer: _songList[index].artists![0].name!,
              );
            },
          ),
          itemCount: _songList.length,
        ),
      ),
    );
  }
}
