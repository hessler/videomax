﻿/*  VIDEOMAX - CONTROL BAR  Version: 1.8 Date:    10/18/2010 AS Lang: 3.0  Author:  Anthony Hessler (Hessler Design) Web:     www.hesslerdesign.com Email:   anthony@hesslerdesign.com  VideoMax is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License. For more information about this license, visit: http://creativecommons.org/licenses/by-sa/3.0/*/package com.hd.videomax.assets {		import flash.display.Sprite;	import flash.events.MouseEvent;	import fl.motion.Color;		public class ControlBar extends Sprite {				// Public Properties		public var cb:Sprite = new Sprite();		public var playBtn:PlayButton;		public var pauseBtn:PauseButton;		public var statusBar:StatusBar;		public var muteBtn:MuteButton;		public var fullScreenBtn:FullScreenButton;		public var time:Time;				// Private Properties		private var cbHeight_num:Number = 30;		private var cbWidth_num:Number = 640;		private var bg:ControlBarBackground;		private var muteDivider:Divider;		private var fullScreenDivider:Divider;		private var cbHex:uint = 0x000000;		private var btnHex:uint = 0xffffff;		private var tintColor:Color = new Color();		private var fullScreenEnabled:Boolean = false;						public function ControlBar(pCbHex:uint=0x000000, pBtnHex:uint=0xffffff, pFullScreenEnabled:Boolean=false):void {			cbHex = pCbHex;			btnHex = pBtnHex;			fullScreenEnabled = pFullScreenEnabled;			init();		}								// --- Public: Tinting Functions --- //		public function tint(pCbHex:uint=0x000000, pBtnHex:uint=0xffffff):void {			tintColor.setTint(pCbHex, 1);			bg.transform.colorTransform = tintColor;			statusBar.tint(pCbHex, pBtnHex);			tintColor.setTint(pBtnHex, 1);			playBtn.transform.colorTransform = tintColor;			pauseBtn.transform.colorTransform = tintColor;			muteBtn.transform.colorTransform = tintColor;			time.transform.colorTransform = tintColor;			muteDivider.transform.colorTransform = tintColor;			if (fullScreenEnabled) {				fullScreenBtn.transform.colorTransform = tintColor;				fullScreenDivider.transform.colorTransform = tintColor;			}		}								// --- Public: Time Functions --- //		public function updateElapsed(pTime_num:Number):void {			time.updateElapsed(pTime_num);		}		public function updateDuration(pTime_num:Number):void {			time.updateDuration(pTime_num);		}								// --- Public: Visibility Functions --- //		public function showControls(pStatus_str:String):void {			playBtn.visible = pauseBtn.visible = false;			if (pStatus_str.indexOf("play") != -1) {				playBtn.visible = true;			} else if (pStatus_str.indexOf("pause") != -1) {				pauseBtn.visible = true;			}		}								// --- Public: Get/Set Functions --- //		public function getHeight():Number {			return cbHeight_num;		}		public function getWidth():Number {			return cbWidth_num;		}		public function setWidth(pSize_num:Number):void {			cbWidth_num = pSize_num;			bg.setWidth(pSize_num);			playBtn.x = pauseBtn.x = 0;			statusBar.x = playBtn.x + playBtn.width;			if (fullScreenEnabled) {				fullScreenBtn.x = pSize_num - fullScreenBtn.width;				fullScreenDivider.x = fullScreenBtn.x;				muteBtn.x = fullScreenBtn.x - muteBtn.width;				muteDivider.x = muteBtn.x;			} else {				muteBtn.x = pSize_num - muteBtn.width;				muteDivider.x = muteBtn.x;			}			time.x = muteDivider.x - time.width;		}								// --- Private: Initialization Functions --- //		private function init():void {			createBackground();			createPlayButton();			createPauseButton();			createStatusBar();			createMuteButton();			createMuteDivider();			if (fullScreenEnabled) {				createFullScreenButton();				createFullScreenDivider();			}			createTime();			setWidth(cbWidth_num);			setHeight(cbHeight_num);			showControls("play");			tint(cbHex);			addChild(cb);		}								// --- Private: Creation Functions --- //		private function createBackground():void {			bg = new ControlBarBackground();			cb.addChild(bg);		}		private function createPlayButton():void {			playBtn = new PlayButton();			playBtn.enable();			cb.addChild(playBtn);		}		private function createPauseButton():void {			pauseBtn = new PauseButton();			pauseBtn.enable();			cb.addChild(pauseBtn);		}		private function createStatusBar():void {			statusBar = new StatusBar();			cb.addChild(statusBar);		}		private function createMuteButton():void {			muteBtn = new MuteButton();			muteBtn.enable();			cb.addChild(muteBtn);		}		private function createMuteDivider():void {			muteDivider = new Divider();			cb.addChild(muteDivider);		}		private function createFullScreenButton():void {			fullScreenBtn = new FullScreenButton();			fullScreenBtn.enable();			cb.addChild(fullScreenBtn);		}		private function createFullScreenDivider():void {			fullScreenDivider = new Divider();			cb.addChild(fullScreenDivider);		}		private function createTime():void {			time = new Time();			cb.addChild(time);		}								// --- Private: Get/Set Functions --- //		private function setHeight(pSize_num:Number):void {			cbHeight_num = pSize_num;			bg.setHeight(pSize_num);			playBtn.setHeight(pSize_num);			pauseBtn.setHeight(pSize_num);			muteBtn.setHeight(pSize_num);			muteDivider.setHeight(pSize_num);			if (fullScreenEnabled) {				fullScreenBtn.setHeight(pSize_num);				fullScreenDivider.setHeight(pSize_num);			}		}	}}