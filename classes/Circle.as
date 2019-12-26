package classes{
    import flash.display.Sprite;
    import flash.net.URLRequest;
    import flash.display.Loader;
    public class Circle extends Sprite{
        public var url:String;
        public var beforeTime:Date;
        public function Circle(){
            url = "res/circle.png";
            beforeTime = new Date;
            showPic();
        }
        public function showPic(){
            var Req:URLRequest = new URLRequest(url);
            var Ldr:Loader = new Loader;
            Ldr.load(Req);
            this.addChild(Ldr);
        }
        public function setScale(num:Number){
            this.scaleX = num;
            this.scaleY = num;
        }
    }
}