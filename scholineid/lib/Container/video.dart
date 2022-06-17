import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoMateri extends StatefulWidget {
  String materi = "";
  String detail_materi = "";
  VideoMateri({Key? key, required this.materi, required this.detail_materi})
      : super(key: key);

  @override
  State<VideoMateri> createState() => _VideoMateriState();
}

class _VideoMateriState extends State<VideoMateri> {
  late YoutubePlayerController ytController;

  @override
  void initState() {
    super.initState();
    print(widget.detail_materi.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: (widget.detail_materi != "")
              ? FirebaseFirestore.instance
                  .collection('detail_materi')
                  .where('nama_materi',
                      isEqualTo: widget.detail_materi.toLowerCase())
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection('detail_materi')
                  .where('mata_pelajaran', isEqualTo: "mathematics")
                  .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                  return YoutubePlayer(
                    controller: ytController = YoutubePlayerController(
                      initialVideoId: qs['video_id'],
                      flags: YoutubePlayerFlags(
                          mute: false,
                          autoPlay: false,
                          disableDragSeek: true,
                          loop: false,
                          enableCaption: false),
                    ),
                    showVideoProgressIndicator: true,
                    bottomActions: <Widget>[
                      const SizedBox(width: 14.0),
                      CurrentPosition(),
                      const SizedBox(width: 8.0),
                      ProgressBar(isExpanded: true),
                      RemainingDuration(),
                    ],
                    aspectRatio: 16 / 9,
                    progressIndicatorColor: Colors.white,
                    onReady: () {
                      print('Player is ready.');
                    },
                  );
                });
          }),
    );
  }
}
