package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class WarningState extends FlxState {
    var warning:FlxSprite;

    override function create() {
        super.create();

        FlxG.mouse.visible = false;
        
        warning = new FlxSprite();
        warning.loadGraphic(Paths.image('warning/warning'));
        warning.alpha = 0;
        add(warning);

        FlxTween.tween(warning, {alpha: 1}, 2.0);

        FlxG.sound.load(Paths.sound('whoosh'));
        FlxG.sound.load(Paths.music('Menu'));
        
        new FlxTimer().start(5.0, (tmr:FlxTimer) -> {
            FlxTween.tween(warning, {alpha: 0}, 2.0, {onComplete: (twn:FlxTween) ->
                FlxG.switchState(new MenuState())});
        });
    }
}