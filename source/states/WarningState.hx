package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;

class WarningState extends FlxState {
    var warning:FlxSprite;

    override public function create():Void {
        super.create();

        FlxG.mouse.visible = false;
        
        warning = new FlxSprite();
        warning.loadGraphic(Paths.image('warning/warning'));
        warning.alpha = 0;
        add(warning);

        FlxTween.tween(warning, {alpha: 1}, 2.0); // i'm aware...
        
        FlxG.sound.cache(Paths.sound('whoosh'));
        FlxG.sound.cache(Paths.music('Menu'));
    }

    override public function update(elapsed:Float):Void {        
        if (FlxG.keys.justPressed.ENTER) {
            FlxTween.tween(warning, {alpha: 0}, 2.0, {onComplete: (twn:FlxTween) ->
                FlxG.switchState(new MenuState())});
        }

        super.update(elapsed);
    }
}