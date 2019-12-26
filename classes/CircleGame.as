package classes {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event; 							
	import flash.events.MouseEvent; 
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	public class CircleGame extends MovieClip {
		public var result:int;
		public var array:Array;
		public var i:int;
		public var timer:Timer;
		public var num:int;
		
		
		public function CircleGame() {
			// constructor code
			result = 0;
			text.text = result.toString();
			array = new Array();
			endResult.visible = false;
			btn_one.addEventListener(MouseEvent.MOUSE_UP, start);
			btn_two.addEventListener(MouseEvent.MOUSE_UP, start);
			btn_three.addEventListener(MouseEvent.MOUSE_UP, start);
		}

		public function start(e:MouseEvent):void{
			i = 60;
			result = 0;
			timerStart();
			time.text = String(60);
			endResult.visible = false;
			if (e.currentTarget.name == "btn_one") {
				newCircle();
				num = 1;
			}else if(e.currentTarget.name == "btn_two"){
				newCircle();
				newCircle();
				num = 2;
			}else if(e.currentTarget.name == "btn_three"){
				newCircle();
				newCircle();
				newCircle();
				num = 3;
			}
			btn_one.visible = false;
			btn_two.visible = false;
			btn_three.visible = false;
			text_one.visible = false;
			text_two.visible = false;
			text_three.visible = false;
		}

		public function newCircle():void{
			var circle:Circle = new Circle();
			array.push(circle);
			circle.setScale(Math.random()*0.6 + 0.1);
			circle.x = Math.random() * 900;
			circle.y = Math.random() * 900;
			circle.addEventListener(MouseEvent.MOUSE_DOWN, OnbuttonMouseDown);
			this.addChild(circle);
		}
		public function OnbuttonMouseDown(e:MouseEvent):void{
			var circle:Circle = (Circle)(e.currentTarget); 
			var thisTime:Date = new Date;
			var gap:int = thisTime.valueOf() - circle.beforeTime.valueOf();
			circle.beforeTime = thisTime;
			circle.setScale(Math.random()*0.6 + 0.1);
			circle.x = Math.random() * 900;
			circle.y = Math.random() * 900;
			if(gap < 100){
				result += 10;
			}else if(gap < 500){
				result += 3;
			}
			else{
				result += 1;
			}
			text.text = result.toString();
		}

		private function timerStart():void{
			timer = new Timer(1000, 60);
			timer.addEventListener(TimerEvent.TIMER, onTimerHandler);
			timer.start();
		}

		private function onTimerHandler(e:TimerEvent):void	{
			var timer:Timer = (Timer)(e.currentTarget); 
			time.text = String(--i);
			if(i == 0){
				timer.stop();
				btn_one.visible = true;
				btn_two.visible = true;
				btn_three.visible = true;
				text_one.visible = true;
				text_two.visible = true;
				text_three.visible = true;
				endResult.visible = true;
				for (var j:int = num; j > 0; j--){
					this.removeChildAt(this.numChildren - 1);
				}
			}
		}

		
	}
	
}
