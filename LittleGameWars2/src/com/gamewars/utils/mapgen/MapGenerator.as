package com.gamewars.utils.mapgen
{
  import com.gamewars.enums.GroundType;
  import com.gamewars.structures.TileMap;
  import com.gamewars.utils.FMath;

  /** Générateur de maps */
  public class MapGenerator
  {
    /** Dimensions souhaités pour la map */
    private var mWidth:uint, mHeight:uint;
    
    /** Constructeur */
    public function MapGenerator(pWidth:uint, pHeight:uint)
    {
      mWidth = pWidth;
      mHeight = pHeight;
    }
    
    /** Crée une nouvelle map et renvoie le resultat */
    public function newMap() : TileMap
    {
      var map:TileMap = new TileMap(mWidth, mHeight, null);
      processGroundRd(map, GroundType.FOREST.mId, 15);
      processGroundRd(map, GroundType.MOUNTAIN.mId, 10);
      processGroundRd(map, GroundType.WATER.mId, 90);
      return map;
    }
    
    /** Ajoute le type de terrain aléatoirement en pourcentage de la map */
    private function processGroundRd(pMap:TileMap, pGround:uint, pPercent:Number) : void
    {
      var i:uint = 0;
      var count:uint = pMap.mWidth * pMap.mHeight * pPercent/100;
      while (i < count)
      {
        pMap.setGroundAt(Math.random() * pMap.mWidth, Math.random() * pMap.mHeight, pGround);
        i++;
      }
    }
    
    /** Ajoute des lacs */
    private function addLake(pMap:TileMap) : void
    {
      var radWidth:uint = 1;//2+Math.random() * 2;
      var radHeight:uint = 1;//2+Math.random() * 2;
      var rdx:uint = radWidth/2+(Math.random() * (mWidth-radWidth/2));
      var rdy:uint = radHeight/2+(Math.random() * (mHeight-radHeight/2));
      
      var left:uint = Math.max(rdx - radWidth, 0);
      var top:uint = Math.max(rdy-radHeight, 0);
      var right:uint = Math.min(rdx + radWidth, mWidth-1);
      var bot:uint = Math.min(rdy + radHeight, mHeight-1);
      
      for (var xx:uint = left; xx < right; xx++)
      {
        for (var yy:uint = top; yy < bot; yy++)
        {
          pMap.mTiles[xx+yy*mWidth] = GroundType.WATER.mId;
        }
      }
    }
  }
}