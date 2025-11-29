package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;

class MenuState extends FlxState {
    var logo:FlxSprite;
    var edge:FlxSprite;
    var select:FlxSprite;
    var deleteData:FlxSprite;

    var red:FlxSprite;
    var green:FlxSprite;
    var blue:FlxSprite;

    var newGame:FlxSprite;

    var animatronics:Array<String> = ['candy', 'sindy', 'chester', 'ping', 'blank', 'rat', 'cat'];
    var animElapsed:Float;

    var redPos:Float = 0;
    var greenPos:Float = 0;
    var bluePos:Float = 0;

    override public function create() {
        super.create();
        trace('menu starting');

        FlxG.mouse.useSystemCursor = true;

        var save:FlxSave = new FlxSave();
        save.bind('fnac2hx');

        logo = new FlxSprite();
        logo.frames = Paths.getSparrowAtlas('menu/logo');
        logo.animation.addByPrefix('shake', 'shake', 2, true);
        logo.animation.play('shake');
        logo.blend = ADD;
        add(logo);

        red = new FlxSprite();
        red.frames = Paths.getSparrowAtlas('menu/animatronics/animatronic_red');
        red.animation.addByPrefix('candy', 'candy', 2, true);
        red.animation.addByPrefix('sindy', 'sindy', 2, true);
        red.animation.addByPrefix('chester', 'chester', 2, true);
        red.animation.addByPrefix('ping', 'ping', 2, true);
        red.animation.addByPrefix('blank', 'blank', 2, true);
        red.animation.addByPrefix('rat', 'rat', 2, true);
        red.animation.addByPrefix('cat', 'cat', 2, true);
        red.animation.play('candy');
        red.blend = ADD;
        add(red);
        redPos = red.x;

        green = new FlxSprite();
        green.frames = Paths.getSparrowAtlas('menu/animatronics/animatronic_green');
        green.animation.addByPrefix('candy', 'candy', 2, true);
        green.animation.addByPrefix('sindy', 'sindy', 2, true);
        green.animation.addByPrefix('chester', 'chester', 2, true);
        green.animation.addByPrefix('ping', 'ping', 2, true);
        green.animation.addByPrefix('blank', 'blank', 2, true);
        green.animation.addByPrefix('rat', 'rat', 2, true);
        green.animation.addByPrefix('cat', 'cat', 2, true);
        green.animation.play('candy');
        green.blend = ADD;
        add(green);
        greenPos = green.x;

        blue = new FlxSprite();
        blue.frames = Paths.getSparrowAtlas('menu/animatronics/animatronic_blue');
        blue.animation.addByPrefix('candy', 'candy', 2, true);
        blue.animation.addByPrefix('sindy', 'sindy', 2, true);
        blue.animation.addByPrefix('chester', 'chester', 2, true);
        blue.animation.addByPrefix('ping', 'ping', 2, true);
        blue.animation.addByPrefix('blank', 'blank', 2, true);
        blue.animation.addByPrefix('rat', 'rat', 2, true);
        blue.animation.addByPrefix('cat', 'cat', 2, true);
        blue.animation.play('candy');
        blue.blend = ADD;
        add(blue);
        bluePos = blue.x;

        newGame = new FlxSprite(52, 456);
        newGame.frames = Paths.getSparrowAtlas('menu/buttons/new_game');
        newGame.animation.addByPrefix('idle', 'idle', 2, true);
        newGame.animation.play('idle');
        newGame.blend = ADD;
        add(newGame);

        select = new FlxSprite(0, 466);
        select.loadGraphic(Paths.image('menu/select'));
        select.blend = ADD;
        add(select);

        deleteData = new FlxSprite(720, 745);
        deleteData.loadGraphic(Paths.image('menu/delete'));
        add(deleteData);

        var by:FlxSprite = new FlxSprite(880, 0);
        by.loadGraphic(Paths.image('menu/by'));
        add(by);

        edge = new FlxSprite();
        edge.frames = Paths.getSparrowAtlas('menu/edge');
        edge.animation.addByPrefix('edge', 'edge', 25, true);
        edge.color = FlxColor.fromRGB(75, 0, 130);
        edge.blend = ADD;
        add(edge);

        for (spr in [logo, red, blue, green, newGame, select, deleteData, by, edge]) spr.visible = false;

        new FlxTimer().start(0.5, function(_) {
            for (spr in [logo, red, blue, green, newGame, select, deleteData, by, edge]) spr.visible = true;
            edge.animation.play('edge');
            FlxG.sound.playMusic(Paths.music('Menu'));
            FlxG.sound.play(Paths.sound('whoosh'));
            FlxTween.tween(edge, {alpha: 0}, 1.0);
        });
    }

    override function update(elapsed:Float):Void {
        super.update(elapsed);
        animElapsed += elapsed;

        if (animElapsed >= 5.0) {
            var randomAnim = animatronics[Math.floor(Math.random() * animatronics.length)];
            red.animation.play(randomAnim);
            green.animation.play(randomAnim);
            blue.animation.play(randomAnim);
            trace('cur anim ' + randomAnim);
            animElapsed = 0;
        }

        red.x = redPos + Math.random() * 4 - 2;
        green.x = greenPos + Math.random() * 10 - 3;
        blue.x = bluePos + Math.random() * 15 - 9;
    }
}