package backend;

import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.Assets;

class Paths
{
	inline static public function image(key:String):String
	{
		return 'assets/images/$key.png';
	}

	inline static public function music(key:String):String
	{
		return 'assets/music/$key.ogg';
	}

	inline static public function sound(key:String):String
	{
		return 'assets/sounds/$key.ogg';
	}

	inline static public function file(key:String):String
	{
		return Assets.getText('assets/$key');
	}

	inline static public function getSparrowAtlas(key:String):FlxAtlasFrames
	{
		return FlxAtlasFrames.fromSparrow(image(key), file('images/$key.xml'));
	}
}