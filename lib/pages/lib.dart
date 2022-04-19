// Flutter
import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newpipeextractor_dart/extractors/playlist.dart';
import 'package:newpipeextractor_dart/extractors/videos.dart';
import 'package:newpipeextractor_dart/models/playlist.dart';
import 'package:newpipeextractor_dart/models/video.dart';
import 'package:newpipeextractor_dart/utils/url.dart';
import 'package:package_info/package_info.dart';
import 'package:songtube/internal/nativeMethods.dart';
import 'package:songtube/internal/systemUi.dart';

// Internal
import 'package:songtube/internal/updateChecker.dart';
import 'package:songtube/players/components/musicPlayer/collapsedPanel.dart';
import 'package:songtube/players/components/musicPlayer/expandedPanel.dart';
import 'package:songtube/players/components/youtubePlayer/collapsedPanel.dart';
import 'package:songtube/players/components/youtubePlayer/expandedPanel.dart';
import 'package:songtube/provider/configurationProvider.dart';
import 'package:songtube/provider/downloadsProvider.dart';
import 'package:songtube/provider/managerProvider.dart';
import 'package:songtube/provider/mediaProvider.dart';
import 'package:songtube/provider/preferencesProvider.dart';
import 'package:songtube/provider/videoPageProvider.dart';
import 'package:songtube/screens/downloads.dart';
import 'package:songtube/screens/home.dart';
import 'package:songtube/screens/music.dart';
import 'package:songtube/screens/library.dart';

// Packages
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:songtube/screens/subscriptions.dart';
import 'package:songtube/ui/components/fancyScaffold.dart';
import 'package:songtube/ui/components/navigationBar.dart';
import 'package:songtube/ui/components/styledBottomSheet.dart';
import 'package:songtube/ui/sheets/appUpdate.dart';
import 'package:songtube/ui/sheets/joinTelegram.dart';
import 'package:songtube/ui/dialogs/loadingDialog.dart';
import 'package:songtube/ui/sheets/disclaimer.dart';
import 'package:songtube/ui/sheets/downloadFix.dart';
import 'package:songtube/ui/internal/lifecycleEvents.dart';

class Lib extends StatefulWidget {
  @override
  _LibState createState() => _LibState();
}

class _LibState extends State<Lib> {

  // Current Screen Index
  int _screenIndex;

  // This Widget ScaffoldKey
  GlobalKey<ScaffoldState> _internalScaffoldKey;

  @override
  void initState() {
    super.initState();
    _screenIndex = 0;
    var keyboardVisibilityController = KeyboardVisibilityController();
    _internalScaffoldKey = GlobalKey<ScaffoldState>();
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment=false;
    keyboardVisibilityController.onChange.listen((bool visible) {
        if (visible == false) FocusScope.of(context).unfocus();
      }
    );
    NativeMethod.handleIntent().then((intent) async {
      if (intent != null) {
        _handleIntent(intent);
      }
    });
    WidgetsBinding.instance.addObserver(
      new LifecycleEventHandler(resumeCallBack: () async {
        setState(() {});
        PreferencesProvider prefs = Provider.of<PreferencesProvider>(context, listen: false);
        DownloadsProvider downloads = Provider.of<DownloadsProvider>(context, listen: false);
        if (downloads.downloadingList.isNotEmpty ||
          downloads.completedList.isNotEmpty
        ) {
          if (prefs.showJoinTelegramDialog && prefs.remindTelegramLater == false) {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
                )
              ),
              context: context,
              builder: (_) => Wrap(children: [
                JoinTelegramSheet()
              ])
            );
          }
        }
        String intent = await NativeMethod.handleIntent();
        if (intent == null) return;
        _handleIntent(intent);
        return;
      })
    );
    Provider.of<MediaProvider>(context, listen: false).loadSongList().then((value) {
      Provider.of<ConfigurationProvider>(context, listen: false).preferences.saveCachedSongs(value);
    });
    Provider.of<MediaProvider>(context, listen: false).loadVideoList();
    // Disclaimer
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ManagerProvider>(context, listen: false).internalScaffoldKey =
        this._internalScaffoldKey;
      _showSheets();
      _checkForUpdates();
    });
    AudioService.runningStream.listen((_) {
      setState(() {});
    });
    AudioService.currentMediaItemStream.listen 
      
    
  

   
       
       
       
     
      
  
    
        
      
       
    
       
     
      
         
         
         
        
           
             
        
  
 
 
 