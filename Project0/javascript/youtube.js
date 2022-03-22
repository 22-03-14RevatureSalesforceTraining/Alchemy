 //Youtube API
 //This code loads the IFrame Player API code asynchronously.
 var tag = document.createElement('script');

 tag.src = "https://www.youtube.com/iframe_api";

 var firstScriptTag = document.getElementsByTagName('script')[0];
 firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


 var player;

 //determines the width and height of the video, video ID
 function onYouTubeIframeAPIReady() {
     player = new YT.Player('catVideo', {
         height: '390',
         width: '640',
         videoId: 'bqCrA_xS9ds',
         playerVars: {
             'playsinline': 1
         },
         events: {
             'onReady': onPlayerReady,

         }
     });
 }

 //try catch the video to make sure it's there
 try {
     onYouTubeIframeAPIReady();
 } catch (e) {
     console.log(e);
 }

 //The API will call this function when the video player is ready.
 function onPlayerReady(event) {
     event.target.playVideo();
 }

 //When the video is stopped by the player
 function stopVideo() {
     player.stopVideo();
 }