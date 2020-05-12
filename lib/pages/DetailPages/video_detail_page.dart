import 'package:flutter/material.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:sized_context/sized_context.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//import 'video_list.dart';

class VideoDetailPage extends StatefulWidget {
  final String url;
  final String title;

  VideoDetailPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'Z493ISdXHtk',
    'XOfZQyb9kYI',
    'Ib0HC3kzBRc',
    '_2Pjr9hYyvs',
    't_s-JOYfNH8',
    'xbj4idaZL54',
    'CJp2x7RJjK4',
    'NTDlXAyPXJc',
    'OJBwuP1toNU',
    'EXCuhK6Jqsc',
    'n2keUi1DmK4',
    'XEeFeIzwyKY',
    'PWizFTYyKqQ',
    'ZXN-N_BNZhE',
    'B89uJCNEPHk',
    '054JkQq4zyI',
    'hagPHeoQSVk',
    'YQMAbD2ITz4',
    'LfU4cMWM6HY',
    '8y-zP21wVJY',
    'VpDFXaf7WFo',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids[int.parse(widget.url)],
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )
      ..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = context.isLandscape;
    print("url + " + widget.url);
    print("title + " + widget.title);
    //print("substring " + _controller.metadata.title.substring(0,9));
    var youtubePlayer = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,

      topActions: <Widget>[
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            _controller.metadata.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        /*IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {
                  _showSnackBar('Settings Tapped!');
                },
              ),*/
      ],
      onReady: () {
        _isPlayerReady = true;
      },
      onEnded: (data) {
        _controller.load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
        // _showSnackBar('Next Video Started!');
      },
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        //_playerState?_controller.metadata.title.substring(0,9):widget.title,
        _playerState == PlayerState.unknown ? 'vodcasts' : _videoMetaData.title,
      ),
      body: ListView(
        children: [
          youtubePlayer,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _space,
                /*_text(
                  'Title',
                  _videoMetaData.title,
                ),*/
                //_space,
                //_text('Channel', _videoMetaData.author),
                //_space,
                //_text('Video Id', _videoMetaData.videoId),
                //_space,
                /*Row(
                  children: [
                    _text(
                      'Playback Quality',
                      _controller.value.playbackQuality,
                    ),
                    Spacer(),
                    _text(
                      'Playback Rate',
                      '${_controller.value.playbackRate}x  ',
                    ),
                  ],
                ),*/
                //_space,
                /*TextField(
                  enabled: _isPlayerReady,
                  controller: _idController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter youtube \<video id\> or \<link\>',
                    fillColor: Colors.blueAccent.withAlpha(20),
                    filled: true,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.blueAccent,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _idController.clear(),
                    ),
                  ),
                ),
                _space,*/
                /*Row(
                  children: [
                    _loadCueButton('LOAD'),
                    SizedBox(width: 10.0),
                    _loadCueButton('CUE'),
                  ],
                ),
                _space,*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      onPressed: _isPlayerReady
                          ? () =>
                          _controller.load(_ids[(_ids.indexOf(
                              _controller.metadata.videoId) -
                              1) %
                              _ids.length])
                          : null,
                    ),
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: _isPlayerReady
                          ? () {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                        setState(() {});
                      }
                          : null,
                    ),
                    IconButton(
                      icon: Icon(
                          _muted ? Icons.volume_off : Icons.volume_up),
                      onPressed: _isPlayerReady
                          ? () {
                        _muted
                            ? _controller.unMute()
                            : _controller.mute();
                        setState(() {
                          _muted = !_muted;
                        });
                      }
                          : null,
                    ),
                    FullScreenButton(
                      controller: _controller,
                      color: Theme
                          .of(context)
                          .primaryColor, //Colors.blueAccent,
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next),
                      onPressed: _isPlayerReady
                          ? () =>
                          _controller.load(_ids[(_ids.indexOf(
                              _controller.metadata.videoId) +
                              1) %
                              _ids.length])
                          : null,
                    ),
                  ],
                ),
                _space,
                Row(
                  children: <Widget>[
                    Text(
                      "Volume",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: Theme
                            .of(context)
                            .primaryColor,
                        inactiveColor: Colors.transparent,
                        value: _volume,
                        min: 0.0,
                        max: 100.0,
                        divisions: 100,
                        //label: '${(_volume).round()}',
                        onChanged: _isPlayerReady
                            ? (value) {
                          setState(() {
                            _volume = value;
                          });
                          _controller.setVolume(_volume.round());
                        }
                            : null,
                      ),
                    ),
                  ],
                ),
                _space,
                /*AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: _getStateColor(_playerState),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    _playerState.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value ?? '',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700];
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900];
      default:
        return Colors.blue;
    }
  }

  Widget get _space => SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
          if (_idController.text.isNotEmpty) {
            var id = YoutubePlayer.convertUrlToId(
              _idController.text,
            );
            if (action == 'LOAD') _controller.load(id);
            if (action == 'CUE') _controller.cue(id);
            FocusScope.of(context).requestFocus(FocusNode());
          } else {
            _showSnackBar('Source can\'t be empty!');
          }
        }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
