// Author: Johnny Tran
// External API for Youtube Video Player: https://developers.google.com/youtube/iframe_api_reference

/* Functions listed (4): 
	- Loads Youtube API for start event
	- Plays video from button event
	- Automatically stops video in 9.7 seconds
	- Stops playing video
*/

/* Loads the IFrame Player API code asynchronously */
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

/* Creates an <iframe> (and YouTube player) after the API code downloads
   with custom video properties, ID, and events for functions to play and stop video */
var player;
function onYouTubeIframeAPIReady() {
	player = new YT.Player('vidPlayer', {
		height: '390',
		width: '640',
		videoId: 'dQw4w9WgXcQ',
		playerVars: {
			'playsinline': 1
		},
		events: {
			'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
		}
	});
	// console.log("Youtube video is ready");
}


/* object 'playButton' created from ID of associated button,
   then waits for 'click' event for anonymous function the plays video */
function onPlayerReady(event) {
	var playButton = document.getElementById("jokeButton");
	playButton.addEventListener("click", function () {
		try {
			player.playVideo();
		}
		catch(err) {
			console.log(err.message);
		}
		// console.log("Video has started playing");
	});
}

/* Checks if Youtube video state is playing, 
   then calls function to stop video after 9.7 seconds */
var done = false;
function onPlayerStateChange(event) {
	if (event.data == YT.PlayerState.PLAYING && !done) {
		setTimeout(stopVideo, 9700);
		done = true;
		// console.log("Video will end in 9.7 seconds");
	}
}

/* Calls the video player to end video */
function stopVideo() {
	player.stopVideo();
	// console.log("Video has stopped playing");
}