import 'package:flutter/material.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:screenshot/screenshot.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailPage extends StatefulWidget {
  final String index;
  final String title;

  VideoDetailPage({Key key, this.index, this.title}) : super(key: key);

  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;
  ScreenshotController videoScreenshotController = ScreenshotController();

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
      initialVideoId: _ids[int.parse(widget.index)],
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
    return Screenshot(
      controller: videoScreenshotController,
      child: Scaffold(
        appBar: CustomAppBar(
          _playerState == PlayerState.unknown
              ? 'vodcasts'
              : _videoMetaData.title,
          screenshotController: videoScreenshotController,
        ),
        body: ListView(
          children: [
            _buildYoutubePlayer(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _previousButton,
                      _pausePlayButton,
                      _muteButton,
                      _fullScreenButton,
                      _nextButton,
                    ],
                  ),
                  _space,
                  _volumeController,
                  _space,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  YoutubePlayer _buildYoutubePlayer() {
    return YoutubePlayer(
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
      ],
      onReady: () => _isPlayerReady = true,
      onEnded: (data) =>
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]),
    );
  }

  Widget get _previousButton =>
      IconButton(
        icon: Icon(Icons.skip_previous),
        onPressed: _isPlayerReady
            ? () =>
            _controller.load(_ids[
            (_ids.indexOf(_controller.metadata.videoId) - 1) % _ids.length])
            : null,
      );

  Widget get _pausePlayButton =>
      IconButton(
        icon: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
        onPressed: _isPlayerReady
            ? () {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
          setState(() {});
        }
            : null,
      );

  Widget get _muteButton =>
      IconButton(
        icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
        onPressed: _isPlayerReady
            ? () {
          _muted ? _controller.unMute() : _controller.mute();
          setState(() {
            _muted = !_muted;
          });
        }
            : null,
      );

  Widget get _fullScreenButton =>
      FullScreenButton(
        controller: _controller,
        color: Theme
            .of(context)
            .primaryColor,
      );

  Widget get _nextButton =>
      IconButton(
        icon: Icon(Icons.skip_next),
        onPressed: _isPlayerReady
            ? () =>
            _controller.load(_ids[
            (_ids.indexOf(_controller.metadata.videoId) + 1) % _ids.length])
            : null,
      );

  IconButton _buildNextButton() {
    return IconButton(
      icon: Icon(Icons.skip_next),
      onPressed: _isPlayerReady
          ? () =>
          _controller.load(_ids[
          (_ids.indexOf(_controller.metadata.videoId) + 1) % _ids.length])
          : null,
    );
  }

  Widget get _volumeController =>
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
      );

  Widget get _space => SizedBox(height: 10);
}
