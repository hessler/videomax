# VideoMax

A very lightweight, fast, flexible, and easy-to-implement custom Flash video player class.

### Features

VideoMax is a very lightweight, fast, flexible, and easy-to-implement custom Flash video player class that can be used in any ActionScript 3.0 file. It currently supports FLV and F4V file formats. Some of the key highlights of the VideoMax class are:
		
- **Lightweight:** Importing and creating a VideoMax instance adds only 12kb to overall file weight. Compare that to the built-in Adobe `flvPlayback` component, which adds 58kb to the overall file weight. Do the math. That's nearly 500% heavier than this VideoMax class.
- **Easy to Use:** With just 3 lines of code, you can import the VideoMax class, create an instance of the player, and add it to your Flash file. And because of its dynamically-built nature, there are NO Library components needed. That's right, NONE. All of the assets included in the VideoMax class are 100% built from scratch with nothing but ActionScript 3.0 code.
- **Customizable:** You can change a number of attributes to your VideoMax instances, so you can have a video player that is as unique as the video it plays. The customizable attributes include Width, Height, Auto Load, Auto Play, Auto Rewind, Auto Size, Buffer, Looping, Control Bar visibility, Tint, Play Button overlay, End Frame visibility, and onStart/onComplete listeners.
- **Communicative:** By using the `onStart` and `onComplete` listener attributes (and accompanying parameter attributes), you can have VideoMax dispatch events that call functions back in the parent file when the video starts and/or ends.
- **Self-Sufficient:** With its robust set of default attributes, VideoMax takes care of wrapping up all of the loose ends. Once you create your VideoMax instance, you can sit back and relax, knowing that everything is taken care of, including control bar resizing and positioning, buffering, automatic video resizing within the player, and more. Just import the class, create the instance, assign it attributes, and add it to your file. VideoMax will take care of the rest for you.

### Demo Files

Included with the VideoMax class is a demo FLA source file and exported SWF file, and accompanying FLV video file that the FLA uses. Feel free to open the FLA source file and tinker around with setting various attributes of the VideoMax class. It's there for your convenience and learning. Enjoy!

### Instructions

To use VideoMax in your Flash project, you must import the VideoMax class into your file, create a new instance, and add it to the display list.
 	
Setting VideoMax attributes can be done in two different ways, as seen in the two examples outlined below.

1. Setting Object Attributes on Creation (RECOMMENDED):
```
import com.hd.VideoMax;
var vm = new VideoMax({width:640, height:480, tint:[0x1c1c1c, 0xffffff], source:"sample.flv"});
addChild(vm);
```
2. Setting Individual Attributes After Creation:
```
import com.hd.VideoMax;
var vm = new VideoMax();
vm.setSize(640, 480);
vm.setTint(0x1c1c1c, 0xffffff);
vm.autoLoad = true;   // OR vm.setAutoLoad(true);
vm.autoPlay = true;   // OR vm.setAutoPlay(true);
vm.autoRewind = true; // OR vm.setAutoRewind(true);
vm.autoSize = true;   // OR vm.setAutoSize(true);
vm.buffer = 10;       // OR vm.setBuffer(10);
vm.loop = true;       // OR vm.setLoop(true);
vm.playOverlay = true;
vm.showControls = true;
vm.showMiniStatus = true;
vm.showFirstFrame = false;
vm.showLastFrame = false;
vm.showEndFrames = false;
vm.source = "sample.flv";
vm.play();
addChild(vm);
```

**NOTE:** In Example 2, `mp.play()` needs to be called AFTER setting the attributes, even if the `autoPlay` attribute is set to true. This is because the `autoPlay` attribute's default value is set to `false`. So when the VideoMax object is set, it will NOT play the video until instructed. Also, since you are setting attributes after creating the VideoMax instance, the attributes need to be recalculated, which happens when the `play()` function is called. Lastly, if using Example 2, you do not have the ability to add `onStart` and `onComplete` commands, along with their accompanying parameters, unless you pass them as part of the attributes when creating the VideoMax instance.

### Parameters

VideoMax only takes 1 parameter, an Object, which is optional. This Object contains the specific (and optional) attributes to set in the VideoMax instance. The available attributes are:
				
- **autoLoad** _(Boolean)_: If true, video will start loading upon instantiation. If false, video will not begin to load until `play()` is called. This value will be overwritten by a true value for `autoPlay`. (Default = true)
- **autoPlay** _(Boolean)_: If true, will auto play the video. (Default = false)
- **autoRewind** _(Boolean)_: If true, will seek to the video start when the video is done. (Default = true)
- **autoSize** _(Boolean)_: If true, will automatically and proportionally scale the video inside the player. (Default = true)
- **buffer** _(Number)_: Number of seconds of buffer needed before the video plays. (Default = 3)
- **loop** _(Boolean)_: If true, video will auto-rewind (despite the `autoRewind` setting) and continue to loop playback. (Default = false)
- **showControls** _(Boolean)_: If true, control bar is visible and active. (Default = true)
- **showMiniStatus** _(Boolean)_: If true, mini status bar is visible when the control bar animates out. (Default = true)
- **source** _(String)_: The path to the video that you want to play. (Default = null)
- **tint** _(Array of uint)_: Array containing optional uint hex codes to tint (1) the control bar background elements, and (2) the control bar buttons and text elements. (Default = [0x000000, 0xffffff])
- **height** _(Number)_: The height of the VideoMax instance. (Default = 480)
- **width ** _(Number)_: The width of the VideoMax instance. (Default = 640)
- **playOverlay** _(Boolean)_: If true, shows large Play button overlay over video when not playing. (Default = false)
- **showFirstFrame** _(Boolean)_: If false, and `autoPlay` is false, hides video's first frame. (Default = true)
- **showLastFrame** _(Boolean)_: If false, and `autoRewind` is false, hides video's last frame. (Default = true)
- **showEndFrames** _(Boolean)_: If false, and `autoPlay` and `autoRewind` are false, hides video's first and last frames. Cancels out `showFirstFrame` and `showLastFrame` values, if set differently. (Default = true)
- **onComplete** _(Function)_: Function in parent file to be called when video completes. (Default = null)
- **onCompleteParams** _(Array)_: Array to pass in to `onComplete` function in parent file. (Default = null)
- **onStart** _(Function)_: Function in parent file to be called when video starts. (Default = null)
- **onStartParams** _(Array)_: Array to pass in to `onStart` function in parent file. (Default = null)
- **enableFullScreen** _(Boolean)_: If set to true, will include 'full screen' button in control bar, and add stage resize listeners. Note that if this is set to true, the `allowFullScreen` parameter in your HTML embed code MUST be set to true to properly work. Also, a very important note for full screen is that if it's set to true, the VideoMax object should be the ONLY object on your stage, as it will auto-resize to the dimensions of the stage.

### Public Methods

With VideoMax, you can call a number of public methods from the parent file. These methods are outlined below.
	
- **play():** Resets the buffer, and reloads the video from the source location. Use when updating buffer length, or changing the source location for your video.
- **resume():** Resumes playback from the current playhead location. Use when the video has been paused or stopped, as it will NOT completely reload the video like the `play()` method does. 
- **pause():** Pauses playback.
- **stop():** Stops playback and returns the playhead to the beginning of the video. Since there is no built-in stop button in the Control Bar, use this method for stopping and resetting the video to the start.
- **reset():** Stops playback, resets source to null, and hides video.
- **mute(Boolean):** Mutes/Unmutes sound, based on the passed Boolean value into the function. A `true` value mutes sound. A `false` value unmutes sound.
- **getElapsed():** Returns the elapsed time as a Number.
- **getDuration():** Returns the duration of the video as a Number.
- **setSize(width, height):** Sets video width and height, which are passed in as parameters. Passed width and height need to be typed as Numbers. (Default = 640, 480)
- **setAutoLoad(Boolean):** If true, video will start loading upon instantiation. If false, video will not begin to load until `play()` is called. This value will be overwritten by a true value for `autoPlay`. (Default = true)
- **setAutoPlay(Boolean):** If true, sets video to auto play. (Default = false)
- **setAutoRewind(Boolean):** If true, video seeks to the start when the video is done. (Default = true)
- **setAutoSize(Boolean):** If true, video will automatically and proportionally scale the video inside the player. (Default = true)
- **setLoop(Boolean):** If true, video will auto-rewind (despite the `autoRewind` setting) and continue to loop playback. (Default = false)
- **setTint(cbHex,btnHex):** Sets Control Bar tint. Passed parameters are uint values for (1) background elements, and (2) button and text elements. (Default = 0x000000, 0xffffff)
- **setVolume(Number):** Sets volume level. A setting of 0 is mute, and 1 is 100%. This value can be more than 1, though audio quality may suffer. (Default = 1)
- **setBuffer(Number):** Sets the number of seconds of buffer needed before the video plays. (Default = 3)
- **showVideo(Boolean):** Shows/Hides video inside of player. (Default = true)
- **showControlBar(Boolean):** Shows/Hides control bar inside of player. (Default = true)
- **showMiniStatusBar(Boolean):** Shows/Hides mini status bar that shows when control bar is not visible. (Default = true)

### License

VideoMax is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License. For more information about this license, visit: http://creativecommons.org/licenses/by-sa/3.0/
