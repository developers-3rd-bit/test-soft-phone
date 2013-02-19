package
{
   import flash.geom.Rectangle;
   
   import spark.core.SpriteVisualElement;
   
   public class SilenceLabelIndicator extends SpriteVisualElement
   {
      private var _silenceLabelIndicatorColor:McSilenceLevelIndicatorColor;
      private var _silenceLabelIndicatorGrey:McSilenceLevelIndicatorGrey;
      private var _scrollRect:Rectangle;
      private var _indicatorWidth:Number;
      
      public function SilenceLabelIndicator()
      {
         super();
         
         _silenceLabelIndicatorColor = new McSilenceLevelIndicatorColor();
         _silenceLabelIndicatorGrey = new McSilenceLevelIndicatorGrey();
         _scrollRect = new Rectangle(0, 0, 0, _silenceLabelIndicatorColor.height);
         
         _silenceLabelIndicatorColor.scrollRect = _scrollRect;
         _indicatorWidth = _silenceLabelIndicatorColor.width;
         
         this.addChild(_silenceLabelIndicatorGrey);
         this.addChild(_silenceLabelIndicatorColor);
      }
      
      public function onMicSignal(value:Number):void
      {
         if(value < 0 || value > 100) return;
         _scrollRect.width = (_indicatorWidth / 100) * value;
         _silenceLabelIndicatorColor.scrollRect = _scrollRect;
      }
   }
}