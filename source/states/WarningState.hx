package states;

import flixel.FlxG;
import flixel.FlxSprite;

class WarningState extends TransitionState {
    var warning:FlxSprite;

    override public function create():Void {
        super.create();

        FlxG.mouse.visible = false;
        
        warning = new FlxSprite();
        warning.loadGraphic(Paths.image('warning/warning'));
        add(warning);

        FlxG.sound.cache(Paths.sound('whoosh'));
        FlxG.sound.cache(Paths.music('Menu'));
    }

    override public function update(elapsed:Float):Void {        
        if (FlxG.keys.justPressed.ENTER) {
            FlxG.switchState(new MenuState());
        }

        super.update(elapsed);
    }
}
